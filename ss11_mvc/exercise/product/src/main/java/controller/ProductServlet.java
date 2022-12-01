package controller;

import model.Product;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private final ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                saveNewProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "find":
                findProduct(request, response);
                break;
        }
    }

    private void findProduct(HttpServletRequest request, HttpServletResponse response) {
        String nameToFind = request.getParameter("name");
        List<Product> productsFounded = productService.findByName(nameToFind);


        request.setAttribute("output", productsFounded);

        try {
            request.getRequestDispatcher("view/product/find.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {

        int idOfTheProduct = Integer.parseInt(request.getParameter("id"));

        productService.deleteProduct(idOfTheProduct);
        request.setAttribute("mess", "Delete successfully!");

        try {
            request.getRequestDispatcher("view/product/delete.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int idOfTheProduct = Integer.parseInt(request.getParameter("id"));
        int optionToEdit = Integer.parseInt(request.getParameter("option"));
        String valueToEdit = request.getParameter("editChange");

        productService.editProduct(idOfTheProduct, valueToEdit, optionToEdit);

        request.setAttribute("mess", "Edit successfully!");
        try {
            request.getRequestDispatcher("view/product/edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void saveNewProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        productService.addProduct(new Product(id, name, price, description, manufacturer));

        request.setAttribute("mess", "Adding successfully!");
        try {
            request.getRequestDispatcher("view/product/add.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                showAddingPage(request, response);
                break;
            case "delete":
                showDeletePage(request, response);
                break;
            case "edit":
                showEditPage(request, response);
                break;
            case "find":
                showFindForm(request, response);
                break;
            case "view":
                showDetailsPage(request, response);
                break;
            default:
                showProducts(request, response);
        }
    }

    private void showDetailsPage(HttpServletRequest request, HttpServletResponse response) {
        String idToShowDetails = request.getParameter("id");

        request.setAttribute("idToShowDetails", idToShowDetails);
        request.setAttribute("products", productService.getProducts());

        try {
            request.getRequestDispatcher("view/product/view.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFindForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/product/find.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeletePage(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        request.setAttribute("id", id);
        try {
            request.getRequestDispatcher("view/product/delete.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditPage(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        request.setAttribute("id", id);
        try {
            request.getRequestDispatcher("view/product/edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddingPage(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/product/add.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showProducts(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("products", productService.getProducts());
        try {
            request.getRequestDispatcher("view/product/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}