import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ComprimentoStringServlet")
public class ComprimentoStringServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

      
        String entrada = request.getParameter("entrada");

      
        int comprimento = entrada.length();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Comprimento da String</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Comprimento da String</h1>");
        out.println("<p>A string inserida foi: " + entrada + "</p>");
        out.println("<p>O comprimento da string é: " + comprimento + "</p>");

        out.println("<form action='/SeuProjeto/ComprimentoStringServlet' method='post'>");
        out.println("Insira uma nova string: <input type='text' name='entrada'>");
        out.println("<input type='submit' value='Calcular Comprimento'>");
        out.println("</form>");

        out.println("</body>");
        out.println("</html>");
    }
}
