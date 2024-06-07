<?php
session_start();

// Defina as credenciais do banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cafeteria";

// Crie a conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifique a conexão
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Verifique se os dados do formulário foram enviados
 
    $user = $_POST['usuario'];
    $pass = $_POST['senha']; // Use MD5 para corresponder ao hash no banco de dados

    // Prepare e execute a consulta SQL
    $sql = "SELECT cod_funcionario,login,password FROM funcionarios WHERE login='$user' AND password='$pass'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Usuário autenticado com sucesso
        $_SESSION['username'] = $user;
        header("Location: index.html");
        exit();
    } else {
        // Credenciais inválidas
        header("Location: login.php?erro=1");

    }
 
$conn->close();
?>