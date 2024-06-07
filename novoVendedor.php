<?php
// Conexão com o banco de dados MySQL
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cafeteria";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recebe os dados do formulário
    $nome = $_POST['nome'];
    $usuario = $_POST['usuario'];
    $senha = $_POST['senha'];

    // Insere os dados no banco de dados
    $sql = "INSERT INTO funcionarios (nome_funcionario, login, password) VALUES ('$nome', '$usuario', '$senha')";

    if ($conn->query($sql) === TRUE) {
        echo "Novo vendedor registrado com sucesso!";
        header("Location: login.php");
        
    } else {
        echo "Erro ao registrar o vendedor: " . $conn->error;
    }
}
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
  <head>
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
        <form method="post" action="novoVendedor.php">
          <div class="mb-3">
            <h1>REGISTRAR</h1>
            <label for="InputText" class="form-label">Nome do vendedor</label>
            <input type="text"  name="nome"class="form-control" id="InputText" />
            <label for="InputText" class="form-label">Usuario</label>
            <input type="text"  name="usuario"class="form-control" id="InputText" />
            <label for="InputText" class="form-label">Criar senha</label>
            <input type="text"  name="senha"class="form-control" id="InputText" />
          </div>
          <div class="mb-3">
            
          </div>
          <p id="aviso"></p>
           
          <button type="submit" class="btnLogin">
            Criar Vendedor
          </button>
        </form>
      </div>
    </div>
    <div class="telainicial">