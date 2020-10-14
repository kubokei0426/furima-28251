const pay = ()=> {
  Payjp.setPublicKey("pk_test_c4c5db1e5348fa17be41f44e");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
  
    Payjp.createToken(card, (status, response) => {
    })
  })
}
window.addEventListener("load", pay);