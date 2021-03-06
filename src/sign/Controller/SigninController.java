package sign.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.SignVO;
import live.Service.liveService;
import live.Service.liveServiceImpl;
import maintenance.service.IpService;
import maintenance.service.IpServiceImpl;
import sign.Service.signService;
import sign.Service.signServiceImpl;

/**
 * Servlet implementation class SigninController
 */
@WebServlet("/SigninController")
public class SigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SigninController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		signService service = new signServiceImpl();
		HttpSession session = request.getSession();
		boolean flag = false;
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		SignVO vo = service.getSignVO(id);
		
		
		if(vo!=null&&pwd.equals(vo.getPwd())) {
			int type = vo.getType();//입력받은 값이 아니라, 데이타베이스에서 가져오는 것이니까
			
			session.setAttribute("id", id);
			session.setAttribute("type", type);
			flag = true;
	
			if(2 == type) { // 2면 블라인드계정
				RequestDispatcher dispatcher = request.getRequestDispatcher("/mente/BAN.jsp");
				if (dispatcher != null) dispatcher.forward(request, response);
				}
			
			else if(3 == type) { // 3면 슈퍼계정
				RequestDispatcher dispatche = request.getRequestDispatcher("/mente/super.jsp");
				if (dispatche != null) dispatche.forward(request, response);
				flag = true;
			}
			
			else if(1 == type) {
				flag = true;
				session.setAttribute("flag", flag);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/in/loginComplete.jsp");
				if(dispatcher != null) {
					dispatcher.forward(request, response);
				}
			}
			
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/in/loginComplete.jsp");
			if(dispatcher != null) {
				dispatcher.forward(request, response);
			}
		}	
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}


