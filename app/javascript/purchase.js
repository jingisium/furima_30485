function purchase () {

  const postalCode = document.getElementById("postal-code");
  const prefecture = document.getElementById("prefecture");
  const city = document.getElementById("city");
  const addresses = document.getElementById("addresses");
  const building = document.getElementById("building");
  const phoneNumber = document.getElementById("phone-number");

  postalCode.value = "";
  prefecture.options[0].selected = true;
  city.value = "";
  addresses.value = "";
  building.value = "";
  phoneNumber.value = "";
};
window.addEventListener('load', purchase);