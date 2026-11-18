#!/usr/bin/env node
// Load key pages of the built site in headless Chromium and fail on uncaught JavaScript errors.
// Third-party hosts are blocked, so the check also covers visitors with an ad or tracker blocker.
//
// Usage: node scripts/check_console_errors.js [site_dir] [page ...]
const http = require('http');
const fs = require('fs');
const path = require('path');
const { chromium } = require('playwright');

const siteDir = path.resolve(process.argv[2] || '_site');
const pages = process.argv.slice(3).length ? process.argv.slice(3) : [
  '/',
  '/blog.html',
  '/about-me.html',
  '/talks.html',
  '/publications.html',
  '/book.html',
  '/search.html',
  '/404.html',
];

const types = {
  '.html': 'text/html', '.css': 'text/css', '.js': 'application/javascript', '.json': 'application/json',
  '.svg': 'image/svg+xml', '.png': 'image/png', '.jpg': 'image/jpeg', '.jpeg': 'image/jpeg', '.webp': 'image/webp',
  '.woff': 'font/woff', '.woff2': 'font/woff2', '.ttf': 'font/ttf', '.otf': 'font/otf',
};

// Minimal static server: resolves extensionless URLs to .html, like GitHub Pages.
function serve() {
  return http.createServer((req, res) => {
    let file = path.join(siteDir, decodeURIComponent(new URL(req.url, 'http://x').pathname));
    if (!file.startsWith(siteDir)) { res.writeHead(403).end(); return; }
    if (fs.existsSync(file) && fs.statSync(file).isDirectory()) file = path.join(file, 'index.html');
    if (!fs.existsSync(file) && fs.existsSync(file + '.html')) file += '.html';
    if (!fs.existsSync(file)) { res.writeHead(404).end(); return; }
    res.writeHead(200, { 'Content-Type': types[path.extname(file).toLowerCase()] || 'application/octet-stream' });
    fs.createReadStream(file).pipe(res);
  }).listen(0);
}

(async () => {
  // The newest post is checked too, since posts load the most scripts.
  const posts = fs.readdirSync(path.join(siteDir, 'blog')).filter(f => f.endsWith('.html'));
  const newest = fs.readFileSync(path.join(siteDir, 'feed.xml'), 'utf8').match(/<entry>.*?<link href="https?:\/\/[^/]+(\/blog\/[^"]+\.html)"/s);
  if (newest) pages.push(newest[1]); else if (posts.length) pages.push('/blog/' + posts[0]);

  const server = serve();
  const base = `http://localhost:${server.address().port}`;
  // PLAYWRIGHT_CHANNEL=chrome uses an installed Google Chrome instead of Playwright's own Chromium.
  const browser = await chromium.launch(process.env.PLAYWRIGHT_CHANNEL ? { channel: process.env.PLAYWRIGHT_CHANNEL } : {});
  let failures = 0;
  for (const viewport of [{ width: 1440, height: 900 }, { width: 390, height: 844 }]) {
    const context = await browser.newContext({ viewport });
    await context.route(url => !url.toString().startsWith(base), route => route.abort());
    const page = await context.newPage();
    for (const url of pages) {
      const errors = [];
      page.removeAllListeners('pageerror');
      page.on('pageerror', e => errors.push(e.message));
      await page.goto(base + url, { waitUntil: 'load' });
      // Scroll through the page: some scripts only run on scroll or when content comes into view.
      await page.evaluate(async () => {
        for (let y = 0; y < document.body.scrollHeight; y += 800) {
          window.scrollTo(0, y);
          await new Promise(resolve => setTimeout(resolve, 20));
        }
      });
      await page.waitForTimeout(300);
      const label = `${viewport.width}px ${url}`;
      if (errors.length) {
        failures += errors.length;
        console.log(`FAIL ${label}\n  ${errors.join('\n  ')}`);
      } else {
        console.log(`ok   ${label}`);
      }
    }
    await context.close();
  }
  await browser.close();
  server.close();
  if (failures) {
    console.error(`\n${failures} uncaught JavaScript error(s).`);
    process.exit(1);
  }
})();
