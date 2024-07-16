package com.user;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

public class Register extends HttpServlet {
    public void processRequest (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        res.setContentType("text/html");
        PrintWriter out= res.getWriter();
        out.println("Register_Servlet");

        //getting all the incoming details from the request
        String uname=req.getParameter("name1");
        String uemail= req.getParameter("email1");
        String upassword= req.getParameter("password1");

        out.println("<br>"+uname+"<br>");
        out.println(uemail+"<br>");
        out.println(upassword);

        //now we will create connection with jdbc
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registerform","root","batak");

            //once the connection is formed, we will make insert query
            String q="insert into user (name, password, email) values(?,?,?)";
            //the above query was parametereized query where we had "?" so for that prepared statement will be used
            PreparedStatement pst =con.prepareStatement(q);

            pst.setString(1,uname);//pehle question mark pr name (1 means that)
            pst.setString(2,upassword);
            pst.setString(3,uemail);

            pst.executeUpdate();
            out.println("<h2>Data done</h2>");
        }

        catch (Exception e)
        {

        out.println("there is an error"+e);
        }

        //we will run query t
    }

        @Override
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        processRequest(req, res);
    }

        @Override
    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        processRequest(req, res);
    }
}
