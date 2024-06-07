
<!DOCTYPE html>
<html lang="en">
  <head>
    <style>
      a{
	      text-decoration:none ;
      }
    </style>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BookCoffee</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="style.css" />
    <link rel="icon" type="image/x-icon" href="img/favicon-coffee.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  </head>
  <body>
    <!-- LOGIN -->
    <div class="telalogin">
      <div class="login">
        <form method="post" action="fazerLogin.php">
          <div class="mb-3">
            <h1>ENTRAR</h1>
            <label for="InputText" class="form-label">Usuário</label>
            <input type="text"  name="usuario"class="form-control" id="InputText" />
          </div>
          <div class="mb-3">
            <label for="InputPassword" class="form-label">Senha</label>
            <input
              type="password"
              class="form-control"
              id="InputPassword"
              aria-describedby="textHelp"
              name="senha"
            />
          </div>
          <p id="aviso"></p>
          <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="Check" />
            <label class="form-check-label" for="Check">Manter conectado</label>
          </div>
          <?php
          if (isset($_GET['erro'])) {
              echo '<p style="color: red;">Credenciais inválidas.</p>';
          }
          ?>

          <button type="submit" class="btnLogin" id="btnLogin">
            CONECTAR
          </button><br><br>
          
           

          <script>
            var i = 0;
            
              // Função para redirecionar para outra página
              function redirectToPage(url) {
                  window.location.href = url;
              }
               
          </script>

        </form>
        <button type="link"class="btnLogin" onclick="redirectToPage('http://localhost/cafe/novoVendedor.php')">É um novo vendedor?</button>
      </div>
    </div>
    <div class="telainicial">

    