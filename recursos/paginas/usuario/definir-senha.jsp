<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Definir Senha</title>
<link rel="shortcut icon" href="img" type="image/x-icon">
</head>
<body>
	<header>
		<div class="logo-acesso">
			<a href="<%= request.getContextPath() %>/landing-Page"><img src="img" alt="AvisaAí Logo" class="logo-avisaai"></a>
		</div>
	</header>
	<main>
		<div class="container-acesso">
			<div class="acesso-esquerda">
				<img src="" alt="cadastro" class="imagem-tela">
			</div>

			<div class="acesso-direita">
				<div class="formulario-entradas">
					<h2>Definir Senha</h2>
					<form action="definir-senha" method="post">
						<div class="formulario-grupo">
							<input type="password" name="senha" id="senha" placeholder="Senha:" required>
						</div>

						<div class="formulario-grupo">
							<input type="password" name="confirmarsenha" id="confirmarsenha" placeholder="Confirmar Senha:" required>
						</div>

						<div class="formulario-botoes">
							<button type="button" onclick="<%= request.getContextPath() %>/cadastro-usuario" class="botao-cadastrar">Cadastrar-se</button>
							<button type="submit" class="botao-confirmar">Confirmar</button>
							<div class="botao-login">
								Já tem conta? <a href="<%= request.getContextPath() %>/login" class="link">Entrar</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>

</html>