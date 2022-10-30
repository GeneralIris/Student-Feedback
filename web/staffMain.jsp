<%@page import="com.server.model.Staff,com.server.model.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%! String username="";
     String staff_id ="";
     int rank;
     Student CurrentStudent =null;
     Staff CurrentStaff = null;
%>


<% 
              
    
           
    if(session.getAttribute("36F7TUs92NgC87MMd7A88pLK2H9Ri8GzpvZdbb3ZHHuB9fhrVz")==null){
        response.sendRedirect("Login.jsp");
    }
    else{
        
        Object a = session.getAttribute("36F7TUs92NgC87MMd7A88pLK2H9Ri8GzpvZdbb3ZHHuB9fhrVz");

        if(a instanceof Staff){
            CurrentStaff = (Staff) a;
            staff_id = CurrentStaff.getStaffId();
            username=CurrentStaff.getUserName();
            
        } else {
            response.sendRedirect("FeedBackScreen.jsp");
        }
        
            
    }           

%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="resources/main/HeaderFooterStaff/header.jsp" />
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ITFeedbackDatabase" user="test"
                   password="test"
/>
<sql:query var="feedback" dataSource="${myDatasource}">
        SELECT * FROM FEEDBACK WHERE FEEDBACKAVAIL=1
</sql:query>
    <section role="main" class="content-body">
            <header class="page-header">
                <h2>Staff Dashboard</h2>
            </header>

            <!-- start: page -->
            
            
            <div class="row">
                    <div class="col">
                            <section class="card">
                                    <header class="card-header">
                                            <h2 class="card-title">List of Feedback Made</h2>
                                    </header>
                                    <div class="card-body">

                                            <table class="table table-responsive-lg table-bordered table-striped table-sm mb-0" >
                                                    <thead>
                                                            <tr>
                                                                    <c:forEach var="columnName" items="${feedback.columnNames}">
                                                                            <th><c:out value="${columnName}"/></th>
                                                                    </c:forEach>
                                                            </tr>
                                                    </thead>
                                                    <tbody>
                                                            <c:forEach var="row" items="${feedback.rowsByIndex}">
                                                                <tr>
                                                                    <c:forEach var="column" items="${row}">
                                                                        <%-- <c:if test="${column != row[0]}"> --%>
                                                                        <td>${column}</td>
                                                                        <%-- </c:if> --%>
                                                                    </c:forEach>
                                                                </tr>

                                                            </c:forEach>  

                                                    </tbody>
                                            </table>
                                    </div>
                            </section>
                    </div>
            </div>
            
            
            <!-- end: page -->
    </section>

<jsp:include page="resources/main/HeaderFooterStaff/footer.jsp" />
<script>
    
    $(document).ready(function(){
        <% if(CurrentStaff!=null){ %>
         $(".USERNAME").html("<%=username%>");
        <% } %>
    });
    
</script>
</body>
</html>