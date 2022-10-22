<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!doctype html>
<html lang="ko">
<head>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
	  integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
</head>
<body>
	<form name="form">
		<input type="hidden" name="name"/>
		<input type="hidden" name="id"/>
		<input type="hidden" name="phone"/>
		<input type="hidden" name="email"/>
		<input type="hidden" name="gender"/>
		<input type="hidden" name="dob"/>
		<input type="hidden" name="profile_img"/>
	</form>
	
	<script type="text/javascript">
		Kakao.init('ec2655da82c3779d622f0aff959060e6');
		console.log(Kakao.isInitialized());
		
		Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  
	        	  var account = response.kakao_account;
	        	  
	        	  console.log(response);
	        	  
	        	  $("input[name=id]").val("카카오로그인");
	        	  $("input[name=name]").val(account.profile.nickname);
	        	  $("input[name=phone]").val(account.profile.phone_number);
	        	  $("input[name=email]").val(account.profile.email);
	        	  $("input[name=dob]").val(account.profile.birthday);
	        	  
	        	  if (account.gender.equals("male")) {
	        		  $("input[name=gender]").val(5);
        		  } else {
        			  $("input[name=gender]").val(6);
       			  } 
	        	  
	        	  $("form[name=form]").attr("action", "/member/naverLoginProc").submit();
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
		
	</script>
</body>
</html>