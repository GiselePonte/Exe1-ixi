import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TabuadaServlet")
public class TabuadaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Recupere o valor do parâmetro "numero" do formulário
        String numeroStr = request.getParameter("numero");

        try {
            // Converta o valor do parâmetro para um inteiro
            int numero = Integer.parseInt(numeroStr);

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Tabuada de Multiplicação</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Tabuada de Multiplicação do Número " + numero + "</h1>");
            out.println("<table border='1'>");
            out.println("<tr><th>Número</th><th>Resultado</th></tr>");

            for (int i = 1; i <= 10; i++) {
                out.println("<tr>");
                out.println("<td>" + numero + " x " + i + "</td>");
                out.println("<td>" + (numero * i) + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        } catch (NumberFormatException e) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Erro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>O valor inserido não é um número inteiro válido.</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
