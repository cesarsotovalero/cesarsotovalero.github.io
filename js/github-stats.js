// Live star and fork counts for open-source projects: fills every
// <span class="gh-stars|gh-forks" data-repo="owner/name"> on the page (one request per repository).
(function () {
  var fmt = function (n) { return n >= 1000 ? (n / 1000).toFixed(1).replace(/\.0$/, '') + 'k' : String(n); };
  var repos = {};
  document.querySelectorAll('.gh-stars[data-repo]').forEach(function (el) { repos[el.dataset.repo] = true; });
  Object.keys(repos).forEach(function (repo) {
    fetch('https://api.github.com/repos/' + repo)
      .then(function (r) { return r.ok ? r.json() : null; })
      .then(function (data) {
        if (!data) return;
        document.querySelectorAll('.gh-stars[data-repo="' + repo + '"]').forEach(function (el) { el.textContent = fmt(data.stargazers_count); });
        document.querySelectorAll('.gh-forks[data-repo="' + repo + '"]').forEach(function (el) { el.textContent = fmt(data.forks_count); });
      })
      .catch(function () {});
  });
}());
