// Command palette: Cmd/Ctrl+K, "/" or the search icon opens it.
// Empty: the main pages and actions. Typing: matching pages and actions, then full-text results from the
// Pagefind index (/pagefind/, built at deploy), which loads the first time the palette opens.
(function () {
  'use strict';

  var dialog = document.getElementById('cmdk');
  var dataEl = document.getElementById('cmdk-data');
  if (!dialog || !dataEl || typeof dialog.showModal !== 'function') return; // the search links keep working

  var input = dialog.querySelector('.cmdk-input');
  var list = dialog.querySelector('.cmdk-list');
  var status = dialog.querySelector('.cmdk-status');
  var data = JSON.parse(dataEl.textContent);
  var isMac = /Mac|iPhone|iPad/.test(navigator.platform || navigator.userAgent);

  var options = [];   // rendered options, in order
  var active = -1;
  var pagefind = null;
  var pagefindLoading = null;
  var pagefindFailed = false;
  var searchSeq = 0;

  // The pages and actions offered before anything is typed.
  var FEATURED = ['/', '/blog', '/talks', '/youtube', '/publications', '/about-me'];
  var QUICK = ['/contact', '/book', '/talks/invite-me', '/files/CV/cesar-resume.pdf'];

  function isDark() {
    return document.documentElement.getAttribute('data-theme') === 'dark';
  }

  function commands() {
    var out = data.pages.map(function (p) {
      return { title: p.title, hint: p.group, url: p.url };
    });
    out.push({
      title: isDark() ? 'Switch to light mode' : 'Switch to dark mode', hint: 'Theme', keep: true,
      run: function () { if (typeof modeSwitcher === 'function') modeSwitcher(); }
    });
    if (navigator.clipboard) {
      out.push({
        title: 'Copy link to this page', hint: 'Share',
        run: function () {
          navigator.clipboard.writeText(location.href.split('#')[0]).then(function () { announce('Link copied'); });
        }
      });
    }
    data.links.forEach(function (link) {
      out.push({ title: link.title, hint: 'Profile', url: link.url, external: true });
    });
    return out;
  }

  function byUrl(cmds, urls) {
    return urls.map(function (u) {
      return cmds.filter(function (c) { return c.url === u; })[0];
    }).filter(Boolean);
  }

  // Simple ranking: a title that starts with the query, then a word that does, then anywhere.
  function score(cmd, q) {
    var title = cmd.title.toLowerCase();
    var text = title + ' ' + (cmd.hint || '').toLowerCase();
    if (title.indexOf(q) === 0) return 3;
    if (text.indexOf(' ' + q) > -1) return 2;
    if (text.indexOf(q) > -1) return 1;
    return 0;
  }

  function kindOf(url) {
    if (/\/blog\/./.test(url)) return 'Essay';
    if (/\/tag\//.test(url)) return 'Topic';
    return 'Page';
  }

  function announce(text) {
    status.textContent = text;
  }

  function render(groups) {
    list.textContent = '';
    options = [];
    groups.forEach(function (group, g) {
      if (!group.items.length && !group.note) return;
      var section = document.createElement('div');
      section.setAttribute('role', 'group');
      var label = document.createElement('div');
      label.className = 'cmdk-group';
      label.id = 'cmdk-group-' + g;
      label.textContent = group.label;
      section.setAttribute('aria-labelledby', label.id);
      section.appendChild(label);
      if (group.note) {
        var note = document.createElement('div');
        note.className = 'cmdk-note';
        note.textContent = group.note;
        section.appendChild(note);
      }
      group.items.forEach(function (item) {
        var el = document.createElement(item.url ? 'a' : 'div');
        el.className = 'cmdk-option';
        el.id = 'cmdk-opt-' + options.length;
        el.setAttribute('role', 'option');
        el.setAttribute('aria-selected', 'false');
        if (item.url) {
          el.href = item.url;
          el.tabIndex = -1;
          if (item.external) { el.target = '_blank'; el.rel = 'noopener'; }
        }
        var title = document.createElement('span');
        title.className = 'cmdk-title';
        title.textContent = item.title;
        el.appendChild(title);
        if (item.excerpt) {
          // Pagefind's excerpt: escaped page text with <mark> around the matches.
          var excerpt = document.createElement('span');
          excerpt.className = 'cmdk-excerpt';
          excerpt.innerHTML = item.excerpt;
          el.appendChild(excerpt);
        }
        if (item.hint) {
          var hint = document.createElement('span');
          hint.className = 'cmdk-hint';
          hint.textContent = item.hint + (item.external ? ' ↗' : '');
          el.appendChild(hint);
        }
        var index = options.length;
        el.addEventListener('mousemove', function () { if (active !== index) setActive(index, false); });
        el.addEventListener('click', function (event) { activate(index, event); });
        options.push({ el: el, item: item });
        section.appendChild(el);
      });
      list.appendChild(section);
    });
    setActive(options.length ? 0 : -1, false);
  }

  function setActive(index, scroll) {
    if (active > -1 && options[active]) options[active].el.setAttribute('aria-selected', 'false');
    active = index;
    if (active > -1) {
      var el = options[active].el;
      el.setAttribute('aria-selected', 'true');
      input.setAttribute('aria-activedescendant', el.id);
      if (scroll) el.scrollIntoView({ block: 'nearest' });
    } else {
      input.removeAttribute('aria-activedescendant');
    }
  }

  function activate(index, event) {
    var option = options[index];
    if (!option) return;
    var item = option.item;
    if (item.run) {
      if (event) event.preventDefault();
      item.run();
      if (item.keep) update(); else close();
      return;
    }
    // Links navigate by themselves on click; from the keyboard, follow them here.
    if (!event) option.el.click();
    if (!item.external) close();
  }

  function loadPagefind() {
    if (pagefind || pagefindFailed) return Promise.resolve(pagefind);
    if (!pagefindLoading) {
      pagefindLoading = import('/pagefind/pagefind.js')
        .then(function (module) {
          return Promise.resolve(module.options({ excerptLength: 18 })).then(function () {
            pagefind = module;
            return module;
          });
        })
        .catch(function () {
          pagefindFailed = true;
          return null;
        });
    }
    return pagefindLoading;
  }

  function update() {
    var raw = input.value.trim();
    var q = raw.toLowerCase();
    var cmds = commands();
    var seq = ++searchSeq;

    if (!q) {
      var actions = byUrl(cmds, QUICK).concat(cmds.filter(function (c) { return c.run; }));
      render([
        { label: 'Pages', items: byUrl(cmds, FEATURED) },
        { label: 'Actions', items: actions }
      ]);
      announce('');
      return;
    }

    var matches = cmds
      .map(function (c) { return { c: c, s: score(c, q) }; })
      .filter(function (m) { return m.s > 0; })
      .sort(function (a, b) { return b.s - a.s; })
      .slice(0, 5)
      .map(function (m) { return m.c; });
    var jump = { label: 'Jump to', items: matches };
    var fullSearch = { title: 'Search everything for “' + raw + '”', hint: 'Search page', url: '/search?q=' + encodeURIComponent(raw) };

    render([jump, { label: 'Search', items: [], note: 'Searching…' }]);

    loadPagefind().then(function (pf) {
      if (seq !== searchSeq) return null;
      if (!pf) {
        render([jump, { label: 'Search', items: [fullSearch] }]);
        return null;
      }
      return pf.debouncedSearch(raw, {}, 120).then(function (search) {
        if (!search || seq !== searchSeq) return null;
        return Promise.all(search.results.slice(0, 7).map(function (r) { return r.data(); })).then(function (rows) {
          if (seq !== searchSeq) return;
          var results = rows.map(function (d) {
            return { title: (d.meta && d.meta.title) || d.url, excerpt: d.excerpt, url: d.url, hint: kindOf(d.url) };
          });
          var total = search.results.length;
          if (total) results.push(fullSearch);
          render([jump, total ? { label: 'Search', items: results } : { label: 'Search', items: [fullSearch], note: 'No pages contain “' + raw + '”.' }]);
          announce(total + (total === 1 ? ' result' : ' results'));
        });
      });
    });
  }

  var opener = null;

  function open() {
    var drawer = document.getElementById('drawer-menu');
    if (drawer && drawer.open) drawer.close();
    opener = dialog.contains(document.activeElement) ? null : document.activeElement;
    input.value = '';
    update();
    dialog.showModal();
    input.focus();
    loadPagefind();
  }

  function close() {
    if (dialog.open) dialog.close();
    restoreFocus();
  }

  function isTyping(el) {
    if (!el || (el.closest && el.closest('dialog:not([open])'))) return false;
    return el.isContentEditable || /^(INPUT|TEXTAREA|SELECT)$/.test(el.tagName);
  }

  input.addEventListener('input', update);

  // Give focus back to where it was (Esc, backdrop, a command): it must not stay in the closed dialog.
  // Runs at once from close() and again on the dialog's own (later) "close" event, e.g. after Esc.
  function restoreFocus() {
    if (dialog.open) return; // reopened before the browser's "close" event arrived
    if (opener && opener !== document.body && document.contains(opener) && opener.focus) {
      opener.focus({ preventScroll: true });
    } else if (document.activeElement === input) {
      input.blur();
    }
    opener = null;
  }

  dialog.addEventListener('close', restoreFocus);

  input.addEventListener('keydown', function (event) {
    if (event.key === 'ArrowDown' || event.key === 'ArrowUp') {
      event.preventDefault();
      if (!options.length) return;
      var step = event.key === 'ArrowDown' ? 1 : -1;
      setActive((active + step + options.length) % options.length, true);
    } else if (event.key === 'Enter') {
      event.preventDefault();
      if (active > -1) activate(active, null);
      else if (input.value.trim()) location.href = '/search?q=' + encodeURIComponent(input.value.trim());
    }
  });

  var closeButton = dialog.querySelector('.cmdk-close');
  closeButton.addEventListener('click', close);
  // "esc" means nothing on a touch screen.
  if (window.matchMedia && window.matchMedia('(pointer: coarse)').matches) closeButton.textContent = 'Cancel';

  // A click on the backdrop closes it (browsers without closedby="any").
  dialog.addEventListener('click', function (event) {
    if (event.target === dialog) close();
  });

  document.addEventListener('keydown', function (event) {
    if ((event.metaKey || event.ctrlKey) && !event.altKey && (event.key === 'k' || event.key === 'K')) {
      event.preventDefault();
      if (dialog.open) close(); else open();
    } else if (event.key === '/' && !dialog.open && !event.metaKey && !event.ctrlKey && !isTyping(event.target)) {
      event.preventDefault();
      open();
    }
  });

  // The search icons (navbar and mobile menu) open the palette; without JavaScript they link to /search.
  document.querySelectorAll('a.site-nav-icon[href$="/search"]').forEach(function (link) {
    link.addEventListener('click', function (event) {
      if (event.metaKey || event.ctrlKey || event.shiftKey || event.button !== 0) return;
      event.preventDefault();
      open();
    });
    link.setAttribute('aria-haspopup', 'dialog');
    link.title = 'Search (' + (isMac ? '⌘K' : 'Ctrl+K') + ')';
    var kbd = link.querySelector('.site-nav-kbd');
    if (kbd) kbd.textContent = isMac ? '⌘K' : 'Ctrl K';
  });
})();
