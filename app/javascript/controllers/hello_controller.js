import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "navbar", "burger" ]

  connect() {
  }

  toggleNavbar() {
    this.navbarTarget.classList.toggle("is-active")
    
  }

  closeNavbar() {

    this.navbarTarget.classList.remove("is-active")
  }
}