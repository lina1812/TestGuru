document.addEventListener('turbolinks:load', function() {
  
  let controls = document.querySelectorAll('.edit-title')
  
  if (controls) {
    controls.forEach((control) => {
      new EditTitle(control)
    })
  }
})


class EditTitle{
  constructor(control){
    this.control = control
    this.testId = this.control.dataset.testId

    errors = document.querySelector('.resource-errors')
    if (errors && errors.dataset.resourceId == this.testId) {
      this.formInlineHandler()
    }

    this.setup()
  }

  formInlineLinkHandler(event) {
    event.preventDefault()

    this.formInlineHandler()
  }
  
  formInlineHandler() {
    let link = this.control.querySelector('.form-inline-link[data-test-id="' + this.testId + '"]')
    let testTitle = this.control.querySelector('.test-title[data-test-id="' + this.testId + '"]')
    let formInline = this.control.querySelector('.form-inline[data-test-id="' + this.testId + '"]')

    testTitle.classList.toggle('hide')
    formInline.classList.toggle('hide')
    
    if (formInline.classList.contains('hide')) {
      link.textContent = link.dataset.textEdit
    } else {
      link.textContent = link.dataset.textCancel 
    }
  }



  setup() {
    this.control.querySelector('.form-inline-link').addEventListener('click', event => { this.formInlineLinkHandler(event) } )
  }
}
