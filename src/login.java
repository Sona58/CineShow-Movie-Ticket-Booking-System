import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	Connection con;
	Statement stmt;
	ResultSet rs;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        try{
        	Class.forName("oracle.jdbc.OracleDriver");
        	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:sona", "cineshow", "sona558");
        	stmt=con.createStatement();
        }
        catch(Exception e){
        	System.out.println(e);
        }
        // TODO Auto-generated constructor stub
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
		String str,str1;
		str=request.getParameter("uname");
		str1=request.getParameter("pass");
		try{
			System.out.println("select * from login where uname='"+str+"' and pass='"+str1+"'");
			rs=stmt.executeQuery("select * from login where uname='"+str+"' and pass='"+str1+"'");
			System.out.println(rs.next());
			if(rs.next())
			{
				HttpSession session=request.getSession(); 
				System.out.println(rs.getString("phone"));
		        session.setAttribute("phone",rs.getString("phone")); 
		        session.setAttribute("utype", rs.getString("utype"));
				RequestDispatcher view = request.getRequestDispatcher("welcome.jsp");
				view.forward(request, response);
			}
			else
			{System.out.println(":(");
				//RequestDispatcher view = request.getRequestDispatcher("index.jsp");
				//view.forward(request, response);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
	}

}
