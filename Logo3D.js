document.addEventListener('DOMContentLoaded', function () {

  (function () {
    var fig = document.querySelector('.hero-fig');
    // ... semua kode lo yang sekarang ...
    (function () {
        var fig = document.querySelector('.hero-fig');
        var hero = document.querySelector('.hero');
        if (!fig || !hero) return;
        if (window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
        
        var svg = fig.querySelector('svg');
        var layers = [];
        
        if (svg) {
            svg.querySelectorAll('.flow-line').forEach(function (el) {
                layers.push({ el: el, depth: 0.5 });
            });
            svg.querySelectorAll('.flow-node').forEach(function (el) {
                layers.push({ el: el, depth: el.classList.contains('n3') ? 0.9 : 1.6 });
            });
        }
        
        var tx = 0, ty = 0, cx = 0, cy = 0, raf = null;
        
        function frame() {
            cx += (tx - cx) * 0.08;
            cy += (ty - cy) * 0.08;
            
            fig.style.setProperty('--rx', (-cy * 9).toFixed(2) + 'deg');
            fig.style.setProperty('--ry', (cx * 12).toFixed(2) + 'deg');
            
            layers.forEach(function (l) {
                l.el.style.translate = (cx * l.depth * 10).toFixed(2) + 'px ' + (cy * l.depth * 10).toFixed(2) + 'px';
            });
            
            if (Math.abs(tx - cx) > 0.001 || Math.abs(ty - cy) > 0.001) {
                raf = requestAnimationFrame(frame);
            } else {
                raf = null;
            }
        }
        
        function kick() {
            if (!raf) raf = requestAnimationFrame(frame);
        }
        
        hero.addEventListener('mousemove', function (e) {
            var r = hero.getBoundingClientRect();
            tx = ((e.clientX - r.left) / r.width - 0.5) * 2;
            ty = ((e.clientY - r.top) / r.height - 0.5) * 2;
            kick();
        });
        
        hero.addEventListener('mouseleave', function () {
            tx = 0;
            ty = 0;
            kick();
        });
    })();
})();

});