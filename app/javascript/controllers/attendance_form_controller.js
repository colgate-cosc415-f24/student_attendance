import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="attendance-form"
export default class extends Controller {
  static targets = ["reason", "status"];

  connect() {
      document.querySelector("#reason").hidden = true;
  }

  status() {
      let statval = document.querySelector("#attendance_record_status").value;
      if (statval === "present") {
        document.querySelector("#reason").hidden = true;
      } else {
        document.querySelector("#reason").hidden = false;
      }
  }
}
