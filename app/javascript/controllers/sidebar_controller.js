import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
static targets = ['toggle', 'container', 'list']
body = document.getElementById("body");

  connect() {
    // console.log("connected");
    // console.log(this.toggleTarget);
    // console.log(this.containerTarget);
    // console.log(body);
  }

  open() {
    // console.log("click");
    this.toggleTarget.classList.toggle('sidebar--active');
    this.containerTarget.classList.toggle('container-general-active');
    body.classList.toggle('body-general')
  }
}
