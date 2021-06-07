document.addEventListener('turbolinks:load', function() {
  let controls = document.querySelectorAll('.password_field')  
  if (controls) { 
    new PasswordConfirmation(controls)
  }
})

class PasswordConfirmation{
  constructor(inputs){
    this.inputs = inputs
    this.password = document.getElementById('password')
    this.confirm_password = document.getElementById('confirm_password')
    this.setup()
  }
  
  checkPasswords() {
    if (this.confirm_password.value == '') {
      this.inputs.forEach((password_field) =>  {
        password_field.classList.remove('is-valid')
        password_field.classList.remove('is-invalid')
      })
    }
    else if (this.password.value == this.confirm_password.value) {
      this.inputs.forEach((password_field) =>  {
        password_field.classList.add('is-valid')
        password_field.classList.remove('is-invalid')
      })
    }
    else { 
      this.inputs.forEach((password_field) => {
        password_field.classList.remove('is-valid')
        password_field.classList.add('is-invalid')
      })
    }
  }
  
  setup() {
    this.inputs.forEach((input) => {
      input.addEventListener('keyup', event => { this.checkPasswords() } )
    })
  }
}
