window.addEventListener('load', function () {

  const inputPriceArea = document.getElementById("item-price")
  inputPriceArea.addEventListener('input', function(){
    const inputValue = inputPriceArea.value;
    const taxPrice = document.getElementById("add-tax-price")
    taxPrice.innerHTML = Math.floor(inputValue*0.1)
    const profitPrice = document.getElementById("profit")
    profitPrice.innerHTML = Math.floor(inputValue*0.9)
  })
})

