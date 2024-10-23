package avisaai.controle.servlet;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import avisaai.modelo.dao.incidente.IncidenteDAO;
import avisaai.modelo.dao.incidente.IncidenteDAOImpl;
import avisaai.modelo.dao.localidade.LocalidadeDAO;
import avisaai.modelo.dao.localidade.LocalidadeDAOImpl;
import avisaai.modelo.entidade.incidente.Incidente;
import avisaai.modelo.entidade.localidade.Localidade;
import avisaai.modelo.enumeracao.categoria.Categoria;
import avisaai.modelo.enumeracao.situacao.Situacao;

@WebServlet(urlPatterns = { "/incidentes", "/cadastro-incidente", "/editar-incidente", "/inserir-incidente",
		"/consultar-incidente", "/atualizar-incidente", "/excluir-incidente", "/erro" })
public class IncidenteServlet extends HttpServlet {

	private static final long serialVersionUID = -5746726245295401285L;

	private IncidenteDAO incidenteDAO;
	private LocalidadeDAO localidadeDAO;

	public void init() {
		incidenteDAO = new IncidenteDAOImpl();
		localidadeDAO = new LocalidadeDAOImpl();
	}

	protected void doPost(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {
		doGet(requisicao, resposta);
	}

	protected void doGet(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		String action = requisicao.getServletPath();

		try {
			switch (action) {
			case "/incidentes":
				mostrarTelaConsultaIncidente(requisicao, resposta);
				break;

			case "/cadastro-incidente":
				mostrarTelaCadastroIncidente(requisicao, resposta);
				break;

			case "/editar-incidente":
				mostrarTelaAtualizaIncidente(requisicao, resposta);
				break;

			case "/atualizar-incidente":
				atualizarIncidente(requisicao, resposta);
				break;

			case "/inserir-incidente":
				inserirIncidente(requisicao, resposta);
				break;

			case "/excluir-incidente":
				excluirIncidente(requisicao, resposta);
				break;

			case "/erro":
				erro(requisicao, resposta);
				break;
			}

		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	private void mostrarTelaCadastroIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		requisicao.getRequestDispatcher("/recursos/paginas/incidente/cadastro-incidente.jsp").forward(requisicao,
				resposta);
	}

	private void inserirIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		String titulo = requisicao.getParameter("titulo");
		String descricao = requisicao.getParameter("descricao");
		Categoria categoria = Categoria.valueOf(requisicao.getParameter("categoria"));
		String estado = requisicao.getParameter("estado");
		String cidade = requisicao.getParameter("cidade");
		String bairro = requisicao.getParameter("bairro");
		String logradouro = requisicao.getParameter("logradouro");
		short numero = Short.parseShort(requisicao.getParameter("numero"));
		Situacao situacao = Situacao.ATIVO;

		Localidade localidade = localidadeDAO.consultarLocalidade(estado, cidade, bairro, logradouro, numero);

		if (localidade == null)
			localidadeDAO.inserirLocalidade(
					localidade = new Localidade(logradouro, null, numero, bairro, cidade, estado, null));

		Incidente incidente = new Incidente(titulo, descricao, LocalDateTime.now(), categoria, null, null, localidade,
				situacao);

		incidenteDAO.inserirIncidente(incidente);

		resposta.sendRedirect("incidentes");
	}

	private void excluirIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		Long id = Long.parseLong(requisicao.getParameter("id_incidente"));

		Incidente incidente = incidenteDAO.consultarIncidenteId(id);

		if (incidente == null) {
			requisicao.getRequestDispatcher("erro-404.jsp").forward(requisicao, resposta);
			return;
		}

		incidenteDAO.deletarIncidente(incidente);

		resposta.sendRedirect("incidentes");
	}

	private void atualizarIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		Long id = Long.parseLong(requisicao.getParameter("id_incidente"));
		String titulo = requisicao.getParameter("titulo");
		String descricao = requisicao.getParameter("descricao");
		Categoria categoria = Categoria.valueOf(requisicao.getParameter("categoria"));
		String logradouro = requisicao.getParameter("logradouro");
		String estado = requisicao.getParameter("estado");
		String cidade = requisicao.getParameter("cidade");
		String bairro = requisicao.getParameter("bairro");
		short numero = Short.parseShort(requisicao.getParameter("numero"));

		Incidente incidente = incidenteDAO.consultarIncidenteId(id);

		if (incidente == null) {
			requisicao.getRequestDispatcher("/recursos/paginas/erro/erro-404.jsp").forward(requisicao, resposta);
			return;
		}

		incidente.setTitulo(titulo);
		incidente.setDescricao(descricao);
		incidente.setCategoria(categoria);
		incidente.getLocalidade().setLogradouro(logradouro);
		incidente.getLocalidade().setEstado(estado);
		incidente.getLocalidade().setCidade(cidade);
		incidente.getLocalidade().setBairro(bairro);
		incidente.getLocalidade().setNumero(numero);

		incidenteDAO.atualizarIncidente(incidente);

		resposta.sendRedirect("incidentes");

	}

	private void mostrarTelaAtualizaIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		requisicao.getRequestDispatcher("/recursos/paginas/incidente/cadastro-incidente.jsp").forward(requisicao,
				resposta);
	}

	private void mostrarTelaConsultaIncidente(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		requisicao.getRequestDispatcher("/recursos/paginas/incidente/consultar-incidente.jsp").forward(requisicao,
				resposta);
	}

	private void erro(HttpServletRequest requisicao, HttpServletResponse resposta)
			throws ServletException, IOException {

		requisicao.getRequestDispatcher("/recursos/paginas/erro/erro-404.jsp").forward(requisicao, resposta);
	}
}