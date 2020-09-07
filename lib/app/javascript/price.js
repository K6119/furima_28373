function price() {
  const price = document.getElementById("item-price")
  console.log(price)
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  price.addEventListener("keyup", function() {
    
  let money = this.value;
  let fee = money / 10 ;
  let yen = money - fee ;

  tax.textContent = fee;
  profit.textContent = yen;
  });
}
window.addEventListener('load',price )
