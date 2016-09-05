

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.sql.*;

/**
 * Servlet implementation class adduser
 */
@WebServlet("/adduser")
public class adduser extends HttpServlet {
	Connection con;
	Statement stmt;
	ResultSet rs;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adduser() {
        super();
        // TODO Auto-generated constructor stub
        try{
        	Class.forName("oracle.jdbc.OracleDriver");
        	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:sona", "cineshow", "sona558");
        	stmt=con.createStatement();
        }
        catch(Exception e){
        	System.out.println(e);
        }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname,pass,cpass,phone,email,address;
		uname=request.getParameter("name");
		pass=request.getParameter("pass");
		cpass=request.getParameter("cpass");
		phone=request.getParameter("phone");
		email=request.getParameter("email");
		address=request.getParameter("address");
		
		try{
			rs=stmt.executeQuery("select * from login where phone='"+phone+"'");
			if(rs.next()){
				System.out.println("Phone No.");
				RequestDispatcher view = request.getRequestDispatcher("index.jsp?er=0&er1=0");
				view.forward(request, response);
			}
			else if(!pass.equals(cpass))
			{System.out.println("Pass");
				RequestDispatcher view = request.getRequestDispatcher("index.jsp?er=0&er1=1");
				view.forward(request, response);
			}
			else{
				stmt.executeUpdate("insert into login values('"+uname+"','"+pass+"','"+phone+"','"+email+"','"+address+"','customer')");
				HttpSession session=request.getSession();  
		        session.setAttribute("phone",phone); 
		        session.setAttribute("utype", "customer");
				RequestDispatcher view = request.getRequestDispatcher("welcome.jsp");
				view.forward(request, response);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
