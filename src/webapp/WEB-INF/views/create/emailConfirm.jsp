<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>make-it</title>
</head>
<body>
  <script type="text/javascript">
    var userEmail = '${email}';

    alert(userEmail + '님 펀딩 프로젝트의 멤버가 되셨어요!');

    window.open('', '_self', ''); 
    
    self.location = '/biz/main.do';
  </script>
</body>
</html>