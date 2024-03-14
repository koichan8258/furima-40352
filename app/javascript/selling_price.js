window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    // 再計算関数を定義
    const recalculate = () => {
      const inputValue = parseFloat(priceInput.value);

      if (!isNaN(inputValue)) { 
        const addTax = Math.floor(inputValue * 0.1);
        const addTaxDom = document.getElementById("add-tax-price");
        addTaxDom.textContent = addTax;
        const profit = inputValue - addTax;
        const profitDom = document.getElementById("profit");
        profitDom.textContent = profit;
      } else {
        console.error("Invalid input: Not a number");
      }
    };

    priceInput.addEventListener("input", recalculate);

    recalculate();
  }
});