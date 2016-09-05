import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;

/**
 * Servlet implementation class book
 */
@WebServlet("/book")
public class book extends HttpServlet {
Connection con;
Statement stmt;
ResultSet rs;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public book() {
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
		String movie,theatre,sdate,name="",phone,email="",utype,stime,sn;
		int ns,price=0;
		movie=request.getParameter("movie");
		theatre=request.getParameter("theatre");
		sdate=request.getParameter("sdate");
		stime=request.getParameter("stime");
		ns=Integer.parseInt(request.getParameter("ns"));
		sn=request.getParameter("sn");
		HttpSession session=request.getSession(false);
		phone=(String)session.getAttribute("phone");
		utype=(String)session.getAttribute("utype");
		try{
		rs=stmt.executeQuery("select * from movie where name='"+movie+"'");
		if(rs.next())
		{
			price=Integer.parseInt(rs.getString("price"))*ns;
		}
		rs=stmt.executeQuery("select * from login where phone='"+phone+"'");
		if(rs.next())
		{
			name=rs.getString("uname");
			email=rs.getString("email");
		}
		stmt.executeUpdate("insert into booking values(booking_id.nextval,'"+name+"','"+phone+"','"+email+"','"+movie+"','"+theatre+"','"+sdate+"','"+stime+"',now(),'"+utype+"',"+ns+",'"+sn+"',"+price+",'pending'");
		request.getRequestDispatcher("thanq.jsp").forward(request, response);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
