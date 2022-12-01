package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getProducts() {
        return productRepository.getProducts();
    }

    @Override
    public void addProduct(Product product) {
        productRepository.addProduct(product);
    }

    @Override
    public void editProduct(int id, String value, int parameter) {
        productRepository.editProduct(id, value, parameter);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);
    }

    @Override
    public void viewProduct(int id) {

    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }
}
