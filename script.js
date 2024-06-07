// 1 - INÍCIO DA DECLARAÇÃO DE VARIÁVEIS:
// Lista de produtos:
var produtos = [
    // Cafés (numeração a partir de 100):
    ["001", "04.50", "Café Expresso"],
    ["002", "11.00", "Mocha"],
    ["003", "08.50", "Cappuccino"],
    ["004", "11.00", "Macchiato"],
    // Bebidas (numeração acima de 100):
    ["101", "08.50", "Chá Gelado"],
    ["102", "10.50", "Suco Natural"],
    ["103", "08.50", "Chocolate Quente"],
    // Bolos (numeração acima de 200):
    ["201", "07.50", "Bolo Indiano"],
    ["202", "07.00", "Bolo de Banana"],
    ["203", "07.50", "Bolo de Laranja"],
    ["204", "07.50", "Bolo de Chocolate"],
    // Salgados (numeração acima de 300):
    ["301", "08.00", "Coxinha"],
    ["302", "08.00", "Empada"],
    ["303", "07.00", "Enroladinho"],
    ["304", "08.00", "Cigarrete"],
    ["305", "07.00", "Quibe"],
    // Novas categorias somam +100 no código;
  ],
  // Lista de produtos em cada mesa:
  mesas = [
    [], //Mesa 1,
    [], //Mesa 2,
    [], //Mesa 3,
    [], //Mesa 4,
    [], //Mesa 5,
    [], //Mesa 6;
  ],
  // Valor total em caixa:
  valorCaixa = 0,
  // Valor da comanda:
  valorComanda = 0,
  // Identificador de mesa selecionada:
  numeroMesa = 0,
  // Resgate de valor do cookie:
  valor = "",
  // Status de cada mesa:
  ocupadas = [false, false, false, false, false, false],
  // Comanda p/ mesa:
  comandas = [[], [], [], [], [], []];
  // Opções de login:
  logins = [["admin","123","Administrador"],
            ["1","1","Jackson"],
            ["izaque","prof","Querido professor"],
            ["funcionario","1","Funcionário do mês"]];

// 2 - INÍCIO CRIAÇÃO DE ITENS REPETIDOS:
// Criação dos botões de mesa:
for (let i = 1; i < 7; i++) {
  document.querySelector(".mapaMesas").innerHTML +=
    "<button type='button' class='btn-* mesa livre' data-bs-toggle='modal' data-bs-target='#exampleModal' id=" +
    i +
    " onclick='mudarModal(this.id)' style='color: #e6e0df'>Mesa " +
    i +
    "</button>";
}
// Popula lista das mesas com todos os produtos em quantidade 0:
// Primeiro for com "i" = quantidade de mesas (6):
for (let i = 0; i < mesas.length; i++) {
  // Segundo for com "j" = quantidade de produtos (16):
  for (let j = 0; j < produtos.length; j++) {
    mesas[i][j] = [0, produtos[j][2], parseFloat(produtos[j][1]).toFixed(2)];
  }
}
// Adiciona lista de produtos e botoes de "+"" e "-":
// Cafés:
for (let i = 0; i < 4; i++) {
  document.getElementById("cafes-acc").innerHTML +=
    "<div class='listagem'>" +
    "<button class='adicionar' id='" +
    produtos[i][0] +
    "' onclick='comanda(this.id,1)'>+</button>" +
    "<button id='" +
    i * 10 +
    "' class='indicadorQuantidade'>" +
    mesas[numeroMesa][i][0] +
    "</button>" +
    "<button class='remover' id='" +
    produtos[i][0]*1000 +
    "' onclick='comanda(this.id,2)'>-</button> " +
    produtos[i][2] +
    "</div><br>";
}
// Bebidas:
for (let i = 4; i < 7; i++) {
  document.getElementById("bebidas-acc").innerHTML +=
    "<div class='listagem'>" +
    "<button class='adicionar' id='" +
    produtos[i][0] +
    "' onclick='comanda(this.id,1)'>+</button>" +
    "<button id='" +
    i * 10 +
    "' class='indicadorQuantidade'>" +
    mesas[numeroMesa][i][0] +
    "</button>" +
    "<button class='remover' id='" +
    produtos[i][0]*1000 +
    "' onclick='comanda(this.id,2)'>-</button> " +
    produtos[i][2] +
    "</div><br>";
}
// Bolos:
for (let i = 7; i < 11; i++) {
  document.getElementById("bolos-acc").innerHTML +=
    "<div class='listagem'>" +
    "<button class='adicionar' id='" +
    produtos[i][0] +
    "' onclick='comanda(this.id,1)'>+</button>" +
    "<button id='" +
    i * 10 +
    "' class='indicadorQuantidade'>" +
    mesas[numeroMesa][i][0] +
    "</button>" +
    "<button class='remover' id='" +
    produtos[i][0]*1000 +
    "' onclick='comanda(this.id,2)'>-</button> " +
    produtos[i][2] +
    "</div><br>";
}
// Salgados:
for (let i = 11; i < 16; i++) {
  document.getElementById("salgados-acc").innerHTML +=
    "<div class='listagem'>" +
    "<button class='adicionar' id='" +
    produtos[i][0] +
    "' onclick='comanda(this.id,1)'>+</button>" +
    "<button id='" +
    i * 10 +
    "' class='indicadorQuantidade'>" +
    mesas[numeroMesa][i][0] +
    "</button>" +
    "<button class='remover' id='" +
    produtos[i][0]*1000 +
    "' onclick='comanda(this.id,2)'>-</button> " +
    produtos[i][2] +
    "</div><br>";
}
// Recupera valor do cookie de caixa e adiciona na variável:
if(document.cookie != ""){
  for (let i = 11; i < document.cookie.length; i++) {
  valor += document.cookie[i];
  }
  valorCaixa = parseFloat(valor);
  document.querySelector('.saldo').innerHTML = valorCaixa.toFixed(2);
}

