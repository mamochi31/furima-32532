function price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;

    const addTax = document.getElementById("add-tax-price");
    const taxCalc = Math.floor(inputValue * 0.1);
    addTax.innerHTML = taxCalc.toLocaleString();
    
    const profit = document.getElementById("profit")
    const profitCalc = inputValue - taxCalc;
    profit.innerHTML = profitCalc.toLocaleString();
  });
}

window.addEventListener('load', price);
