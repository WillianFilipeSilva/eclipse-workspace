<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuário</title>
    <link rel="shortcut icon" href="" type="image/x-icon">
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <div class="perfil-container">
        <div class="perfil-lado-esquerdo">
            <img src="" alt="Foto do perfil">
            <h2><%= request.getAttribute("nomeUsuario") != null ? request.getAttribute("nomeUsuario") : "Nome do Usuário" %></h2>
            <p><%= request.getAttribute("incidentesCadastrados") != null ? request.getAttribute("incidentesCadastrados") : "2" %> Incidentes Cadastrados</p>
        </div>

        <div class="incidentes-lado-medio">
            <h2>Incidentes Cadastrados</h2>

            <%
                List<Incidente> incidentes = (List<Incidente>) request.getAttribute("incidentes");
                if (incidentes != null) {
                    for (Incidente incidente : incidentes) {
            %>
                <div class="incidente">
                    <h3><%= incidente.getTitulo() %></h3>
                    <p>Data: <%= incidente.getData() %></p>
                    <p>Situação: <%= incidente.getSituacao() %></p>
                </div>
            <%
                    }
                } else {
            %>
                <div class="incidente">
                    <h3>Alagamento no Centro</h3>
                    <p>Data: 15/10/2023</p>
                    <p>Situação: Finalizado</p>
                </div>

                <div class="incidente">
                    <h3>Deslizamento na Itoupava</h3>
                    <p>Data: 12/10/2023</p>
                    <p>Situação: Ativo</p>
                </div>

                <div class="incidente">
                    <h3>Incêndio em residência</h3>
                    <p>Data: 05/10/2023</p>
                    <p>Situação: Finalizado</p>
                </div>
            <%
                }
            %>
        </div>

    </div>

</body>

</html>