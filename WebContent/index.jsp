<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="google-signin-client_id" content="136246572582-hte0chtth06tcenpj5r2aedopbvfdf80.apps.googleusercontent.com">
	<link href="style.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Commissioner:wght@300&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
	
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	
	<title>Lunch With Friends</title>
	
	<style>
		h1 {
			text-align: center;
			width:500px;
			color: white;
			font-size: 6em;
		}
		body {
			background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)),
			url('https://s.yimg.com/uu/api/res/1.2/jXGOzOeKvbouxZHiO7RAyQ--~B/Zmk9c3RyaW07aD0yODg7dz01MTQ7YXBwaWQ9eXRhY2h5b24-/https://s.yimg.com/os/creatr-uploaded-images/2020-11/bb632620-3203-11eb-bcb3-52474e5f2958');
			background-repeat:no-repeat;
			background-position: center;
			background-size: cover;
			padding: 800px;
			padding-top: 110px;
		}
		html {
			height: 100%;
		}
		.g-signin2 {
			position: fixed;
			top: 25px;
			right: 25px;
		}
		.searchbar {
			display: flex;
			justify-content: center;
		}
		p {
			color: white;
			text-align: center;
		}
		#description {
			position: fixed;
			left: 0;
			right: 0;
			bottom: 100px;
		}
	</style>
</head>
<body>
	<h1>SQUABBLER</h1>
	<div class="g-signin2" data-onsuccess="onSignIn"></div>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	
	<script>
		
	       function onSignIn(googleUser) {
		        // Useful data for your client-side scripts:
		        var profile = googleUser.getBasicProfile();
		        console.log("ID: " + profile.getId()); 
		        console.log('Full Name: ' + profile.getName());
		        console.log('Given Name: ' + profile.getGivenName());
		        console.log('Family Name: ' + profile.getFamilyName());
		        console.log("Image URL: " + profile.getImageUrl());
		        console.log("Email: " + profile.getEmail());

		        if(profile.getName() != null) {
		        var xhr = new XMLHttpRequest();
		        xhr.open('POST', 'http://localhost:8080/LunchWithFriends/JDBCUser_Access');
		        
		        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		        xhr.onload = function() {
		          console.log('Signed in as: ' + xhr.responseText);
		        };
		        
		        xhr.send("USERname=" + profile.getName() + "," + profile.getEmail() + "," + profile.getId());
		        
		        }
		        
	      }
    </script>
    	
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<form class="searchbar" action="http://localhost:8080/LunchWithFriends/SearchRestaurantDisplay"> <!-- replace this with a link to restaurants page -->
		<input type="text" name="searchname" placeholder="Search for your favorite restaurants...">
		<button type="submit"><i class="fa fa-search"></i></button>
		
	</form>
	
	<p id="description">A place to get your ass beat</p>
</body>
</html>