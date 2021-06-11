document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.progress-bar')
  
  if (control) { 
    new CountProgress(control)
  }
})

class CountProgress{
  constructor(control){
    this.control = control
    
    this.count()
  }

  count() {
    let max_value = parseInt(this.control.dataset.maxValue)
    let now_value = parseInt(this.control.dataset.nowValue)
    
    let progress = (now_value / max_value) * 100
    
    this.control.style.width = progress + "%"
  }

}