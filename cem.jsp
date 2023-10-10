import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdivinhacaoServlet")
public class AdivinhacaoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

      
        HttpSession session = request.getSession();

  
        Integer numeroAleatorio = (Integer) session.getAttribute("numeroAleatorio");

      
        if (numeroAleatorio == null) {
            Random random = new Random();
            numeroAleatorio = random.nextInt(100) + 1;
            session.setAttribute("numeroAleatorio", numeroAleatorio);
            session.setAttribute("palpites", 0);
        }

       
        String palpiteStr = request.getParameter("palpite");
        int palpite = -1;


        try {
            palpite = Integer.parseInt(palpiteStr);
        } catch (NumberFormatException e) {
            out.println("<html><body>");
            out.println("<h1>Erro</h1>");
            out.println("<p>Por favor, insira um palpite válido (número).</p>");
            out.println("</body></html>");
            return;
        }

      
        int palpites = (int) session.getAttribute("palpites") + 1;
        session.setAttribute("palpites", palpites);

      
        String mensagem;
        if (palpite < numeroAleatorio) {
            mensagem = "Tente um número maior.";
        } else if (palpite > numeroAleatorio) {
            mensagem = "Tente um número menor.";
        } else {
            mensagem = "Parabéns! Você acertou o número " + numeroAleatorio + " em " + palpites + " palpites.";
           
            session.removeAttribute("numeroAleatorio");
        }


        out.println("<html><body>");
        out.println("<h1>Adivinhe o Número</h1>");
        out.println("<p>" + mensagem + "</p>");
        out.println("<form action='/SeuProjeto/AdivinhacaoServlet' method='get'>");
        out.println("Insira seu palpite: <input type='text' name='palpite'>");
        out.println("<input type='submit' value='Adivinhar'>");
        out.println("</form>");
        out.println("</body></html>");
    }
}
