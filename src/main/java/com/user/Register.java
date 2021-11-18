package com.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")

@MultipartConfig

public class Register extends HttpServlet {
	 
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 res.setContentType("text/html");
		 PrintWriter out=res.getWriter();
		 
		 
		 //getting all the detaile from the request
		 
		 String name=req.getParameter("user_name");
		 String password=req.getParameter("user_password");
		 String email=req.getParameter("user_email");
		 
		 Part part=req.getPart("image");
		 
		 String filename=part.getSubmittedFileName();
		 
		// out.print(filename);
		 
		 //connection.................
		 
		 
		 try {
			 Thread.sleep(3000);
			 Class.forName("com.mysql.jdbc.Driver");
		 
			 String dburl="jdbc:mysql://localhost:3306/registerapp";
			 String dbuser="root";
			 String dbpass="root";
			 Connection con=DriverManager.getConnection(dburl,dbuser,dbpass);
			 
		 //query......
	/*		 if(con.isClosed())
			 {
				 out.print("not connected..");
			 }
			 else
			 {
				 out.print(" connected..");
			 }
		  */
		 
			 String q="insert into login(name,password,email,imageName) values(?,?,?,?)";
			 
		 	 PreparedStatement pstmt=con.prepareStatement(q);
			 // set the value
			 
			
			 pstmt.setString(1,name);
			 pstmt.setString(2,password);
			 pstmt.setString(3,email);
			 pstmt.setString(4,filename);
			 
	    	 pstmt.executeUpdate();
			 
			 //upload .....
			 
			 InputStream is=part.getInputStream();
			 
			 byte  []data=new byte[is.available()];
			 
			 
			 is.read(data);
			 
			 String path=req.getRealPath("/")+"img"+File.separator+filename; 
			 
		//	 out.print(path);
			 FileOutputStream fos=new FileOutputStream(path);
			 
			 
			 fos.write(data);
			 fos.close();
			 
			 out.print("done");
			 
			 }
			 catch(Exception e) {
				e.printStackTrace(); 
				 out.print("error");
			 }
		 
		 
		 
		 //query......................
		 
		 
		 //...........................
		 
		 
			 
		 
	}

	 
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

}
