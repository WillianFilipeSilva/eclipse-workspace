<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Feed Pessoal - Carregar Comentários via AJAX</title>
</head>
<body>
    <h1>Feed Pessoal</h1>

    <div id="comentarios-container">
        <h3>Comentários</h3>
    </div>

    <button type="button" onclick="carregarComentarios()">Comentários</button>

    <script>
        function carregarComentarios(id_incidente) {

            fetch(`/listar-comentarios?id_incidente=${id_incidente}`)
                .then(response => response.text())
                .then(data => {
                    document.getElementById('comentarios-container').innerHTML = data;
                })
                .catch(error => console.error('Erro ao carregar os comentários:', error));
        }
    </script>
</body>
</html>
