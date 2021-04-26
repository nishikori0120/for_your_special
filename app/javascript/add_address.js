function add_address(){

  const addBtn = document.getElementById('add_address');
  const form = document.getElementById('address_form');
  const selectAddress = document.getElementById('select_address');
  const next = document.getElementById("next")

  addBtn.addEventListener('click', () => {
    if (form.getAttribute("style") == "display:block;") {
      form.removeAttribute("style", "display:block;")
      selectAddress.removeAttribute("style", "display:none;")
      next.removeAttribute("style", "display:block;")
    } else {
      form.setAttribute("style", "display:block;")
      selectAddress.setAttribute("style", "display:none;")
      next.setAttribute("style", "display:none;")
    }
  })
}

window.addEventListener('load', add_address);