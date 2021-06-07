package com.security.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.security.model.Product;


@Repository("myntraplpDao")
public class MyntraplpDaoImpl implements MyntraplpDao {

	String databaseURL = "jdbc:mysql://localhost:3306/myntra";
	String user = "root";
	String password = "Madhuvishnu14";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public MyntraplpDaoImpl() {
	
	}
	
	public MyntraplpDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void updateProduct(Product myntraMen) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(myntraMen);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public Product getProductDetails(String details) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Product product where product.productCode ='" + details + "'";
		List<Product> productData = session.createQuery(hql).list();
		Product product = productData.get(0);
		return product;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Product> getProducts(String category) throws SerialException, SQLException, IOException {

		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Product product where product.category ='" + category + "'";
		List<Product> productList = session.createQuery(hql).list();
		for (Product product : productList) {

			if (product.getBase64Image() == null) {
				byte[] image = product.getImage();
				Blob blob = new SerialBlob(image);

				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();

				String base64Image = Base64.getEncoder().encodeToString(imageBytes);

				inputStream.close();
				outputStream.close();

				product.setBase64Image(base64Image);
			}

		}
		return productList;

	}
}
