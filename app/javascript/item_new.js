window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const addTaxPriceValue = inputValue * 0.1
    addTaxPrice.innerHTML = Math.floor(addTaxPriceValue);
    const Profit = document.getElementById("profit");
    Profit.innerHTML = Math.floor(inputValue - addTaxPriceValue);
  })
})