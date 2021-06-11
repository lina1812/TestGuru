document.addEventListener('turbolinks:load', function() {

  $('.form-inline-link').on('click', formInlineLinkHandler)
  
  var errors = document.querySelector('.resource-errors')
  if (errors) {
    var resourceId = errors.dataset.resourceId
    console.log(resourceId)
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()
  
  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')
  
  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInline =$('.form-inline[data-test-id="' + testId + '"]')
  $testTitle.toggle()
  $formInline.toggle()
  
  if ($formInline.is('visible')) {
    link.textContent = "Cancel" // t('helpers.links.actions.cancel')
  } else {
    link.textContent = "Edit" // t('helpers.links.actions.edit')  
  }

}