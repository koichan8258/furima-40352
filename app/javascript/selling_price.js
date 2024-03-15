window.addEventListener('turbo:load', () => {
  const calculatePrice = () => {
    const priceInput = document.getElementById("item-price");
    const inputValue = parseFloat(priceInput.value); 

    if (!isNaN(inputValue)) { 
      const addTax = Math.floor(inputValue * 0.1);
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = addTax;

      const profit = inputValue - addTax;
      const profitDom = document.getElementById("profit");
      profitDom.innerHTML = profit;
    } else {

      console.error("Invalid input: Not a number");
    }
  };

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", calculatePrice);

  calculatePrice();

  window.addEventListener('turbo:render', () => {

    calculatePrice();
  });
});