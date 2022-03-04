import { Controller } from "stimulus"
import flatpickr from "flatpickr"


export default class extends Controller {
  static targets = [ "input", "label", "preview" ]

  connect() {
    console.log("We did it!")
    flatpickr(".datepicker", {});
  }

  show() {
    const files = this.inputTarget.files[0];
    console.log(files)
    if (files) {
      let controller = this
      console.log(this.previewTarget)
      const fileReader = new FileReader();
      fileReader.readAsDataURL(files);
      fileReader.addEventListener("load", function () {
        controller.previewTarget.innerHTML = '<img src="' + this.result + '" />';
      });
    }
  }

}
