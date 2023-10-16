package com.approval.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.approval.myapp.HomeController;

public class OracleConnectionTest {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//DB���� ����
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "study";
	private static final String PW = "1234";
	
	@Test
	public void oracleConnectionTest() throws Exception {
		Class.forName(DRIVER);	//����̹� �ε�
		try {
			Connection conn = DriverManager.getConnection(URL, USER, PW);
			logger.info("����Ŭ�� ���������� ����Ǿ����ϴ�.");
		} catch(Exception e) {
			e.printStackTrace();
		}
		//fail("Not yet implemented");
	}
}