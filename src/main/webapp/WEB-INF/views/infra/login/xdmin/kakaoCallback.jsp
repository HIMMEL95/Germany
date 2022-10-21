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
	</form>
	
	<script type="text/javascript">
		Kakao.init('ec2655da82c3779d622f0aff959060e6');
		console.log(Kakao.isInitialized());
		
		Kakao.API.request({
			url: '/v2/user/me',
			data: {
				property_keys: ['kakao_account.emnail', 'kakao_account.gender'],
			},
		})
			.then(function(response) {
				console.log(response);
			})
			.catch(function(error) {
				console.log(error);
			});
	
		$("input[name=name]").val(naver_id_login.getProfileData('name'));
		$("input[name=name]").val(naver_id_login.getProfileData('name'));
		$("input[name=name]").val(naver_id_login.getProfileData('name'));
		$("input[name=name]").val(naver_id_login.getProfileData('name'));
		$("input[name=name]").val(naver_id_login.getProfileData('name'));
		$("input[name=name]").val(naver_id_login.getProfileData('name'));
	</script>
</body>
</html>