function loadEditForm() {
  let editTableContainer = document.getElementById('tableListProducts')

  const forms = {};

  async function getEditForm(product_id) {
    const response = await fetch(`/products/${product_id}/edit`);
    if (response.ok) return response.text();
    return alert('No se pudo obtener formulario');
  }

  function createModal(dataHtml) {
    const modal = document.createElement('div')
    modal.innerHTML = dataHtml;
    return modal
  }

  function insertModal(modal) {
    const body = document.body
    body.insertBefore(modal, body.firstChild)
  }

  function showModal(modal) {
    const myModal = new bootstrap.Modal(modal)
    myModal.show()
  }

  editTableContainer.addEventListener('click', async function (e) {
    e.preventDefault();

    if(e.target.classList.contains('product-edit-button')) {
      const button = e.target;
      const id = button.id.split('-')[1] + '';

      forms[id]  = forms[id] || createModal(await getEditForm(id));

      if (forms[id].parentElement !== document.body) insertModal(forms[id]);

      showModal(forms[id].firstChild);
    }
  })
}

function loadUpdateModule() {
  async function updateProduct(id, values) {
    const response = await fetch(`/products/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(values)
    })
    if (response.ok) return response.text();
    return false
  }

  function getData(button) {
    const formElement = button.parentElement.parentElement
    const formData = new FormData(formElement)
    return Object.fromEntries(formData);
  }

  document.body.addEventListener('click', async function (e) {
    if(e.target.classList.contains('edit-button')) {
      e.preventDefault()
      const button = e.target
      const id = button.dataset.productId
      const values = getData(button)
      debugger
      const res = await updateProduct(id, values)
      if (!res) alert('No se pudo actualizar el producto formulario');
      debugger
    }
  })
}

loadEditForm()
//loadUpdateModule()