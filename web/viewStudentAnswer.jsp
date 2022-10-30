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
            
            
            stmt = conn.prepareStatement("SELECT FEEDBACKID FROM FEEDBACK  WHERE FEEDBACKAVAIL=1");
            stmt.setMaxRows(1);
            rs = stmt.executeQuery();
            int theFeedBackID = 0;
            
            while(rs.next()){
                theFeedBackID = rs.getInt(1);
            }
            
            if(theFeedBackID!=0){
            
                stmt = conn.prepareStatement("SELECT r.RATINGTYPEDESC, s.RATINGTYPEID, r.RATINGTYPEID, s.STUDENTID, q.QUESTIONDESC, q.QUESTIONID, s.QUESTIONID FROM QUESTION q, RATINGTYPE r, STUDENTANSWER s WHERE q.FEEDBACKID=? ORDER BY q.QUESTIONID ");
                stmt.setInt(1,theFeedBackID );
                rs = stmt.executeQuery();
                
                
                %>
                
                <div class="box">
                 <form class="form-inline">
                    <span style="color:red"> 
                 <%=(request.getAttribute("errMessage")  == null) ? "": 
                    request.getAttribute("errMessage")%></span>
                     <div class="questions"> 
                    Student ID:
                    <input type="text" name="StudId" value="<%= stud_id %>" disabled> <br><br>
                <%
                while(rs.next()){
                        String stud_idDB = rs.getString(4);
                        int rate1 = rs.getInt(2);
                        int rate2 = rs.getInt(3);
                        int ques1 = rs.getInt(6);
                        int ques2 = rs.getInt(7);
                        if(stud_id.equals(stud_idDB) && rate1 == rate2 && ques1 == ques2)
                        {
                    %>
                            
                            <%= count%>. <%=rs.getString(5) %>
                            <label for="ratingType"></label><br> 
                            <input type="text" value="<%= rs.getString(1) %>" disabled> <br><br>
                    <%  
                             count++;
                        }
                                    
                           
                }%>
                        </div>
                        <br>
                        <button  onclick="logout()"type="button" class="btn btn-danger">Logout</button>
                    </form>
                        </div>
                        
                <%
            }

            

        } catch (Exception e) {
        e.printStackTrace();
        }
        %>
        
    </body>
</html>

<script>
        
        function logout(){
            window.location.href = "Logout.jsp";
        }
        
        
    

    </script>