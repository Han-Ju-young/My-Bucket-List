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
import Dao.BDao;
import Dao.BDaoImpl;
import Dto.BDto;

/**
 * Servlet implementation class MFrontController
 */
@WebServlet("*.doo")
public class BFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BFrontController() {
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
		BDao mCmd = new BDaoImpl();
		BoardService bCmd = new BoardServiceImpl();
		HttpSession session = request.getSession();
		
		if(com.equals("/write.doo")) {
			int ret = 0;
			String bmId = (String)session.getAttribute("sessionID");
			String bTitle = request.getParameter("bTitle");
			String bContent = request.getParameter("bContent");
			String bOpen = request.getParameter("bOpen");
			
			BDto bto = new BDto(0, bmId, bTitle, bContent, null, bOpen, 0); // bId, bHit:아무 int값이나 상관 없음 -> bDaoimpl에서 넣어주기 때문 & bDate도 마찬가지 but 객체이므로 null값
			ret = bCmd.writeContent(bto, bmId);
			
			viewPage = "BoardList.jsp";
		} else if(com.equals("/content_view.doo")) {
			String sId = request.getParameter("bId");
			int bId = Integer.parseInt(sId);
			BDto bdto = bCmd.viewContent(bId);
			session.setAttribute("content_view", bdto);
			viewPage = "Content.jsp";
		} else if(com.equals("/modify.doo")) {
			String sId = request.getParameter("bId");
			int bId = Integer.parseInt(sId);
			String bmId = request.getParameter("bmId");
			String bTitle = request.getParameter("bTitle");
			String bContent = request.getParameter("bContent");
			String bOpen = request.getParameter("bOpen");
			
			BDto bdto = new BDto(bId, bmId, bTitle, bContent, null, bOpen, 0);
			bCmd.modifyContent(bdto);
			viewPage = "BoardList.jsp";
		} else if(com.equals("/delete.doo")) {
			String sId = request.getParameter("bId");
			int bId = Integer.parseInt(sId);
			
			bCmd.deleteContent(bId);
			viewPage = "BoardList.jsp";
		}
		response.sendRedirect(viewPage);
	}
}
