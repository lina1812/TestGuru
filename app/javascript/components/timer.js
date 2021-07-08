document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('span.timer')
  
  if (control) { 
    new Timer(control)
  }
})

class Timer{
  constructor(span){
    this.span = span
    this.init()
  }
  
  recalcTime() {
    let current = this.span.dataset['left']
    if (current <= 0) {
      clearInterval(this.timer)
      document.querySelector('.finish_link').click();
      return
    }
    let minutes = Math.floor(current / 60)
    let seconds = current % 60
    if (seconds < 10) { seconds = "0" + seconds }
    this.span.innerHTML = minutes + ':' + seconds
    this.span.dataset['left'] = current - 1
  }

  init() {
    this.timer = setInterval(() => {
      this.recalcTime()
    }, 1000)
    document.addEventListener('turbolinks:load', () => {
      clearInterval(this.timer)
    })
  }

}