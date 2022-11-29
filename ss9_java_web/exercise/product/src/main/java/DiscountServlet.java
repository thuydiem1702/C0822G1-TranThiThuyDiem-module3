import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AmountServlet", urlPatterns = "/display-discount")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("ProductDescription");
        double price = Double.parseDouble(request.getParameter("ListPrice"));
        double percent = Double.parseDouble(request.getParameter("DiscountPercent"));
        double discountAmount = price * percent * 0.01;
        double discountPrice = price - discountAmount;
        request.setAttribute("ProductDescription", description);
        request.setAttribute("ListPrice", price);
        request.setAttribute("DiscountPercent", percent);
        request.setAttribute("DiscountAmount", discountAmount);
        request.setAttribute("DiscountPrice", discountPrice);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("discount.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
