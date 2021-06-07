package com.security.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.stereotype.Repository;

import com.security.model.Product;


@Repository("myntraplpDao")
public interface MyntraplpDao {
	public void updateProduct(Product myntraMen);
	public Product getProductDetails(String menList);
	public List<Product> getProducts(String category) throws SerialException, SQLException, IOException;
}
