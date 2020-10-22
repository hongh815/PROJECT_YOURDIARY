package live.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import live.Service.liveService;
import live.Service.liveServiceImpl;


/**
 * Servlet implementation class DelBoardController
 */
@WebServlet("/DelBoardController")
public class DelBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DelBoardController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// 占쎌뒄筌ｏ옙�⑨옙 占쎌벓占쎈뼗占쎌벥 占쎌뵥�굜遺얜뎃 占쎄퐬占쎌젟
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		response.setCharacterEncoding("euc-kr");

		// 疫꿸퀡�뮟占쎌뱽 占쎌젫�⑤벏釉� 占쎄퐣�뜮袁⑸뮞 揶쏆빘猿� 占쎄문占쎄쉐
		liveService service = new liveServiceImpl();

		// 占쎌뒄筌ｏ옙 占쎈솁占쎌뵬筌롫�苑� 揶쏉옙 占쎌뵭疫뀐옙
		int num = Integer.parseInt(request.getParameter("num"));

		// 占쎄퐣�뜮袁⑸뮞占쎌벥 疫뀐옙占쎄텣占쎌젫 疫꿸퀡�뮟 占쎈뼄占쎈뻬
		service.delLive(num);
		

		
		// 疫뀐옙筌뤴뫖以됵옙�몵嚥∽옙 占쎌뵠占쎈짗
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ListController");
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}