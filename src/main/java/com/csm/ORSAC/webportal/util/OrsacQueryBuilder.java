package com.csm.ORSAC.webportal.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.csm.ORSAC.adminconsole.webportal.config.MD5PasswordEncoder;
import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Component
public class OrsacQueryBuilder {

	public static final Logger LOG = LoggerFactory.getLogger(OrsacQueryBuilder.class);

	@Value("${spring.datasource.url}")
	private String url;

	@Value("${spring.datasource.username}")
	private String username;

	@Value("${spring.datasource.password}")
	private String password;

	@Value("${postgresql.driver}")
	private String driver;

	@Value("${querybuilder.password}")
	private String queryBuilderPassword;

	
	public void queryBuilder(String query, Model model, String rawPassword) throws Exception {

		List<String> columnNames = new ArrayList<>();
		List<Object[]> columnData = new ArrayList<>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int rows=0;
		try {

			if (!(new MD5PasswordEncoder().matches(rawPassword, queryBuilderPassword))) {
				throw new Exception("Invalid Query Builder Password.");
			}
			Class.forName(driver);
			// step2 create the connection object
			con = DriverManager.getConnection(url, username, password);

			// step3 create the statement object
			stmt = con.createStatement();
			
			if(stmt.execute(query)) {

			// step4 execute query
			rs = stmt.executeQuery(query.trim());

			if (rs != null) {
				ResultSetMetaData columns = rs.getMetaData();
				int i = 0;
				while (i < columns.getColumnCount()) {
					i++;

					columnNames.add(columns.getColumnName(i));
				}

				Object[] objects = null;

				while (rs.next()) {

					objects = new Object[columnNames.size()];

					for (i = 0; i < columnNames.size(); i++) {

						objects[i] = rs.getString(columnNames.get(i));
					}

					columnData.add(objects);

				}
				
			}
			model.addAttribute("columnNames", columnNames);
			model.addAttribute("columnData", columnData);
			model.addAttribute(OrsacPortalConstant.ERR, false);
			
			}else {
				rows=stmt.getUpdateCount();
				model.addAttribute(OrsacPortalConstant.ERR, true);
				model.addAttribute(OrsacPortalConstant.MESSAGE_JSON, rows+" rows affected.");
			}

			
			

		} catch (Exception e) {
			LOG.error("OLMSQueryBuilder::queryBuilder():" + e.getMessage());
			//e.printStackTrace();
			model.addAttribute(OrsacPortalConstant.ERR, true);
			model.addAttribute(OrsacPortalConstant.MESSAGE_JSON, e.getMessage());
		}

		finally {
			if (rs != null && !rs.isClosed()) {
				rs.close();
			}
			if (stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
			if (con != null && !con.isClosed()) {
				con.close();
			}
			// file open must close inside finally block.
			// heap memomr getting overflow.
		}
	}

}