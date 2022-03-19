window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const addTaxPriceValue = Math.floor(inputValue * 0.1);
    addTaxPrice.innerHTML = (addTaxPriceValue);
    const Profit = document.getElementById("profit");
    Profit.innerHTML = (inputValue - addTaxPriceValue);
  })
})