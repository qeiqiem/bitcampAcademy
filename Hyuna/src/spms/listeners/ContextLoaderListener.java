package spms.listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import spms.context.ApplicationContext;

public class ContextLoaderListener implements ServletContextListener {

	static ApplicationContext applicationContext;
	
	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		try {
			System.out.println("contextDestroyed-서버종료");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			System.out.println("contextIntialized-서버시작");
			ServletContext sc = sce.getServletContext();
			
			String propertiesPath = sc.getRealPath(sc.getInitParameter("contextConfigLocation"));
			//db연결 web.xml - application=context.properties
			applicationContext = new ApplicationContext(propertiesPath);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
