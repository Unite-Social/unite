import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="container"
export default class extends Controller {
  connect() {
    console.log('hey');
  }

  toggleContainer() {
    console.log("click toggle");
    this.element.classList.toggle('container-general-active');
  }
}
