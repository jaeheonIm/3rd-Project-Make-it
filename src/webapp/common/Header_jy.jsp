<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">

<title>프로젝트 등록하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--  <link rel="shortcut icon" href="#">-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style_jy.css">
<link rel="stylesheet" href="css/style_jy_funding.css">
<!--글꼴-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<style>
.list-unstyled2 {
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 30px;
    list-style: none;
}
.openBtn {
    width: 40px; 
    height: 40px; 
    transition: fill .3s;
    margin-left: 50px;
}
#element1, #optionWrite {
   display: none;
}
#optionWrite {
   margin-top: 15px;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

#image_container img {
width: 300px;
margin-top: 20px;
}
.wz.button.icon.small2 {
    padding: 6px;
    width: 34px;
    font-size: 14px;
	float: right;
	display: block;
	
}
.regex{
	color: red;
	font-size: 14px;
}
.ui-datepicker-trigger{cursor: pointer;}
.hasDatepicker{cursor: pointer;}
</style>
</head>