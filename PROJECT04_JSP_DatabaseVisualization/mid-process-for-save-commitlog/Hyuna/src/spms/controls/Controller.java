package spms.controls;

import java.util.Map;

//Controller인터페이스를 상속시켜 실행 함수를 만든다
//추후에 실행된건 map에 담겨서 어디에 뿌릴까..?
public interface Controller {
	public String execute(Map<String, Object> model) throws Exception;
}
