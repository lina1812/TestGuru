document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')
  
  if (control) { 
    new SortingRows(control)
  }
})

class SortingRows{
  constructor(control){
    this.control = control
    this.header = document.querySelector('thead tr') 
    this.arrow_up = control.querySelector('.octicon-arrow-up')
    this.arrow_down = control.querySelector('.octicon-arrow-down')
    
    this.setup()
  }

  sortRowsByTitle() {
    let tbody = document.querySelector('tbody')

    let sortedRows = Array.from(tbody.querySelectorAll('tr'))

    if (this.arrow_up.classList.contains('hide')){  
      sortedRows.sort(this.compareRowsAsc)
      this.arrow_up.classList.remove('hide')
      this.arrow_down.classList.add('hide')
    } else {
      sortedRows.sort(this.compareRowsDesc)
      this.arrow_down.classList.remove('hide')
      this.arrow_up.classList.add('hide')
    }
  
    let sorderTbody = document.createElement('tbody')
  
    sortedRows.forEach((sortedRow) => {
      sorderTbody.appendChild(sortedRow)
    })

    tbody.parentNode.replaceChild(sorderTbody, tbody)
  }

  compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent
  
    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
  }

   compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent
  
    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
  }

  setup() {
    this.control.addEventListener( 'click', event => { this.sortRowsByTitle() } )
  }
}
