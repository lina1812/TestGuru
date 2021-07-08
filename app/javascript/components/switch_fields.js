document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.selectSwitchFields')

  if (control) { 
    new SwitchFields(control)
  }
})

class SwitchFields{
  constructor(select){
    this.select = select
  
    this.setup()
  }
 
  switchFields(){
      
      document.querySelectorAll('.allVariant').forEach((elem) =>  {
        elem.classList.add('hide')
      })

      document.querySelectorAll('.variant_'+this.select.value).forEach((elem) =>  {
        elem.classList.remove('hide')
      }) 
  }
 
  setup() {
    this.select.addEventListener('change', event => { this.switchFields() } )
    this.switchFields()
  }

} 

  
