import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["volunteerForm", "orgForm", "signButton", "returnButton"]
  connect() {
  }
  fire() {
    this.orgFormTarget.classList.toggle("d-none");
    this.volunteerFormTarget.classList.add("d-none");
    this.signButtonTarget.classList.add("d-none");
    this.returnButtonTarget.classList.remove("d-none");
  }
}