// 3 - INÍCIO DA DEFINIÇÃO DE FUNÇÕES:
// Entrar com usuários únicos, mudando mensagem de boas vindas:
function login() {
  for (let i = 0; i < logins.length; i++) {
    if (document.getElementById("InputText").value == logins[i][0] &&
      document.getElementById("InputPassword").value == logins[i][1]){
      document.querySelector(".usuario").innerHTML = logins[i][2];
      document.querySelector(".telalogin").style.visibility = "hidden";
      document.querySelector(".telainicial").style.visibility = "visible";
    }
  }
  if(document.getElementById("InputText").value == "" ||
    document.getElementById("InputPassword").value == ""){
    document.getElementById("aviso").innerHTML = "Preencha todos os campos";
  } 
  else document.getElementById("aviso").innerHTML = "Credenciais incorretas";
}
// Altera o ícone de livro no cabeçalho ao ser clicado
function statusMenu() {
  if (document.querySelector(".navbarIcon").innerHTML ==
    '<img src="img/closed-book.png" alt="icone-span" width="30px">')
    document.querySelector(".navbarIcon").innerHTML =
      "<img src='img/open-book.png' alt='icone-span' width='30px'>";
  else document.querySelector(".navbarIcon").innerHTML =
      "<img src='img/closed-book.png' alt='icone-span' width='30px'>";
}
// Altera conteúdo do modal com o respectivo n° da mesa:
function mudarModal(id_elemento) {
  // Identifica qual mesa foi selecionada (variável usada mais a frente):
  numeroMesa = id_elemento;
  // Altera título do modal para o n° da mesa:
  document.getElementById("exampleModalLabel").innerHTML = "Mesa " + numeroMesa;
  // Altera valores quantitativos de produtos:
  for (let i = 0; i < produtos.length; i++) {
    document.getElementById(i * 10).innerHTML = mesas[numeroMesa - 1][i][0];
  }
  if (ocupadas[numeroMesa - 1] == true) {
    document.getElementById("botaoStatus").className = "btn btn-success";
    document.getElementById("botaoStatus").innerHTML = "DESOCUPAR";
  } else {
    document.getElementById("botaoStatus").className = "btn btn-danger";
    document.getElementById("botaoStatus").innerHTML = "OCUPAR";
  }
}
function comanda(id_element, tipo) {
  if (document.getElementById("botaoStatus").className != "btn btn-danger"){
    // "for" que busca pelo produto baseado no código dele recebido nos botões "+" e "-":
    for (let i = 0; i < produtos.length; i++) {
      // Quando código for compatível, faz mudanças na lista de produtos da mesa selecionada:
      if (produtos[i][0] == id_element || produtos[i][0]*1000 == id_element) {
        if (tipo == 1) {
          // Acrescenta 1 à quantidade do produto específico na lista:
          mesas[numeroMesa - 1][i][0]++;
          document.getElementById(i * 10).innerHTML = mesas[numeroMesa - 1][i][0];
        } else if (tipo == 2 && document.getElementById(i * 10).innerHTML != 0) {
          mesas[numeroMesa - 1][i][0]--;
          document.getElementById(i * 10).innerHTML = mesas[numeroMesa - 1][i][0];
        }
      }
    }
  }
  else document.querySelector('.alert').style.display="inline";
}
// Altera características do botão "OCUPAR"/"DESOCUPAR" no modal principal:
function statusMesa(id_element) {
  precoTotal();
  // Verifica se status atual é "OCUPAR" e alterna para "DESOCUPAR":
  if (document.getElementById(numeroMesa).className == "btn-* mesa livre") {
    document.querySelector('.alert').style.display="none";
    comandas[numeroMesa-1] = "";
    for (let j = 0; j < produtos.length; j++) {
      mesas[numeroMesa - 1][j][0] = 0;
      document.getElementById(j * 10).innerHTML = mesas[numeroMesa - 1][j][0];
    }
    document.getElementById(numeroMesa).className = "btn-* mesa ocupada";
    document.getElementById(id_element).className = "btn btn-success";
    document.getElementById(id_element).innerHTML = "DESOCUPAR";
    ocupadas[numeroMesa - 1] = true;
  }
  // Verifica o inverso do primeiro "if" nessa função:
  else {
    for (let i = 0; i < produtos.length; i++) {
      if (mesas[numeroMesa - 1][i][0] != 0) {
        comandas[numeroMesa - 1] +=
          mesas[numeroMesa - 1][i][0] +
          " x R$" +
          mesas[numeroMesa - 1][i][2] +
          " " +
          mesas[numeroMesa - 1][i][1] +
          "<br>";
      }
    }
    valorCaixa+= valorComanda;
    document.querySelector('.saldo').innerHTML = valorCaixa.toFixed(2);
    document.cookie = "valorCaixa="+valorCaixa+"; expires=Thu, 18 Dec 2022 12:00:00 UTC;"

    document.getElementById(numeroMesa).className = "btn-* mesa livre";
    document.getElementById(id_element).className = "btn btn-danger";
    document.getElementById(id_element).innerHTML = "OCUPAR";
    ocupadas[numeroMesa - 1] = false;
  }

}
// Contabiliza a quantidade de produtos consumidos e multiplica pelo preço:
function precoTotal() {
  document.getElementById("dropup").innerHTML = "R$ " + valorComanda.toFixed(2);
  let comparador = 0;
  document.getElementById("dropup").innerHTML +=
    "R$ " + mesas[numeroMesa - 1][2][0];
  for (let i = 0; i < produtos.length; i++) {
    comparador += mesas[numeroMesa - 1][i][0] * mesas[numeroMesa - 1][i][2];
    if (mesas[numeroMesa - 1][i][0] != 0) {
      document.getElementById("dropup").innerHTML =
        "R$ " + mesas[numeroMesa - 1][i][0];
    }
  }
  if (comparador != valorComanda) {
    valorComanda = comparador;
  }
  document.getElementById("dropup2").innerHTML = comandas[numeroMesa - 1];
  document.getElementById("dropup").innerHTML = "R$ " + valorComanda.toFixed(2);
}


