import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit"
export default class extends Controller {
  static targets = ['info', 'form']

  connect() {
  }

  displayForm() {
    this.formTarget.classList.remove('d-none')
    this.infoTarget.classList.add('d-none')
  }
}
