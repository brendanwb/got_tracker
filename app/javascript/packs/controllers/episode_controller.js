import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form"]

  submit_on_check() {
    const form = this.formTarget
    form.submit()
  }
}
