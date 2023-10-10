import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TabuadaServlet")
public class TabuadaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Tabuada de Multiplicação</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Tabuada de Multiplicação</h1>");
        out.println("<table border='1'>");
        out.println("<tr><th>Número</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th><th>9</th></tr>");
        
        for (int i = 1; i <= 9; i++) {
            out.println("<tr>");
            out.println("<td>" + i + "</td>");
            
            for (int j = 1; j <= 9; j++) {
                out.println("<td>" + (i * j) + "</td>");
            }
            
            out.println("</tr>");
        }
        
        out.println("</table>");
        out.println("</body>");
        out.println("</html>");
    }
}
