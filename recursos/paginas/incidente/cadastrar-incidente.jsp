<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Cadastrar Incidente</title>
<link rel="shortcut icon" href="img" type="image/x-icon">
</head>
<body>
	<main>
		<div class="container-cadastro">
			<div class="cabecalho-cadastro">
				<h2>Cadastrar Incidente</h2>
			</div>
			<form action="inserir-incidente" method="post" enctype="multipart/form-data">
				<div class="formulario-entradas">
					<div class="formulario-grupo">
						<label for="titulo">Título</label>
						<input type="text" id="titulo" name="titulo" placeholder="Escreva o título do incidente..." maxlength="50" required>
					</div>

					<div class="formulario-grupo">
						<label for="descricao">Descrição</label>
						<textarea id="descricao" name="descricao" placeholder="Escreva uma descrição para o seu incidente..." required></textarea>
					</div>

					<div class="formulario-grupo">
						<label for="enviar-foto" class="arquivo-foto">Escolha uma foto</label> 
						<input type="file" id="enviar-foto" name="foto" class="arquivo-foto">
					</div>

					<div class="formulario-grupo">
						<label for="estado">Estado</label>
						<input list="estados" id="estado" name="estado" placeholder="Selecione o Estado:" required>
						<datalist id="estados">
							<option value="Santa Catarina">
						</datalist>
					</div>

					<div class="formulario-grupo">
						<label for="cidade">Cidade</label>
						<input list="cidades" id="cidade" name="cidade" placeholder="Selecione a Cidade:" required>
						<datalist id="cidades">
							<option value="Blumenau">
						</datalist>
					</div>

					<div class="formulario-grupo">
						<label for="bairro">Bairro</label>
						<input list="bairros" id="bairro" name="bairro" placeholder="Selecione o Bairro:" required>
						<datalist id="bairros">
							<option value="Água Verde">
							<option value="Asilo">
							<option value="Badenfurt">
							<option value="Bom Retiro">
							<option value="Centro">
							<option value="Da Glória">
							<option value="Escola Agrícola">
							<option value="Fortaleza">
							<option value="Fortaleza Alta">
							<option value="Garcia">
							<option value="Itoupava Central">
							<option value="Itoupava Norte">
							<option value="Itoupava Seca">
							<option value="Jardim Blumenau">
							<option value="Jardim Nova Esperança">
							<option value="Ponta Aguda">
							<option value="Progresso">
							<option value="Salto">
							<option value="Salto do Norte">
							<option value="Testo Salto">
							<option value="Tribess">
							<option value="Velha">
							<option value="Velha Central">
							<option value="Velha Grande">
							<option value="Vorstadt">
							<option value="Vila Formosa">
							<option value="Vila Itoupava">
							<option value="Victor Konder">
						</datalist>
					</div>

					<div class="formulario-grupo">
						<label for="logradouro">Logradouro</label>
						<input type="text" id="logradouro" name="logradouro" placeholder="Escreva o seu logradouro..." maxlength="30" required>
					</div>

					<div class="formulario-grupo">
						<label for="numero">Número</label>
						<input type="text" id="numero" name="numero" placeholder="Escreva o número..." maxlength="10" required>
					</div>

					<div class="formulario-grupo">
						<label for="categoria">Categoria</label>
						<input list="categorias" id="categoria" name="categoria" placeholder="Selecione a Categoria:" required>
						<datalist id="categorias">
                            <option value="Alagamento">
                            <option value="Deslizamento">
                            <option value="Enxurrada">
                            <option value="Inundação">
                            <option value="Outros">
						</datalist>
					</div>

					<div class="formulario-botoes">
						<button type="reset" class="botao-cancelar">Limpar</button>
						<button type="submit" class="botao-confirmar">Confirmar</button>
					</div>
				</div>
			</form>
		</div>
	</main>
</body>
</html>