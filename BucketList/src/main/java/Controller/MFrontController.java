package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Command.BoardService;
import Command.BoardServiceImpl;
import Dao.MDao;
import Dao.MDaoImpl;
import Dto.BDto;
import Dto.MDto;

/**
 * Servlet implementation class MFrontController
 */
@WebServlet("*.do")
public class MFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		String viewPage = null;
		MDao mCmd = new MDaoImpl();
		BoardService bCmd = new BoardServiceImpl();
		HttpSession session = request.getSession();
		
		if(com.equals("/join.do")) {
			String mId = request.getParameter("mId");
			String mPw = request.getParameter("mPw");
			String mName = request.getParameter("mName");
			
			MDto mdto = new MDto(mId, mPw, mName);
			mCmd.joinMember(mdto);
			
			viewPage = "Main.jsp";
		} else if(com.equals("/login.do")) {
			int check = 0;
			String mId = request.getParameter("mId");
			String mPw = request.getParameter("mPw");
			
			check = mCmd.loginCheck(mId, mPw);
			if(check == 1) {
				session.setAttribute("sessionID", mId);
				viewPage = "Main.jsp";
			} else if(check == 0) {
				viewPage = "LoginForm.jsp?msg=0";
			} else {
				viewPage = "LoginForm.jsp?msg=-1";
			}
		} else if(com.equals("/logout.do")) {
			session.invalidate();
			viewPage = "Main.jsp";
		}
		response.sendRedirect(viewPage);
	}
}
