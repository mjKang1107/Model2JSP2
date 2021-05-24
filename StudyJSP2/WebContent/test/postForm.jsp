<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 -->
우편번호 : <input type="text" name="" class="postcodify_postcode5" value="" />
<button id="postcodify_search_button">검색</button><br />
도로명주소 : <input type="text" name="" class="postcodify_address" value="" /><br />
상세주소 : <input type="text" name="" class="postcodify_details" value="" /><br />
참고항목 : <input type="text" name="" class="postcodify_extra_info" value="" /><br />


<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>



</body>
</html>