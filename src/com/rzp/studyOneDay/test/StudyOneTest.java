package com.rzp.studyOneDay.test;

import static org.junit.Assert.*;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StudyOneTest {
	private ApplicationContext ctx = null;
	{
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	@Test
	public void testDataSource() throws SQLException {
		DataSource datasource = ctx.getBean(DataSource.class);
		System.out.println(datasource.getConnection());
	}

}
