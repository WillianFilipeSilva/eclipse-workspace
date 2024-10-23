<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Consulta de Usuários</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <main>
        <div class="container-consulta">
            <div class="cabecalho-consulta">
                <h2>Consulta de Usuários</h2>
                <form action="listar-usuarios" method="get">
                    <input type="text" name="nomeUsuario" placeholder="Digite o nome do usuário">
                    <button type="submit" class="botao-consultar">Consultar</button>
                </form>
            </div>

            <div class="grid-usuarios">
                <c:forEach var="usuario" items="${listaUsuarios}">
                    <a href="perfil-usuario?id=${usuario.id}" class="card-usuario-link">
                        <div class="card-usuario">
                            <img src="${usuario.fotoUrl}" alt="Foto do Usuário" class="foto-usuario">
                            <div class="nome-usuario">${usuario.nome}</div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </main>
</body>
</html>