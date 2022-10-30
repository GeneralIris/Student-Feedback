<%@page import="com.server.model.Staff,com.server.model.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%!  String username="";
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
            pageContext.setAttribute("staff_id", staff_id);
            
            
        } else {
            response.sendRedirect("FeedBackScreen.jsp");
        }
        
            
    }           
    
%>

<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ITFeedbackDatabase" user="test"
                   password="test"
/>

<sql:query var="result" dataSource="${myDatasource}">
        SELECT FEEDBACKID,FEEDBACKDESC,FEEDBACKAVAIL FROM FEEDBACK WHERE STAFFID=?
        <sql:param value="${staff_id}"/>
</sql:query>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="resources/main/HeaderFooterStaff/header.jsp" />

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
                                            <c:if test="${not empty errs}">               
                                                    <font color='red'>
                                                    <ul>
                                                        <c:forEach var="message" items="${errs}">
                                                            <li>${message}</li>
                                                            </c:forEach>
                                                    </ul>
                                                    </font>
                                                </p>
                                            </c:if>
                                    </header>
                                    <div class="card-body">

                                            <table class="table table-responsive-lg table-bordered table-striped table-sm mb-0" >
                                                    <thead>
                                                            <tr>
                                                                    <th>ID</th>
                                                                    <th>Desc</th>
                                                                    <th>Availability</th>
                                                                    <th class="text-end">Change Avail</th>
                                                                    <th class="text-end">View Feedbacks</th>
                                                            </tr>
                                                    </thead>
                                                    <tbody>
                                                            <c:forEach var="row" items="${result.rowsByIndex}">
                                                                <tr>
                                                                    <c:forEach var="column" items="${row}">
                                                                        <td><c:out value="${column}"/></td>
                                                                    </c:forEach>
                                                                    <td class="text-end">
                                                                        
                                                                        <form action="staffEditAvailFeedBack.jsp" method="POST">
                                                                            <input type="hidden" name="FeedBackID" value="${row[0]}"/>
                                                                            <input type="hidden" name="FeedBackDesc" value="${row[1]}"/>
                                                                            <input class="btn btn-primary" type="submit" value="Edit">
                                                                        </form>  
                                                                        
                                                                    </td>
                                                                    <td class="text-end">
                                                                            
                                                                        <form action="staffViewParticularFeedBack.jsp" method="POST">
                                                                            <input type="hidden" name="FeedBackID" value="${row[0]}"/>
                                                                            <input class="btn btn-primary" type="submit" value="View">
                                                                        </form>
                                                                        
                                                                    </td>
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

