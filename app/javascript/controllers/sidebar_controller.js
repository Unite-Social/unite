import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
static targets = ['toggle', 'container']

  connect() {
    console.log("connected");
    console.log(this.toggleTarget);
    console.log(this.containerTarget);
  }

  open() {
    console.log("click");
    this.toggleTarget.classList.toggle('sidebar--active');
    this.containerTarget.classList.toggle('container-general-active');
  }
}
