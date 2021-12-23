package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/productos/pan-hamburguesas")
public class Panh extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Panh() {
        super();
    }

	private void processRequest(HttpServletRequest req,  HttpServletResponse resp) throws ServletException,  IOException {
    	req.setCharacterEncoding("utf-8");
    	resp.setCharacterEncoding("utf-8");
    	req.getRequestDispatcher("/pages/panh.jsp").forward(req,  resp);
  
	}

	protected void doGet(HttpServletRequest request,  HttpServletResponse response) throws ServletException,  IOException {
		processRequest(request,  response);
	}

}
