document.addEventListener('turbolinks:load', function() {
  var controls = document.querySelectorAll('.password_field')
  
  if (controls) { 
    for (var i = 0; i< controls.length; i++) {
     controls[i].addEventListener('keyup', checkPasswords )
    }
  }

})

function checkPasswords() {
  if (document.getElementById('confirm_password').value == '') {
    password_fields = document.querySelectorAll('.password_field')
    for (var i = 0; i< password_fields.length; i++) {
      password_fields[i].classList.remove('is-valid')
      password_fields[i].classList.remove('is-invalid')
    }
  } 
  else {
    if (document.getElementById('password').value == document.getElementById('confirm_password').value) {
      password_fields = document.querySelectorAll('.password_field')
      for (var i = 0; i< password_fields.length; i++) {
        password_fields[i].classList.add('is-valid')
        password_fields[i].classList.remove('is-invalid')
      }
    }
    else { 
      password_fields = document.querySelectorAll('.password_field')
      for (var i = 0; i< password_fields.length; i++) {
        password_fields[i].classList.remove('is-valid')
        password_fields[i].classList.add('is-invalid')
      }
    }
  }
}
    