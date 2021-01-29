package spms.context;

import java.util.Hashtable;
import java.util.Properties;
import java.io.FileReader;
import java.lang.reflect.Method;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.reflections.Reflections;

import spms.annotation.Component;

public class ApplicationContext {

	//ulr값이 string
	Hashtable<String, Object> objTable = new Hashtable<String, Object>();
	
	//주소꺼내기
	public Object getBean(String key) {//url에 맞는 컨트롤러를 꺼내는것 같은데
		return objTable.get(key);//key값
	}
	
	public ApplicationContext(String propertiesPath) throws Exception {
		Properties props = new Properties();
		props.load(new FileReader(propertiesPath));//주소에 맞는 파일 리드 로드
		
		prepareObjects(props);
		prepareAnnotationObjects();//애노테이션 포함 클래스 객체 생성
		injectDependecy();//멤버dao주입
	}
	
	//1)객체 준비
	private void prepareObjects(Properties props) throws Exception {
		Context ctx = new InitialContext();
		String key = null;
		String value = null;
		
		for(Object item : props.keySet()) {//키값 value모두꺼내기
			key = (String)item;
			value = props.getProperty(key);
			if(key.startsWith("jndi.")) {
				objTable.put(key, ctx.lookup(value));
			}else {
				//나머지 클래스들은 직접 객체를 생성한다.
				objTable.put(key, Class.forName(value).newInstance());
			}
		}
	}
	
	//2)annotaion 준비
	private void prepareAnnotationObjects() throws Exception {
		Reflections reflector = new Reflections("");
		/* Reflections(패키지) : 해당 패키지 하위를 모두 찾는다
		 * Reflections("spms") : spms 하위를 모두 찾는다
		 * Reflections("spms.controls") : spms.controls 하위를 모두 찾는다
		 * Reflections("") : classpath 하위를 모두 찾는다
		 * */
		
		//@component 애노테이션을 가진 type만 추출함
		
		Set<Class<?>> list = reflector.getTypesAnnotatedWith(Component.class);
		
		String key = null;
		for(Class<?> comClass : list) {
			key = comClass.getAnnotation(Component.class).value();
			objTable.put(key, comClass.newInstance());
		}
	}
	
	//3)dao 주입
	private void injectDependecy() throws Exception {
		for(String key : objTable.keySet()) {
			if(!key.startsWith("jndi.")) {
				//데이터 소스일때는
				callSetter(objTable.get(key));
			}
		}
	}

	private void callSetter(Object obj) throws Exception {
		Object dependency = null;
		for(Method m : obj.getClass().getMethods()) {//obj controller
			//set메서드가 있는것은 controller
			//매개변수는 실제 값이 존재하지 않고 형태를 나타내는것 텅빈 하나의 박스 공간
			if(m.getName().startsWith("set")) {
				//objtable로부터 첫번째 매개변수에 해당하는 클래스를 찾아라 
				//즉 dao객체를 찾아라
				//dependency == MemberDao
				dependency = findObjectByType(m.getParameterTypes()[0]);
				if(dependency != null) {
					m.invoke(obj, dependency);
				}
				
			}
		}
	}

	private Object findObjectByType(Class<?> type) {
		for(Object obj : objTable.values()) {
			if(type.isInstance(obj))
			//true false반환
			return obj;//mysqldao
		}
		return null;
	}
}






