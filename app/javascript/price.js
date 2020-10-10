function price(){
   const price_input = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");

   function calc(fee, gains) {
    add_tax.textContent = fee
    profit.textContent = gains
   }
     price_input.addEventListener('keyup', () => {
         const value = price_input.value; 
       if (value >= 300 && value <= 9999999){
         let fee = value * 0.1
         let gains = value - fee
         calc(fee, gains)
        } else {
         let fee = '-';
         let gains = '-';
         calc(fee, gains)
        }
   });
  }
  window.addEventListener('load', price);