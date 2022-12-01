package repository.impl;

import model.Customer;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL = "SELECT * FROM furama_create_table.khach_hang;";
    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
//        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
            int customerTypeId = resultSet.getInt("ma_loai_khach");
            String name = resultSet.getString("ho_ten");
            String dateOfBirth = resultSet.getString("ngay_sinh");
            boolean gender = resultSet.getBoolean("gioi_tinh");
            String idCard = resultSet.getString("so_cmnd");
            String numberPhone = resultSet.getString("so_dien_thoai");
            String email = resultSet.getString("email");
            String address = resultSet.getString("dia_chi");
            customerList.add(new Customer(customerTypeId,name,dateOfBirth,gender,idCard,numberPhone,email,address));
                }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }
}
