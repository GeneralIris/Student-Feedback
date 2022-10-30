<%@page import="com.server.model.Staff"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.server.utils.dbConnection"%>
<%@page import="com.server.model.Student"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FeedBack Screen</title>
          <jsp:include page="resources/main/Custom HeaderNFooter/header.jsp" />
         
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/style.css"/>">
       
     
     <style> 
     
       .box {
    border-radius: 20px;
    padding: 30px 40px;
    z-index: 0;
    margin: auto;
    width: 50%;
    padding: 10px;
  }
  
   form {
    background:#3A3F62;
    padding: 2.5rem 3rem;
    border-radius: 0.9rem;
  }
  .questions {
    margin: 0 auto 0.5rem auto;
    padding: 0.1rem;
    color: white;
  }
  
  .input-radio {
    display: inline-block; 
    margin-right: 0.625rem;
    margin-bottom: 1.4rem;
    
  }
     </style>
    </head>
    <body>
        <div class="container">
             <nav class = "navbar navbar-expand-sm navbar-dark bg-secondary">
            <a class = "navbar-brand" href = "#">IT FEEDBACK SYSTEM</a>
        </div>
       <% 
              
     String username;
     String stud_id ="";
     int rank;
     Student CurrentStudent =null;
     Staff CurrentStaff = null;
           
    if(session.getAttribute("36F7TUs92NgC87MMd7A88pLK2H9Ri8GzpvZdbb3ZHHuB9fhrVz")==null){
        response.sendRedirect("Login.jsp");
    }
    else{
        
        Object a = session.getAttribute("36F7TUs92NgC87MMd7A88pLK2H9Ri8GzpvZdbb3ZHHuB9fhrVz");

        if(a instanceof Student){
            CurrentStudent = (Student) a;
             username = CurrentStudent.getUserName();
             stud_id = CurrentStudent.getStudentID();
            
            
        } else {
            response.sendRedirect("staffMain.jsp");
        }
        
            
    }            %>
        <%
            
            
        int count = 1;
        Connection conn =null;
        ResultSet rs = null,newRs = null;
        PreparedStatement stmt =null;
        try{
            conn = dbConnection.prepConnection();
            
            stmt = conn.prepareStatement("SELECT FEEDBACKID FROM FEEDBACK WHERE FEEDBACKAVAIL=1");
            rs = stmt.executeQuery();
            
            if(rs.next()){
            
                int feedbackAvail=rs.getInt(1);
            
                stmt = conn.prepareStatement("SELECT STUDENTANSWERID FROM STUDENTANSWER  SA " 
                                           + "JOIN QUESTION Q ON SA.QUESTIONID = Q.QUESTIONID "
                                           + "WHERE Q.FEEDBACKID=? AND SA.STUDENTID=?");
                 stmt.setInt(1,feedbackAvail);
                 stmt.setString(2,stud_id);
                 rs = stmt.executeQuery();
                 if(rs.next()){
                     %>
                        <div class="box"> <h1> You have filled up the feedback.</h1>  
                        <button  onclick="gudBye()"type="button" class="btn btn-danger">Log Out</button>
                        <button  onclick="viewStudent()"type="button" class="btn btn-danger">View Feedback</button></div>


                         <%
                 }
                else {
                    stmt = conn.prepareStatement("SELECT FEEDBACKID  FROM FEEDBACK  WHERE FEEDBACKAVAIL=1");
                    stmt.setMaxRows(1);
                    rs = stmt.executeQuery();
                    int theFeedBackID = 0;

                    while(rs.next()){
                        theFeedBackID = rs.getInt(1);
                    }

                    if(theFeedBackID!=0){

                        stmt = conn.prepareStatement("SELECT * FROM QUESTION  WHERE FEEDBACKID=? ORDER BY QUESTIONID ");
                        stmt.setInt(1,theFeedBackID );
                        rs = stmt.executeQuery();


                    %>


                    <div class="box">
                     <form class="form-inline" action="StoreFeedbackServlet" method="POST">
                        <span style="color:red"> 
                     <%=(request.getAttribute("errMessage")  == null) ? "": 
                        request.getAttribute("errMessage")%></span>


                        <input type="hidden" class="form-control"  name="StudId" value="<%= stud_id %>">
                        <input type="hidden" name="feedbackID" value="<%=theFeedBackID%>">
                    <%

                    while(rs.next()){

                        %>
                            <div class="questions"> 
                                <%= count%>. <%=rs.getString("QUESTIONDESC") %>
                                </p>
                                <%
                                    try
                                    {
                                        stmt = conn.prepareStatement("SELECT * FROM RATINGTYPE");
                                        newRs = stmt.executeQuery();
                                        while(newRs.next())
                                        {
                                        %>
                                        <div class="radiocontainer">
                                        <input class="input-radio" type="radio" id="ratingType" name="ratingType<%=count%>" value="<%= newRs.getInt("RATINGTYPEID")%>" required>
                                            <label for="ratingType"><%= newRs.getString("RATINGTYPEDESC") %></label><br> 
                                            </div>
                                        <%
                                        }
                                    }
                                    catch (Exception e) {e.printStackTrace() ;}

                                count++;
                    }%>
                            </div>
                            <br>
                          <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                            </div>
                    <%
                    }
                }
            }
            else{
                %>
                        <div class="box"> <h1> No more feedbacks available at this time.<br>Please return once available</h1>  
                        <button  onclick="gudBye()"type="button" class="btn btn-danger">Log Out</button>
                        


                <%
            }

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
        
        <script>
        
        function viewStudent(){
            window.location.href = "viewStudentAnswer.jsp";
        }
        
    </script>
        
               <script>
        
        function gudBye(){
            window.location.href = "Logout.jsp";
        }
        
    </script>
  
    </body>
</html>