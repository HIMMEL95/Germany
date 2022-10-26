<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Raspi - firebase</title>
  
	<style type="text/css">
		#main {width: 500px; margin: 0 auto;}
		hr {
			display: block;
			height: 1px;
			border: 0;
			border-top: 1px solid #ccc;
			margin: 1em 0;
			padding: 0; 
		}
	</style>
 </head>
 <body>
	<div id="main">
		<h2>Firebase Realtime Database Example</h2>
		<input type="text" id="message" placeholder="메세지를 입력하세요" size="40"> <button type="button" onclick="savedata()">Save Data</button>
		<hr>
		<h3>Result</h3>
		<textarea rows="10" cols="60" id="result" readonly></textarea>
		<p>
		<button type="button" onclick="deleteall()">Delete All</button>
		</p>

	</div>
 </body>
</html>


<script src="https://www.gstatic.com/firebasejs/4.11.0/firebase.js"></script>
<script>
	// Initialize Firebase
	var firebaseConfig = {
  	    apiKey: "AIzaSyBZfYveiWzk6udLtVHT2HrRljPrrPEpajk",
  	    authDomain: "spopia.firebaseapp.com",
  	    databaseURL: "https://spopia-default-rtdb.firebaseio.com",
  	    projectId: "spopia",
  	    storageBucket: "spopia.appspot.com",
  	    messagingSenderId: "402814991050",
  	    appId: "1:402814991050:web:f8450ff374c915c1bb9233",
  	    measurementId: "G-GTD02LTBV8"
  	};
	firebase.initializeApp(firebaseConfig);

	//DOM
	var messageField = document.getElementById("message");
	var result = document.getElementById("result");

	// Get a reference to the database service
	var database = firebase.database();
	
	//고유 아이디 만들기
	function guid() {
		function s4() {
		  return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
		}
		return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
	}

	//메세지 읽기
	var messageRef = database.ref("message");
	messageRef.on('child_added', function(snapshot) {
	  var data = snapshot.val();
		var message = data.text;
		if(message != undefined){
			result.value += message + "\n";
		}
	});

	//전부 삭제되면 결과창의 내용도 지워 준다.
	var messageRef = database.ref("message");
	messageRef.on('child_removed', function(snapshot) {
		result.value = "";
		messageField.value = "";
	});

	//메세지 저장
	function savedata() {
		var uuid = guid();
		var message = messageField.value;
		if (message == "")
		{
			alert("메시지를 입력하세요");
			return true;
		} 
		database.ref('message/' + uuid).set({
			text: message
		});
		messageField.value = "";
	}

	//삭제
	function deleteall(){
		database.ref("message").remove();
		
	}

</script>