/* Reading progress indicator for article pages.
   Drives the #reading-progress bar in layouts/_default/single.html.
   Styling lives in assets/css/custom.css under "Post Pages". */
(function () {
  'use strict'

  var bar = document.getElementById('reading-progress')
  if (!bar) return

  function updateProgress() {
    var doc = document.documentElement
    var max = doc.scrollHeight - window.innerHeight
    var progress = max > 0 ? Math.min(Math.max(window.scrollY / max, 0), 1) : 0
    bar.style.width = (progress * 100).toFixed(2) + '%'
  }

  updateProgress()
  window.addEventListener('scroll', updateProgress, { passive: true })
  window.addEventListener('resize', updateProgress, { passive: true })
})()
