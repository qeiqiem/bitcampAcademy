<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<jsp:include page="header0.jsp"></jsp:include>

    <div class="body_container">
        <h4>개인 회원</h4>
        <form action="">
            <p>아이디</p>
            <div>
                <input type="text" placeholder="아이디를 입력해주세요."><input type="button" value="중복확인">
            </div>
            <p>비밀번호</p>
            <div>
                <input type="password" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자" minlength="8" maxlength="16">
            </div>
            <p>이름</p>
            <div>
                <input type="text">
            </div>
            <p>연락처</p>
            <div>
                <input type="text" placeholder="ex) 010-1234-5678">
            </div>
            <p>생년월일</p>
            <div>
                <select>
                    <!--js로 반복문 처리해서 넣을 것-->
                    <option value="2021">2021</option>
                    <option value="2020">2020</option>
                    <option value="2019">2019</option>
                    <option value="2018">2018</option>
                </select> 년
                <select>
                    <!--js로 반복문 처리해서 넣을 것-->
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                </select> 월
                <select name="day">
                    <!--js로 반복문 처리해서 넣을 것-->
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                </select> 일
            </div>
            <div>
                <p>주소</p>
                <input type="text"> <button>주소 찾기</button>
            </div>
            <div>
                <p>이메일</p>
                <input type="email">
            </div>
            <input type="submit" value="가입하기">
        </form>
    </div>
</body>

</html>