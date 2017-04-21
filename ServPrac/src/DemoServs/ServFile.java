package DemoServs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServFile
 */
@WebServlet("/ServFile")
public class ServFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private int count=0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String nam=request.getParameter("name");
		System.out.println("Welcome "+nam);
		response.setContentType("text/html");
		PrintWriter write=response.getWriter();
		String htmlResponse="<html>Welcome "+nam+"</html>";
		write.println(htmlResponse);*/
		// TODO Auto-generated method stub

		//response.getWriter().append("Served at2: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	String button = request.getParameter("act");
	if (button.equals("Forward")) {
		//Forward button was pressed
		String nam=request.getParameter("name");
		System.out.println("Welcome "+nam);
		response.setContentType("text/html");
		count++;
		PrintWriter write=response.getWriter();
		String htmlResponse="<html>Welcome "+nam+"</html>";
		write.println(htmlResponse);
		write.println("count :"+count);
	}        
	    
	if (button.equals("Redirect")) {
		//Redirect button was pressed
		response.sendRedirect("http://localhost:8080/ServPrac/RedirectServFile");
		//response.sendRedirect("Index2.html");
	}
	
		
	//response.sendRedirect("Index2.html");
	// TODO Auto-generated method stub
	//doGet(request, response);
	}

}
