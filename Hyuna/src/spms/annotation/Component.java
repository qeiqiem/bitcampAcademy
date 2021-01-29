package spms.annotation;

import java.lang.annotation.*;

//anonotation을 쓰기 위해 만듦 @주소값으로 가져오기

@Retention(RetentionPolicy.RUNTIME)
public @interface Component {
	String value() default "";
}
