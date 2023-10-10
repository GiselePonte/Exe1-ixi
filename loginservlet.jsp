import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final String USUARIO_AUTORIZADO = "seuUsuario"; 
    private static final String SENHA_AUTORIZADA = "suaSenha";   

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

     
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");

        if (nome.equals(USUARIO_AUTORIZADO) && senha.equals(SENHA_AUTORIZADA)) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Sucesso</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Login bem-sucedido</h1>");
            out.println("<p>Bem-vindo, " + nome + "!</p>");
            out.println("</body>");
            out.println("</html>");
        } else {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Erro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Login falhou</h1>");
            out.println("<p>Credenciais inválidas. Tente novamente.</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
