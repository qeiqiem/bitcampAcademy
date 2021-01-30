<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>산, 산, 산 - 커뮤니티 글쓰기</title>
    <link rel="stylesheet" href="css/write.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>

<body>
    <!-- 헤드 사이드바 -->
	<jsp:include page="/Sidebar.jsp"/>
    <form action="/board/write.do" method="post">
        <!-- 본문 -->
        <section class="post_container">
            <div class="title">
                <h2>커뮤니티 글쓰기</h2>
                <button type="submit" class="post_btn">등록하기
                </button>
                <!-- <input type="submit"> -->
            </div>
            <div class="post_list">
                <div class="post_title">
                    <ul>
                        <li>
					  	<select name="header">
                            <option value="">말머리 선택</option>
                            <option disabled>======</option>
                            <option value="[사담]">사담</option>
                            <option value="[질문]">질문</option>
                            <option value="[정보]">정보</option>
                            <option value="[홍보]">홍보</option>
                        </select>
                        </li>
                        <li>
                            <input type="text" name="title" placeholder="제목을 입력하세요" class="text_title">
                        </li>
                    </ul>
                </div>
                <div class="post_textbox">
                    <ul>
                        <li class="text">
                            <textarea name="content" rows="20" cols="103" style="padding: 10px;"
                                placeholder="내용을 입력하세요"></textarea>
                        </li>
                        <li class="file">
                              <form action="FileUpload" method="post" enctype="multipart/form-data">
                                <i class="fas fa-folder-open"><span> 첨부파일</span></i>
                                <input type="file" name="photo">
                                <!-- <input type="file" name="photo2"></br> -->
                                <!-- <input type="submit" value="업로드"></br> -->
                                <button type="submit" class="post_btn"> 업로드</button>
                            </form>
                        </li>
                    </ul>
                </div>
			</div>
        </section>
    </form>
    
    <%
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    %>
</body>

</html>
