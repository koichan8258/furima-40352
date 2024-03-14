window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

      const addTax = Math.floor(inputValue * 0.1);
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = addTax;

      const profit = inputValue - addTax;
      const profitDom = document.getElementById("profit");
      profitDom.innerHTML = profit;
    });
  }
});