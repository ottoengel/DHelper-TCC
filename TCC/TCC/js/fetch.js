let usuarios = [];

function getUsuarios() {
    fetch(uri)
      .then(response => response.json())
      .then(data => _displayItems(data))
      .catch(error => console.error('Unable to get items.', error));
}

function adicionarUsuario() {
    const nomeTextbox = document.getElementById('name');
    const emailTextBox = document.getElementById('email');
    const senhaTextBox = document.getElementById('password');
    const sobrenomeTextBox = document.getElementById('lastname');
  
    const usuario = {
      nome: nomeTextbox.value.trim(),
      email: emailTextBox.value.trim(),
      senha: senhaTextBox.value.trim(),
      sobrenome: sobrenomeTextBox.value.trim()
    };
    console.log(usuario)
  
    fetch('https://localhost:44301/register', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(usuario)
    })
      .then(response => response.json())
      .then(json => console.log(json))
      .catch(error => console.error('Unable to add item.', error));
      
  }


  function logarUsuario() {
    const emailTextBox = document.getElementById('email');
    const senhaTextBox = document.getElementById('password');

    const usuario = {
      email: emailTextBox.value.trim(),
      senha: senhaTextBox.value.trim(),
    };

    fetch('https://localhost:44301/login', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(usuario)
    })
      .then(response => response.json())
      .then(json => console.log(json))
      .catch(error => console.error('Unable to login', error));
  }


  class User {
    constructor(Nome, Senha, Sobrenome, Email) {
      this.Nome = Nome;
      this.Sobrenome = Sobrenome;
      this.Email = Email;
      this.Senha = Senha;
    }
  }
  class UserService
  {
    getInputData() {
      let Nome = document.getElementById('Nome').value;
      let Senha = document.getElementById('Senha').value;
      let Sobrenome = document.getElementById('Sobrenome').value;
      let Email = document.getElementById('Email').value;
      
  
      let user = new User(Nome, Email, Senha, Sobrenome);
      return user;
    }
  }

  

  
