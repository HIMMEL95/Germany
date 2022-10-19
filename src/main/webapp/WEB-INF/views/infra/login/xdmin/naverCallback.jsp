<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<form name="form">
		<input type="hidden" name="name"/>
		<input type="hidden" name="id"/>
		<input type="hidden" name="phone"/>
		<input type="hidden" name="email"/>
		<input type="hidden" name="gender"/>
		<input type="hidden" name="dob"/>
	</form>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("z69jjnmkMQ88W2owra4t", "http://localhost:8080/member/naverCallback");
  // 접근 토큰 값 출력
  /* alert(naver_id_login.oauthParams.access_token); */
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  $("input[name=id]").val(naver_id_login.getProfileData('id'));
	  $("input[name=name]").val(naver_id_login.getProfileData('name'));
	  $("input[name=phone]").val(naver_id_login.getProfileData('mobile'));
	  $("input[name=email]").val(naver_id_login.getProfileData('email'));
	  $("input[name=dob]").val(naver_id_login.getProfileData('birthyear') + "-" + naver_id_login.getProfileData('birthday'));
	  
	  $("form[name=form]").attr("action", "/member/naverLoginProc").submit();
  }
</script>
</body>
</html>