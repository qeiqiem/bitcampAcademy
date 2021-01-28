package spms.context;

import java.io.FileReader;
import java.lang.reflect.Method;
import java.util.Hashtable;
import java.util.Properties;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.reflections.Reflections;

import spms.annotation.Component;

public class ApplicationContext {
	
	Hashtable<String, Object> objTable = new Hashtable<String, Object>();
	
	public Object getBean(String servletPath) {
		return objTable.get(servletPath);
	}
	
	public ApplicationContext(String propertiesPath) throws Exception{
		Properties props = new Properties();
		props.load(new FileReader(propertiesPath));
		prepareObjects(props);
		prepareAnnotationObjects();
		injectDependency();
	}
	public void prepareObjects(Properties props) throws Exception{
		Context ctx = new InitialContext();
		String key = null;
		String value= null;
		
		for(Object item : props.keySet()) {
			key=(String)item;
			value = props.getProperty(key);
//			if(value.startsWith("jndi.")) {
				objTable.put(key,ctx.lookup(value)); //거를 객체 없이 톰캣 DS 객체만 존재하기 때문에 검사하지 않고 바로 넣는다.
//			}
//			else {
//				// 현재는 받을 객체가 없지만, 훗날을 위해 남겨두는 코드
//				objTable.put(key, Class.forName(value).newInstance());
//			}
		}
	}
	private void prepareAnnotationObjects() throws Exception {
		Reflections reflector = new Reflections("");
		
		Set<Class<?>> list = reflector.getTypesAnnotatedWith(Component.class);
		String key=null;
		for(Class<?> clazz : list) {
			key = clazz.getAnnotation(Component.class).value();// 애노테이션에 입력한 문자를 그대로 받는다. 서블릿패스와 같은기능
			objTable.put(key,clazz.newInstance()); //애노테이션에 연결된 객체를 애노테이션을 키값으로 저장한다.
		}
	}
	private void injectDependency() throws Exception{
		for(String key : objTable.keySet()) {
			if(!key.startsWith("jndi.")) {
				callSetter(objTable.get(key));
			}
		}
	}
	private void callSetter(Object obj) throws Exception{
		Object dependency = null;
		for(Method m : obj.getClass().getMethods()) {
			if(m.getName().startsWith("set")) {
				dependency = findObjectByType(m.getParameterTypes()[0]);
				if(dependency != null) {
					m.invoke(obj, dependency);
				}
			}
		}
	}
	private Object findObjectByType(Class<?> type) {
		for(Object obj : objTable.values()) {
//			type으로 obj가 생성된 것이라면
			if(type.isInstance(obj))
				return obj;
		}
		return null;
	}
}
