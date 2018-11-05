<%-- 
    Document   : home.jsp
    Created on : Sep 24, 2015, 6:47:02 PM
    Author     : xl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c-rt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:import url="header.jsp" />
<c:import url="footer.jsp" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
        <script src="scripts/main.js" type="text/javascript"> </script>
        <title>MiniTwitter</title>
    </head>
    <body>
         <c:if test="${sessionScope.user == null}">
            <c:redirect url = "/login.jsp"/>
        </c:if>
      <div id='pagewrapTopLeft'>
        
          <h2> 
            <c:out value="${user.fullName}" /> 
          
        </h2>
            <p>
               @<c:out value="${user.email}" /> 
            </p>
            
            <h3>
                Number of twits: <c:out value="${twitNumber}" />
            </h3>
            
      </div>
      
      <div id='pagewrapBottomLeft'>
            <h2>Trends</h2>
      </div>
            
      <div id='MiddleTopTwit'>
            <form action='userPage' method="post">
            <div id='twitBox'>
                <input hidden name='action' value='postTwit'>
                <h3>Twit</h3>
                <textarea name='twit' cols='30' rows='5' maxlength='280'></textarea><br>
                <input type='submit' value='Post'>
            </div>
            </form>
            
      </div>   
            
   
    <c:forEach var="twit" items="${twits}">
    <div id='MiddleTopPosts'>
        
        <div id="twitPosts">
             <h3 twit>@<c:out value="${user.email}" />: <p id="twitDate"> <c:out value="${twit.twitDate}" /> </p></h3> 
             <p id="twit">"<c:out value="${twit.twit}" />"</p>
             <a id="deleteButton" href="userPage?action=deleteTwit&amp;twitID='${twit.twitID}'">delete</a>
        </div>
       
    </div> 
    </c:forEach>
   
            
       
    </body>
</html>
