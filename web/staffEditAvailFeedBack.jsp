<%@page import="com.server.model.Staff,com.server.model.Student"%>

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

    <section role="main" class="content-body">
            <header class="page-header">
                <h2>Edit FeedBack Availablitity</h2>
            </header>
        
            <!-- start: page -->
            
                
                    <div class="row" id="">
                            <div class="col">
                                    <section class="card">
                                            <header class="card-header">
                                                    <h2 class="card-title">Change FeedBack Availability</h2>

                                            </header>
                                            <div class="card-body">
                                                    <div class="form-group row pb-3 ">
                                                            <label class="col-lg-3 control-label text-lg-end pt-2">FeedBack ID</label>
                                                            <div class="col-lg-6">
                                                                <input class="form-control" id="FeedBackDesc"data-plugin-maxlength maxlength="255" value="${param.FeedBackID}"disabled/>
                                                            </div>
                                                    </div>
                                                <div></div>
                                                    <div class="form-group row pb-3 ">
                                                            <label class="col-lg-3 control-label text-lg-end pt-2">FeedBack Description</label>
                                                            <div class="col-lg-6">
                                                                <input class="form-control" id="FeedBackDesc"data-plugin-maxlength maxlength="255" value="${param.FeedBackDesc}"disabled/>
                                                            </div>
                                                    </div>
                                                <form action="staffEditAvailFeedBack" method="POST">
                                                
                                                    <div class="form-group row pb-3 ">
                                                        <label class="col-lg-3 control-label text-lg-end pt-2">Feedback Status</label>
                                                            <div class="col-lg-6">
                                                                    <select id="avail" name="avail" data-plugin-selectTwo class="form-control populate" title="AvailOptions " required>
                                                                            <option value="1"> 1 : Available</option>
                                                                            <option value="0"> 0 : Disabled</option>
                                                                    </select>
                                                            </div>
                                                    </div>
                                                    <div class="form-group row pb-3 ">
                                                        <label class="col-lg-3 control-label text-lg-end pt-2"></label>
                                                            <div class="col-lg-3">
                                                                <a href="staffViewFeedBack.jsp"><button class="btn btn-danger" type="button"> Cancel </button></a>
                                                            </div>
                                                            <div class="col-lg-3">
                                                                  <input type="hidden" name="feedbackid" value="${param.FeedBackID}" />
                                                                   <input class="btn btn-primary" type="submit" value="Confirm">
                                                            </div>
                                                    </div>
                                                   
                                                </form>
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