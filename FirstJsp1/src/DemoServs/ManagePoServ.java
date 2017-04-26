package DemoServs;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManagePoServ
 */
@WebServlet("/ManagePoServ")
public class ManagePoServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagePoServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Connection con=ManageConnectionPo.getConnection();
		PreparedStatement pstmt=null;
		String sqlQuery = "INSERT INTO newpo(ponumber,status,priority,poissuedate,duedate,seller,shipfrom,shipto,billto,trans,incoterms,mustship,designate,carrier) VALUES (?, ?, ? ,? ,?, ?, ? ,? ,? ,? ,? ,? ,? ,?)";
		
		
		try{
			pstmt = con.prepareStatement(sqlQuery);
		}catch(SQLException e){
			System.out.println("Failed to create Prepared statement");
		}
		try {
			pstmt.setString(1, request.getParameter("ponumber"));
			pstmt.setString(2, request.getParameter("status"));
			pstmt.setString(3, request.getParameter("priority"));
			pstmt.setString(4, request.getParameter("issuedate"));
			pstmt.setString(5, request.getParameter("duedate"));
			pstmt.setString(6, request.getParameter("seller"));
			pstmt.setString(7, request.getParameter("shipfrom"));
			pstmt.setString(8, request.getParameter("shipto"));
			pstmt.setString(9, request.getParameter("billto"));
			pstmt.setString(10, request.getParameter("trans"));
			pstmt.setString(11, request.getParameter("incoterms"));
			Boolean bool = "true".equals(request.getParameter("mustship"));
			pstmt.setBoolean(12, bool);
			pstmt.setString(13, request.getParameter("designate"));
			pstmt.setString(14, request.getParameter("carrier"));
		} catch (SQLException e) {
			System.out.println("Exception in setString");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
		pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("exception in First executeupdate");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		RequestDispatcher rd=request.getRequestDispatcher("/po");
		rd.forward(request,response);
		
		
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
