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
                                    <h4 class="font-size-50 mt-4 text-center">One Time Register</h4>
                                    <c:if test="${not empty Msgs}">               
                                        <font color='green'>
                                        <p>
                                        <ul>
                                            <c:forEach var="message" items="${Msgs}">
                                                <li>${message}</li>
                                                </c:forEach>
                                        </ul>
                                        </font>
                                        </p>
                                    </c:if>
                                    <form class="form" action="staffRegister"method="POST">
                                        <div class="row">
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label" for="useremail">Email</label>
                                                <label class="font-size-12 text-danger displayErr" id="disp"></label>
                                                <input type="email" class="form-control verify" id="staffemail" name="staffemail"  autocomplete="off" placeholder="Enter email">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label" for="phonenumber">Phone number</label>
                                                <input type="text" class="form-control" id="staffphonenumber" name="staffphonenumber"  autocomplete="off" placeholder="Enter phone number">
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label" for="name">Name</label>
                                                <input type="text" class="form-control" id="name" name="staffname"  autocomplete="off" placeholder="Enter name">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label" for="username">Username</label>
                                                <input type="text" class="form-control" id="name" name="staffusername"  autocomplete="off" placeholder="Enter user name">
                                                
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label" for="name">Staff ID</label>
                                                <input type="text" class="form-control" id="name" name="staffid"  autocomplete="off" placeholder="Enter Id">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label" for="password1">Password</label>
                                                <input type="password" class="form-control" id="password1" name="staffpassword1"  autocomplete="off" placeholder="Enter password">
                                            </div>

                                            <div class="col-md-6 mb-3">
                                                <label class="form-label" for="password2">Re-Enter Password</label>
                                                <div class="input-group" id="show_hide_password">
                                                    <input class="form-control"  style="width:70%;" type="password" id="password2" name="staffpassword2"  autocomplete="off" placeholder="Re-Enter password">
                                                    <a class="form-control text-center">
                                                            <i class="fa fa-eye-slash " aria-hidden="true" style="hover{color:#333}">
                                                            </i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <div class="col-md-6 mb-3">
                                                <button class="btn btn-danger w-md waves-effect waves-light" id="login_page" type="button">Cancel</button>
                                            </div>
                                            <div class="col-md-6 mb-3 text-end">
                                                <button class="btn btn-primary w-md waves-effect waves-light" type="submit">Register</button>
                                            </div>
                                         </div>
                                        <div class="mb-0 row">
                                            <div class="col-12 ">
                                                <p class=" text-muted mb-0">By registering you agree to the B.E.A.S.T <a href="#">Terms of Use</a></p>
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

                $("#login_page").click(function(){

                    window.location.href="Login.jsp";

                })
                $("#show_hide_password a").on('click', function(event) {
			
			        ShowPass1();

			    });

            })



        </script>
        

    </body>
</html>