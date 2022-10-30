<%@page import="com.server.model.Staff"%>
<%@page import="com.server.model.Student"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%  
    response.setHeader( "Pragma", "no-cache" );
    response.setHeader( "Cache-Control", "no-cache" );
    response.setDateHeader( "Expires", 0 );
    

 
        
    if(session.getAttribute("36F7TUs92NgC87MMd7A88pLK2H9Ri8GzpvZdbb3ZHHuB9fhrVz")!=null){
      
        Object a = session.getAttribute("36F7TUs92NgC87MMd7A88pLK2H9Ri8GzpvZdbb3ZHHuB9fhrVz");

        if(a instanceof Student){
  
            response.sendRedirect("FeedBackScreen.jsp");
            
            
        } 
        
        else if(a instanceof Staff) {
             response.sendRedirect("staffMain.jsp");
        }
        
            
    }


%>



<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Login | User</title>
        <jsp:include page="resources/main/Custom HeaderNFooter/header.jsp" />
    </head>
    <body>
        <!-- Loader -->
            <div id="preloader"><div id="status"><div class="spinner"></div></div></div>

         <!-- Begin page -->
        <div class="accountbg" style="background: url('<c:url value="/resources/assets/img/bg/space.gif"/>');background-size: cover;background-position: center;"></div>
        <div class="account-pages mt-5 pt-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-5 col-xl-4">
                        <div class="card" style="background-color: rgba(0,0,0,.8);color: #fff;">
                            <div class="card-body">
                                <div class="text-center mt-4">
                                    <div class="mb-3">
                                        <a><img src="<c:url value="/resources/assets/img/bg/uitm.png"/>" height="50%" width="80%"alt="logo"></a>
                                    </div>
                                </div>
                                <div class="p-3">
                                    <h3 class="font-size-18 mt-2 text-center">Login</h3>
                                    <p class="text-muted text-center mb-4">Sign In To Access The System.</p>
                                    <form class="form-horizontal" method="POST" action="LoginProcess">
    
                                        <div class="mb-3">
                                            <label class="form-label" for="username">UserName</label>
                                            <input type="text" class="form-control" id="username" name="username" placeholder="Enter user name" autocomplete="off" required>
                                            <%
                                                if(session.getAttribute("userErr")!=null && session.getValue("userErr").equals("G75L2584YyE2X2QHP39L")){
                                                    
                                                    out.println("<label class='form-label font-size-12 text-danger' for='username'>*Email is not valid!</label>");
                                                    
                                                }
                                                else if ((session.getAttribute("loginErr")!=null && session.getValue("loginErr").equals("zd4zw4Wb4MD8pX6297m8"))){
                                                    out.println("<label class='form-label font-size-12 text-danger' for='username'>*Check your credentials again!</label>");
                                                }
                                                else if((session.getAttribute("statusErr")!=null)&& (session.getAttribute("statusErr").equals("s84T6H27rwD5P75Ro5M2"))){
                                                    out.println("<label class='form-label font-size-12 text-danger' for='username'>*Particular Staff are not allowed to enter!</label>");
                                                }
                                                
                                               
                                            %>
                                        </div>
    
                                        <div class="mb-3">
                                            <label class="form-label" for="userpassword">Password</label>
                                            <div class="input-group" id="show_hide_password">
                                                <input type="password" class="form-control" style="width:80%;" id="userpassword" name="userpassword" placeholder="Enter password" autocomplete="off" required>
                                                <a class="form-control text-center" >
                                                    <i class="fa fa-eye-slash" aria-hidden="true" style="hover{color:#333}">
                                                    </i>
                                                </a>        
                                            </div>
                                            <%
                                                if(session.getAttribute("passErr")!=null && session.getValue("passErr").equals("ABfUdir77z24326255yM")){
                                                    out.println("<label class='form-label font-size-12 text-danger' for='userpassword'>*Password requirement haven't met !</label>");
                                                }
                                            %>
                                            
                                        </div>
    
                                        <div class="row mt-6">
                                            <div class="">
                                                <a href="Register.jsp"><button class="btn btn-primary w-md waves-effect waves-light" type="button">Register</button></a>
                                                <button class="btn btn-primary w-md waves-effect waves-light" type="submit">Log In</button>
                                            </div>
                                        </div>
                                    </form>
    
                                </div>
    
                            </div>
                        </div>
                        <div class="mt-5 text-center position-relative">
        <jsp:include page="resources/main/Custom HeaderNFooter/footer.jsp" /> 
       
        <script src="<c:url value="/resources/main/Loader/loader.js" />"></script>
        <script>

            $(document).ready(function(){
                $("#show_hide_password a").on('click', function(event) {
            
                    ShowPass2();

                });

            })

        </script>
        

    </body>
</html>



