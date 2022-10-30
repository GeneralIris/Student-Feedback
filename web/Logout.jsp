<%
    if(session.getAttribute("36F7TUs92NgC87MMd7A88pLK2H9Ri8GzpvZdbb3ZHHuB9fhrVz")==null){
        response.sendRedirect("Login.jsp");
    }
    else{
        session.invalidate();
        response.sendRedirect("Login.jsp");
    }
    
%>
