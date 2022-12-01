package service;

import model.Product;

import java.util.List;

public interface IProductService {
    void addProduct(Product product);

    void editProduct(int id, String value, int parameter);

    void deleteProduct(int id);

    void viewProduct(int id);

    List<Product> findByName(String name);

    List<Product> getProducts();
}
