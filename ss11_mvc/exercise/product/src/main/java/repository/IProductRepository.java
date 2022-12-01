package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    void addProduct(Product product);

    void editProduct(int id, String value, int parameter);

    void deleteProduct(int id);

    void viewProduct(int id);

    List<Product> getProducts();

    List<Product> findByName(String name);
}
