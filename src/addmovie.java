import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;

/**
 * Servlet implementation class addmovie
 */
@WebServlet("/addmovie")
public class addmovie extends HttpServlet {
	Connection con;
	Statement stmt;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addmovie() {
        super();
        // TODO Auto-generated constructor stub
        try{
        	Class.forName("oracle.jdbc.OracleDriver");
        	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:sona", "cineshow", "sona558");
        	stmt=con.createStatement();
        }
        catch(Exception e)
        {
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
		String name,price,duration,genre,rd,cert,dname;
		name=request.getParameter("name");
		price=request.getParameter("price");
		duration=request.getParameter("duration");
		genre=request.getParameter("genre");
		rd=request.getParameter("rd");
		cert=request.getParameter("cert");
		dname=request.getParameter("dname");
		try{
			stmt.executeUpdate("insert into movie values(movie_id.nextval,'"+name+"',"+price+",'"+duration+"','"+genre+"','"+rd+"','"+cert+"','"+dname+"')");
			request.getRequestDispatcher("movie.jsp?act=0").forward(request,response);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
