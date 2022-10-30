<%@page import="com.server.model.Staff,com.server.model.Student"%>

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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="resources/main/HeaderFooterStaff/header.jsp" />


<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ITFeedbackDatabase" user="test"
                   password="test"
/>
<sql:query var="result" dataSource="${myDatasource}">
        SELECT DISTINCT S.STUDENTID,S.STUDENTNAME FROM STUDENTANSWER SA 
            JOIN STUDENT S ON SA.STUDENTID= S.STUDENTID
            JOIN QUESTION Q ON SA.QUESTIONID =Q.QUESTIONID
            WHERE Q.FEEDBACKID =?
        <sql:param value="${param.FeedBackID}"/>
</sql:query>

        
    <section role="main" class="content-body">
            <header class="page-header">
                <h2>Staff Dashboard</h2>
            </header>
        <!--${param.FeedBackID}-->
            <input type="hidden" id="feedbackid" value="${param.FeedBackID}" />
            <!-- start: page -->
            <div class="row">
                    <div class="col">
                            <section class="card">
                                    <header class="card-header">
                                            <h2 class="card-title">Student FeedBacks</h2>
                                    </header>
                                    <div class="card-body">

                                            <table class="table table-responsive-lg table-bordered table-striped table-sm mb-0" >
                                                    <thead>
                                                            <tr>
                                                                    <th>ID</th>
                                                                    <th>Name</th>
                                                                    <th class="text-end">Student's Feedbacks</th>
                                                            </tr>
                                                    </thead>
                                                    <tbody>
                                                            <c:forEach var="row" items="${result.rowsByIndex}">
                                                                <tr>
                                                                    <c:forEach var="column" items="${row}">
                                                                        <td><c:out value="${column}"/></td>
                                                                    </c:forEach>
                                                                    <td class="text-end">
                                                                        <button type="button" studentid="${row[0]}" class="btn btn-warning View">View</button></td>
                                                                        
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
    
    <script src="<c:url value="/resources/StaffAssets/customScript/getQuestion.js" />"></script>
    <script>

        $(document).ready(function(){
            <% if(CurrentStaff!=null){ %>
             $(".USERNAME").html("<%=username%>");
            <% } %>
        });

    </script>
</body>
</html>












<div class="modal fade" id="StudentModal" tabindex="-1" role="dialog" aria-labelledby="StudentModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabel"></h5>
      </div>
      <div class="modal-body" id="modalBody">
          <div class="DefaultQuestionQuestion"></div>
          
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-secondary" id="closeMeModal" >Close</button>
      </div>
    </div>
  </div>
</div>













<script>
    $(document).ready(function(){
        
        var questionTotal = 0;
        
        $(document).on('click', '.View', function(){
            
             $("#StudentModal").modal('show');
            
            var studentID = $(this).attr("studentid");
            
            var feedbackId = $("#feedbackid").val();

            var params = {
                studentID:studentID,
                feedbackId:feedbackId
            };
            //alert(JSON.stringify(params));
            $.ajax({
                url : "staffViewStudentAnswer",    
                method:"POST",     
                data:JSON.stringify(params),
                success:function(response){

                    const thearry = JSON.parse(response);
                   
                    
                    $.ajax({
                            url : "staffViewStudentAnswer2",    
                            method:"POST",     
                            data:JSON.stringify(params),
                            success:function(response){

                                const theans = JSON.parse(response);




                                var $QuestionDIV = $('div.DefaultQuestionQuestion').eq(0); 
                                for(var i =0;i<theans.length;i++){


                                    var nextQuestion;

                                    if(i!=0){

                                        $QuestionDIV = $('div.Question'+questionTotal).eq(0); 

                                    }
                                    questionTotal++;
                                    nextQuestion = questionTotal;

                                    $QuestionDIV.after('<div class="form-group row pb-3 Question'+nextQuestion+'">'+
                                        '<label class="col-lg-3 control-label text-lg-end pt-2">'+thearry[i]+' :</label>' +
                                        '<div class="col-lg-6">'+
                                        ' <input class="form-control" "data-plugin-maxlength maxlength="255" disabled value="'+theans[i]+'"/>'+
                                        ' </div>'+
                                        '</div>');

                                }

                            }
                    });
                    
                }
            });
            
        });
            

        
        $("#closeMeModal").click(function(){
            
            $("#StudentModal").modal('hide');
            
            for(var i =questionTotal;i>0;i--){
                
                $(".Question"+i).remove();
                
            }
            questionTotal = 0;
        });
        
    });
    
    
</script>

