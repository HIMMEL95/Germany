<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<form name="form" enctype="multipart/form-data">
		<input type="hidden" name="name"/>
		<input type="hidden" name="id"/>
		<input type="hidden" name="phone"/>
		<input type="hidden" name="email"/>
		<input type="hidden" name="gender"/>
		<input type="hidden" name="dob"/>
		<input type="hidden" name="snsImg"/>
	</form>
<script type="text/javascript">

  var naver_id_login = new naver_id_login("z69jjnmkMQ88W2owra4t", "http://localhost:8080/member/naverCallback");
  // ì ê·¼ í í° ê° ì¶ë ¥
  /* alert(naver_id_login.oauthParams.access_token); */
  // ë¤ì´ë² ì¬ì©ì íë¡í ì¡°í
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // ë¤ì´ë² ì¬ì©ì íë¡í ì¡°í ì´í íë¡í ì ë³´ë¥¼ ì²ë¦¬í  callback function
  function naverSignInCallback() {
	  $("input[name=id]").val("네이버로그인");
	  $("input[name=name]").val(naver_id_login.getProfileData('name'));
	  $("input[name=phone]").val(naver_id_login.getProfileData('mobile'));
	  $("input[name=email]").val(naver_id_login.getProfileData('email'));
	  $("input[name=dob]").val(naver_id_login.getProfileData('birthday'));
	  $("input[name=snsImg]").val(naver_id_login.getProfileData('profile_image'));
	  
	  if (naver_id_login.getProfileData('gender') == 'M'){
			$("input[name=gender]").val(5);
		} else {
			$("input[name=gender]").val(6);
		} 
	  
	  $("form[name=form]").attr("action", "/member/naverLoginProc").submit();
  }
</script>
</body>
</html>