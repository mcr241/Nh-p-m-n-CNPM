package initWeb;

import javax.servlet.ServletContextEvent;
import javax.sound.midi.ControllerEventListener;

import service.impl.CategoryServiceImpl;

public class ServletContextListener implements javax.servlet.ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
//		System.out.println("listener");
//		sce.getServletContext().setAttribute("category", new CategoryServiceImpl().getAll());
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("listener");
		// TODO Auto-generated method stub
		
	}

}
