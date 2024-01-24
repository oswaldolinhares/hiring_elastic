import { Controller } from "@hotwired/stimulus";
import { debounce } from "lodash-es";

export default class extends Controller {
  static targets = ["salary", "contributionRate", "deduction"];

  connect() {
    this.calculate = debounce(this.calculate.bind(this), 2000);
  }

  calculate() {
    let salaryStr = this.salaryTarget.value;
    salaryStr = salaryStr.replace(/\./g, '').replace(',', '.');
    const salary = parseFloat(salaryStr);

    if (salary) {
      fetch('/calculate_inss', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
        },
        body: JSON.stringify({ salary: salary })
      })
      .then(response => response.json())
      .then(data => {
        this.contributionRateTarget.value = data.rate;
        this.deductionTarget.value = data.deduction;
      });
    }
  }
}
