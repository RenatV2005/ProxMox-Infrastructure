// ============================================
// IT-FOR-ALL.DE — Hero Log Animation
// Simuliert einen System-/Karriere-Log der
// sequenziell eingeblendet wird.
// ============================================

const LOG_LINES = [
  { ts: '[boot]', cls: 'log-dim', text: 'Initialisiere Profil renat@it-for-all ...' },
  { ts: '[ 0.41]', cls: 'log-ok', text: 'role.current = "IT Support Specialist"' },
  { ts: '[ 0.88]', cls: 'log-info', text: 'role.target  = "Junior Linux Systemadministrator"' },
  { ts: '[ 1.20]', cls: 'log-cmd', text: '$ systemctl status homelab.service' },
  { ts: '[ 1.34]', cls: 'log-ok', text: '● homelab.service — active (running)' },
  { ts: '[ 1.71]', cls: 'log-cmd', text: '$ stack --list' },
  { ts: '[ 1.85]', cls: 'log-dim', text: '  pfSense · Proxmox · Zabbix · AD/DNS · Docker' },
  { ts: '[ 2.30]', cls: 'log-cmd', text: '$ cert --check AZ-900' },
  { ts: '[ 2.44]', cls: 'log-ok', text: '  PASSED ✓' },
  { ts: '[ 2.90]', cls: 'log-warn', text: '  WARN: LPIC-1 in progress — ETA pending' },
  { ts: '[ 3.40]', cls: 'log-info', text: 'mindset.shift: "tools installieren" → "systeme verstehen"' },
  { ts: '[ 3.95]', cls: 'log-dim', text: 'awaiting next assignment ...' },
];

function initHeroLog() {
  const body = document.getElementById('logBody');
  if (!body) return;

  const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  if (reduceMotion) {
    body.innerHTML = LOG_LINES.map(renderLine).join('');
    return;
  }

  let i = 0;
  function next() {
    if (i >= LOG_LINES.length) {
      const cursor = document.createElement('div');
      cursor.className = 'log-line';
      cursor.style.opacity = '1';
      cursor.innerHTML = `<span class="log-dim">[ ready] </span><span class="cursor-blink"></span>`;
      body.appendChild(cursor);
      return;
    }
    const el = document.createElement('div');
    el.className = 'log-line';
    el.style.animationDelay = '0s';
    el.innerHTML = renderLineInner(LOG_LINES[i]);
    body.appendChild(el);
    i++;
    setTimeout(next, 260);
  }

  next();
}

function renderLineInner(line) {
  return `<span class="log-ts">${line.ts}</span> <span class="${line.cls}">${line.text}</span>`;
}

function renderLine(line) {
  return `<div class="log-line" style="opacity:1">${renderLineInner(line)}</div>`;
}

// ============================================
// Project Filtering
// ============================================

function initProjectFilters() {
  const buttons = document.querySelectorAll('.filter-btn');
  const cards = document.querySelectorAll('.project-card');

  buttons.forEach(btn => {
    btn.addEventListener('click', () => {
      const tag = btn.dataset.filter;

      buttons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      cards.forEach(card => {
        const tags = card.dataset.tags || '';
        if (tag === 'all' || tags.includes(tag)) {
          card.classList.remove('hidden');
        } else {
          card.classList.add('hidden');
        }
      });
    });
  });
}

document.addEventListener('DOMContentLoaded', () => {
  initHeroLog();
  initProjectFilters();
});
