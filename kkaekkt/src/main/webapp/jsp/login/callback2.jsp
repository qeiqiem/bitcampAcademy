<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "kEvFCZyOPXmysr20FrkK";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "0tkB4dW0ed";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8080/jsp/indexPerson.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    
    // 정보 받아오기??
    JSONParser parsing = new JSONParser();
    Object obj = parsing.parse(res.toString());
    JSONObject jsonObj = (JSONObject)obj;
    JSONObject resObj = (JSONObject)jsonObj.get("response");
     
    //왼쪽 변수 이름은 원하는 대로 정하면 된다. 
    //단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
    String naverCode = (String)resObj.get("id");
    String email = (String)resObj.get("email");
    String name = (String)resObj.get("name");
    String nickName = (String)resObj.get("nickname");
    StringBuffer res = new StringBuffer();
    
    
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;      
     
      
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
		out.println(email);
		//response.sendRedirect("/jsp/indexPerson.jsp");
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
  </body>
</html>