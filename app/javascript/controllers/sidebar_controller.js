import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  connect() {
    console.log("connected");
  }
  toggle() {
    console.log("click");
    this.element.classList.toggle('sidebar--active');

  }
}
