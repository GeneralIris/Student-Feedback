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
            
        } else {
            response.sendRedirect("FeedBackScreen.jsp");
        }
        
            
    }           

%>
        


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="resources/main/HeaderFooterStaff/header.jsp" />

    <section role="main" class="content-body">
            <header class="page-header">
                <h2>Add Feedback</h2>
            </header>

            <!-- start: page -->
            
            <form action="addFeedBackQuestion" method="POST">
                <input type="hidden" id="staffID" value="<%=staff_id%>" />
                    <div class="row" id="">
                            <div class="col">
                                    <section class="card">
                                            <header class="card-header">
                                                    <h2 class="card-title">Feedback Description</h2>

                                            </header>
                                            <div class="card-body">
                                                    <div class="form-group row pb-3 ">
                                                            <label class="col-lg-3 control-label text-lg-end pt-2">FeedBack Description</label>
                                                            <div class="col-lg-6">
                                                                <input class="form-control" id="FeedBackDesc"data-plugin-maxlength maxlength="255" autocomplete="off"/>
                                                            </div>
                                                    </div>
                                            </div>
                                    </section>
                            </div>
                    </div>


                    <div class="row" id="">
                            <div class="col">
                                    <section class="card">
                                            <header class="card-header">
                                                
                                                    <h2 class="card-title">Question List</h2>

                                            </header>
                                            <div class="card-body">
                                                    <div class="form-group row pb-3 Question1">
                                                            <label class="col-lg-3 control-label text-lg-end pt-2">Question 1 :</label>
                                                            <div class="col-lg-6">
                                                                <input class="form-control" id="Question1"data-plugin-maxlength maxlength="255" autocomplete="off" />
                                                            </div>
                                                    </div>
                                                
                                            </div>
                                            <footer class="card-footer">
                                                    <div class="row justify-content-end">
                                                            <div class="col-sm-8">
                                                                    <button class="btn btn-primary" type="button"id="AddQuestion">Add Question</button>
                                                                    
                                                            </div>
                                                            <div class="col-sm-2">
                                                                <button type="reset" class="btn btn-danger" onclick="window.location.reload();">Reset</button>
                                                                    
                                                            </div>
                                                            <div class="col-sm-2">
                                                                <button class="btn btn-primary" type="button"id="submit">Submit</button>
                                                                    
                                                            </div>
                                                    </div>
                                            </footer>
                                    </section>
                            </div>
                    </div>
                    

                
            </form>
            
            
            
            
            
            
            <!-- end: page -->
    </section>

    <jsp:include page="resources/main/HeaderFooterStaff/footer.jsp" />
    <script src="<c:url value="/resources/StaffAssets/customScript/addFeedback.js" />"></script>

</body>
</html>
<script>
    function tempForceScripts(){
        a;
    }
</script>

<script>
    
    $(document).ready(function(){
        
        <% if(CurrentStaff!=null){ %>
         $(".USERNAME").html("<%=username%>");
        <% } %>
        var questionTotal = 1;
  

        $("#AddQuestion").click(function(){

            var $QuestionDIV = $('div.Question'+questionTotal).eq(0); 
            questionTotal++;
            var nextQuestion = questionTotal;
            
            $QuestionDIV.after('<div class="form-group row pb-3 Question'+ nextQuestion +'">'+
                                    '<label class="col-lg-3 control-label text-lg-end pt-2">Question '+ nextQuestion +' :</label>'+
                                    '<div class="col-lg-6">'+
                                        '<input class="form-control" id="Question'+ nextQuestion +'" data-plugin-maxlength maxlength="255" autocomplete="off"/>'+
                                    '</div>'+
                                '</div>');
                        
            $("html, body").animate({ scrollTop: $(document).height() }, "fast");
           
        });
            
        
        $("#submit").click(function(){
            Submiting(questionTotal);
        });


    });

</script>