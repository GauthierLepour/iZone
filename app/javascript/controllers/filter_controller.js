import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["myEvents", "joinedEvents"]
  connect() {
  }

  mine() {
    this.myEventsTarget.classList.remove('d-none')
    this.joinedEventsTarget.classList.add('d-none')
  }

  joined() {
    this.myEventsTarget.classList.add('d-none')
    this.joinedEventsTarget.classList.remove('d-none')
  }

  all() {
    this.myEventsTarget.classList.remove('d-none')
    this.joinedEventsTarget.classList.remove('d-none')
  }
}
