package spms.bind;

import java.lang.reflect.Method;
import java.sql.Date;
import java.util.Set;

import javax.servlet.ServletRequest;

public class ServletRequestDataBinders {

	public static Object bind(ServletRequest request, Class<?> dataType, String dataName) throws Exception {
		//생성해야 할게 자료형일때
		if(isPrimitiveType(dataType)) {
			return createValueObject(dataType, request.getParameter(dataName));
		}else {
			//일반 vo객체일때
			//브라우저가 보낸 매개변수들의 이름을 set에 담는다.
			Set<String> paramNames = request.getParameterMap().keySet();
			//클래스 타입대로 객체 생성
			Object dataObject = dataType.newInstance();
			//브라우저가 보낸 매개변수를 객체의 필드를 찾아서 저장
			Method m = null;//VO의 setter를 찾아서 저장
			//브라우저가 보낸 매개변수를 1개씩 접근
			for(String paramName : paramNames) {
				//매개 변수에 해당되는 setter얻기
				m = findSetter(dataType, paramName);// m = findSetter(Class booking, "email");
				
				if(m!=null) {
					m.invoke(dataObject, createValueObject(m.getParameterTypes()[0],request.getParameter(paramName)));
//					  (booking) dataObject.setEmail(createValueObject()); 가 된다. 
					//브라우저가 입력한 vo set메서드를 호출해서 브라우저가 입력한값, vo set리턴값을 꺼내서
//					createValueObject("String","입력한값");


				}
			}// 이부분이 잘 이해가 되지않는다..
			return dataObject;
			//m내용이 대상 객체에 반영되도록 설계
			//Booking datgaObject
		}
	}
	
	private static Method findSetter(Class<?> type, String name) {
		//해당 클래스 타입이 가진 모든 메서드를 추출
		Method[] methods = type.getMethods();
		String propName = null;
		for(Method m : methods) {
			//메서드의 시작이름이 set이 아니면 돌아가라
			if(!m.getName().startsWith("set"))//setemail이런것만담는다
				continue;
			//왜 돌아가쥐..
			
			propName = m.getName().substring(3);
			propName = propName.toLowerCase();
			if(propName.equals(name.toLowerCase())) {
				return m;//set메서드를 뺴오라는건가
			}
		}
		return null;
	}
	
	//자료형을 제너릭타입안에 넣을 수 있게 클래스 객체로 변환
	private static boolean isPrimitiveType(Class<?> type) {
		//getname 클래스나 인터페이스 이것을 대표하는것
		//자료형이 맞는지 일단확인 -> 클래스타입의 vo의 값을 각 타입에 맞는 값으로 변환해야되니까
		//String 타입인
		if(type.getName().equals("int") || type == Integer.class || type.getName().equals("long") || type == Long.class ||
			type.getName().equals("float") || type == Float.class || type.getName().equals("double") || type == Double.class ||
			type.getName().equals("boolean") || type == Boolean.class ||type.getName().equals("byte") || type == Byte.class || type == Date.class || type == String.class) {
			return true;
		}
		return false;
	}
	
	//데이터 베이스에 올리기 위해 변환
	private static Object createValueObject(Class<?> type, String value) {
		if(type.getName().equals("int") || type == Integer.class) {
			return new Integer(value);
		}else if(type.getName().equals("float") || type == Float.class) {
			return new Float(value);
		}else if(type.getName().equals("long") || type == Long.class) {
			return new Long(value);
		}else if(type.getName().equals("double") || type == Double.class) {
			return new Double(value);
		}else if(type.getName().equals("boolean") || type == Boolean.class) {
			return new Boolean(value);
		}else if(type.getName().equals("byte") || type == Byte.class) {
			return new Byte(value);
		}else if(type==Date.class) {
			return java.sql.Date.valueOf(value);
		}else {
			return value;
		}
	}
}
