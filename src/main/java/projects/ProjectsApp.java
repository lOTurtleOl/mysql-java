package projects;

import java.sql.Connection;

import projects.dao.DbConnection;



public class ProjectsApp {

	public ProjectsApp() {

	}

	public static void main(String[] args) {
		
		// Had to add the below in order to avoid an error
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Had to add the above in order to avoid an error
		
		Connection conn = DbConnection.getConnection();
	}

}
