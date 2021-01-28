package spms.listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import spms.context.ApplicationContext;

public class ContextLoaderListener implements ServletContextListener {
	
	static ApplicationContext applicationContext;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
		ServletContext sc = sce.getServletContext();
		String propertiesPath = sc.getRealPath(sc.getInitParameter("contextConfigLocation"));
		
		applicationContext = new ApplicationContext(propertiesPath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

}
