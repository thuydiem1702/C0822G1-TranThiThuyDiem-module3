package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1, "Bơ", 10000.0, "daisuki", "VN"));
        products.add(new Product(2, "Sầu riêng", 20000.0, "daisuki", "VN"));
        products.add(new Product(3, "Dưa hấu", 30000.0, "daisuki", "VN"));
        products.add(new Product(4, "Hồng", 10000.0, "daisuki", "VN"));
        products.add(new Product(5, "Táo", 20000.0, "daisuki", "VN"));
    }


    @Override
    public void addProduct(Product product) {
        products.add(product);
    }

    @Override
    public void editProduct(int id, String value, int parameter) {
        switch (parameter) {
            case 1:
                products.get(id - 1).setName(value);
                break;
            case 2:
                double newPrice = Double.parseDouble(value);
                products.get(id - 1).setPrice(newPrice);
                break;
            case 3:
                products.get(id - 1).setDescription(value);
                break;
            case 4:
                products.get(id - 1).setManufacturer(value);
                break;
        }
    }

    @Override
    public void deleteProduct(int id) {
        products.remove(id - 1);
    }

    @Override
    public void viewProduct(int id) {

    }

    @Override
    public List<Product> getProducts() {
        return products;
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productsFound = new ArrayList<>();

        for (Product x : products) {
            if (x.getName().contains(name)) {
                productsFound.add(x);
            }
        }
        return productsFound;
    }
}