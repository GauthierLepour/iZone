import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {

  static targets = ["formAller", "formRetour"]
  connect() {

  }

  display() {
    this.formAllerTarget.classList.toggle('d-none')
    this.formRetourTarget.classList.toggle('d-none')
  }
}
