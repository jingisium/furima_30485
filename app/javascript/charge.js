function charge(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const taxRate = 10 / 100

  itemPrice.addEventListener("input", () => {
    const inputPrice = itemPrice.value;
    addTaxPrice.innerHTML = Math.floor(inputPrice * taxRate)
    profit.innerHTML = Math.floor(inputPrice * ( 1 - taxRate ))
  });
};
setInterval(charge, 10);

