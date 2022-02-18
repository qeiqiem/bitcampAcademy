package spms.servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.bind.DataBinding;
import spms.bind.ServletRequestDataBinders;
import spms.context.ApplicationContext;
import spms.controls.Controller;
import spms.listeners.ContextLoaderListener;

@WebServlet("*.do")
@SuppressWarnings("serial")
public class DispatcherServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		
		String servletPath = request.getServletPath();
		
		try {
			ApplicationContext ctx = ContextLoaderListener.getApplicationContext();//주소연결
			Controller pageController = (Controller)ctx.getBean(servletPath);
			//키값 꺼내기 주소에 맞는 컨트롤러 꺼내기
			
			HashMap<String, Object> model = new HashMap<String, Object>();
			model.put("session", request.getSession());
			
			if(pageController instanceof DataBinding) {
				//브라우저에 보내는 파라미터를 객체에 자동 주입하여 모델객체 상속
				//dataBinding의 상속을 받았다면
				prepareRequestData(request, model, (DataBinding)pageController);
			}
			
			String viewUrl= "";
			if (pageController != null) {
				viewUrl = pageController.execute(model);
				for(String key : model.keySet())
					request.setAttribute(key, model.get(key));
			}else {
				System.out.println("주소 대상 Controller가 없습니다!");
			}
			if(viewUrl.startsWith("redirect:")) {
				response.sendRedirect(viewUrl.substring(9));
				return;
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(viewUrl);
				rd.include(request, response);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//경로가 redirect로 시작하면 바로 이동
	//요청한 데이터 준비
	private void prepareRequestData(HttpServletRequest request, HashMap<String, Object> model,
			DataBinding dataBinding) throws Exception {
		Object[] dataBinders = dataBinding.getDataBinders();
		String dataName = null;//key이름
		Class<?> dataType = null;//생성할 객체의 클래스 정보 ,vo정보
		Object dataObj = null; //생성한 객체
		
		for(int i=0; i<dataBinders.length; i+=2) {//오브젝트 voclass가 담긴
			dataName = (String)dataBinders[i];
			dataType = (Class<?>)dataBinders[i+1];
			/* request : 매개변수 추출을 위해 필요
			 * dataType : 객체를 생성할 클래스 타입
			 * dataName : 매개변수 이름
			 * */
			// 객체를 생성해준다
			dataObj = ServletRequestDataBinders.bind(request, dataType, dataName);
			//만들어진 객체를 model에 저장한다. 이제 브라우저로 보내려고
			model.put(dataName, dataObj);			
		}
	}

}
