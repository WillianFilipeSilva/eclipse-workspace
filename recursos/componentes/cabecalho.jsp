<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Cabeçalho Usuário</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: rgba(255, 255, 255, 1);
        }
        
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(44, 62, 80, 1);
            max-height: 70px;
            padding: 0px 20px 0px 20px;
            color: white;
        }
        
        .menu-e-logo {
            display: flex;
            align-items: center;
        }
        
        .menu {
            cursor: pointer;
            width: 30px;
        }
        
        .logo {
            width: 200px;
            margin-left: 20px;
        }
        
        .barra-consulta {
            flex: 1;
            margin: 0 20px;
        }
        
        .container-consulta {
            display: flex;
            justify-content: center;
            position: relative;
        }
        
        .input-consulta {
            width: 100%;
            max-width: 500px;
            padding: 5px;
            border-radius: 20px;
        }
        
        .resultado-consulta {
            margin-top: 5px;
            width: 100%;
            max-width: 500px;
            border: 1px solid #ccc;
            background-color: white;
            position: absolute;
            z-index: 1000;
            display: none;
        }
        
        .resultado-consulta h3 {
            margin: 5px;
            font-size: 14px;
            background-color: #f0f0f0;
            padding: 5px;
            border-bottom: 1px solid #ddd;
        }
        
        .resultado-item {
            padding: 5px;
            border-bottom: 1px solid #ddd;
        }
        
        .resultado-item a {
            text-decoration: none;
            color: #4CAF50;
        }
        
        .resultado-item a:hover {
            text-decoration: underline;
        }
        
        .resultado-item:hover {
            background-color: #f0f0f0;
        }
        
        .icones-cabecalho {
            display: flex;
            align-items: center;
        }
        
        .icones-cabecalho a {
            margin-left: 10px;
            color: white;
            text-decoration: none;
        }
        
        .icones-cabecalho img {
            width: 24px;
            vertical-align: middle;
            margin-right: 5px;
        }
        
        /* Sidebar */
        .barra-lateral {
            height: 100%;
            width: 0;
            position: fixed;
            top: 0;
            left: 0;
            background-color: rgba(44, 62, 80, 1);
            color: white;
            overflow-x: hidden;
            transition: width 0.5s;
            padding-top: 20px;
            z-index: 1000;
        }
        
        .barra-lateral.abrir {
            width: 250px;
        }
        
        .cabecalho-barra-lateral {
            padding: 20px;
            background-color: rgba(44, 62, 80, 1);
            text-align: center;
        }
        
        .barra-lateral ul {
            list-style-type: none;
            padding: 0;
        }
        
        .barra-lateral ul li {
            padding: 15px;
            text-align: center;
        }
        
        .barra-lateral ul li a {
            color: white;
            text-decoration: none;
            display: block;
        }
        
        .barra-lateral ul li a:hover {
            background-color: #555;
        }
        
        /* Botões */
        button {
            background-color: rgba(52, 152, 219, 1);
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        button:hover {
            background-color: rgba(41, 128, 185, 1);
        }
        
        /* Para cobrir a tela inteira quando a barra lateral estiver aberta */
        .fundo {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
            display: none;
        }
        
        .fundo.ativo {
            display: block;
        }
    </style>
</head>

<body>
    <!-- Fundo para sobrepor a tela -->
    <div id="fundo" class="fundo"></div>

    <!-- Barra lateral -->
    <div id="barra-lateral" class="barra-lateral">
        <div class="cabecalho-barra-lateral">
            <h2>Menu</h2>
        </div>
        <ul>
            <li><a href="#">Início</a></li>
            <li><a href="#">Comunidades</a></li>
            <li><a href="#">Perfil</a></li> 
            <li><a href="#">Configurações</a></li>
            <li><a href="#">Sair</a></li>
        </ul>
    </div>

    <!-- Cabeçalho -->
    <header class="navbar">
        <!-- Seção de menu e logo -->
        <div class="menu-e-logo">
            <!-- Botão do menu -->
            <a href="javascript:void(0)" onclick="alternarBarraLateral()"> 
                <img src="./Menu Hamburguer.svg" alt="menu" class="menu">
            </a>
            <a href="#">
                <img src="./Logo Branco.png" alt="Logo" class="logo">
            </a>
        </div>

        <!-- Barra de consulta -->
        <div class="barra-consulta">
            <div class="container-consulta">
                <!-- Formulário para consulta -->
                <input type="text" id="consultaInput" name="consulta" class="input-consulta" placeholder="Consultar" oninput="realizarConsulta()">
                <!-- Resultados suspensos -->
                <div id="resultadoConsulta" class="resultado-consulta"></div>
            </div>
        </div>

        <!-- Ícones do cabeçalho -->
        <div class="icones-cabecalho">
            <a href="#" class="botao-incidente">
                <img src="" alt="Cadastrar Incidente">
                Cadastrar Incidente
            </a>
            <a href="#" class="botao-feed">
                <img src="" alt="Feed">
                Feed
            </a>
            <a href="#" class="botao-acompanhados">
                <img src="" alt="Acompanhados">
            </a>
            <a href="#" class="botao-perfil">
                <img src="" alt="Perfil">
            </a>
        </div>
    </header>

    <script>
        // Função para alternar a barra lateral
        function alternarBarraLateral() {
            var barraLateral = document.getElementById('barra-lateral');
            var fundo = document.getElementById('fundo');
            
            if (barraLateral.classList.contains('abrir')) {
                barraLateral.classList.remove('abrir');
                fundo.classList.remove('ativo');
            } else {
                barraLateral.classList.add('abrir');
                fundo.classList.add('ativo');
            }
        }

        // Função para fechar a barra lateral ao clicar fora
        document.getElementById('fundo').addEventListener('click', function () {
            document.getElementById('barra-lateral').classList.remove('abrir');
            document.getElementById('fundo').classList.remove('ativo');
        });

        // Função para realizar a consulta e exibir a lista suspensa
        function realizarConsulta() {
            const consulta = document.getElementById('consultaInput').value.toLowerCase();
            const resultadoDiv = document.getElementById('resultadoConsulta');

            if (consulta === '') {
                resultadoDiv.style.display = 'none';
                return;
            }

        }

        // Esconde a lista suspensa ao clicar fora dela
        document.addEventListener('click', function (event) {
            const resultadoDiv = document.getElementById('resultadoConsulta');
            const consultaInput = document.getElementById('consultaInput');
            if (!resultadoDiv.contains(event.target) && !consultaInput.contains(event.target)) {
                resultadoDiv.style.display = 'none';
            }
        });
    </script>

</body>

</html>