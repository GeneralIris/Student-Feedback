	
/////////////////////////////////////////////////////INPUT CHECKER/////////////////////////////////////////
var delayInMilliseconds = 500; 
	
	function Error(){

		setTimeout(function() {
 
		    Swal.fire({
		        icon: 'error',
		        title: 'ERROR OCCURED',
		        text: 'Unfortunately we can\'t send any email to you!',
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,
		    })

	    }, delayInMilliseconds);
	}


	function Empty(){

		setTimeout(function() {
 
		    Swal.fire({
		        icon: 'error',
		        title: 'Warning Not All Data Inserted',
		        text: 'Please ensure ALL data is added',
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,
		    })

	    }, delayInMilliseconds);
	}
	function WrongEmail(){
			
		setTimeout(function() {

		    Swal.fire({
		        icon: 'error',
		        title: 'Email Is Invalid',
		        text: 'Please Enter A Valid Email',
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,
		    })
		}, delayInMilliseconds);

	}
	function UserName(){
			
		setTimeout(function() {

		    Swal.fire({
		        icon: 'error',
		        title: 'User Name Error',
		        text: 'Ensure Only Characters Exist In The Input',
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,

		    })
		}, delayInMilliseconds);
	}
	function Phone(){
			
		setTimeout(function() {

		    Swal.fire({
		        icon: 'error',
		        title: 'Phone Number Error',
		        html: 'Ensure Only Numbers ex:<i>01234567890</i>',
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,

		    })
		}, delayInMilliseconds);
	}
	function Address(){
			
		setTimeout(function() {

		    Swal.fire({
		        icon: 'error',
		        title: 'Address Error',
		        html: 'Ensure All Address Are Entered',
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,

		    })
		}, delayInMilliseconds);
	}
	function Pass(){
			
		setTimeout(function() {

		    Swal.fire({
		        icon: 'error',
		        title: 'Password Error',
		        html: '<b>Ensure Password Contains Atleast :</b><br><br>'+
		        	  '<b>Minimum length 8   <br>'+
		        	  'Maximum length 30  </b><br>'+
		        	  '1 Special Character<br>'+
		        	  '1 Upper Case Letter<br>'+
		        	  '1 Lower Case Letter<br>'+
		        	  '1 Number <br>'
		        	  ,
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,

		    })
	    }, delayInMilliseconds);
	}




//////////////////////////////////////////////////////LIVE EMAIL CHECKER///////////////////////////////////
	function Checker(code){

		var value = $('.verify').val();
		if(value==""){
			$("#disp").text("");
		}
		else{
	    	$.ajax({

	    		type:"POST",
	    		url: "../Login/methods.php",
	    		data: {
	    			"EmailExists" : 1,
	    			"Email" : value,
	    			"Vers" : code
	    		},
	    		success: function(response){
	    			if(response=='Email allowed'){
	    				$("#disp").removeClass("text-danger");
	    				$("#disp").addClass("text-success");
	    				$("#disp").text(response);
	    			}
	    			else{
	    				$("#disp").removeClass("text-success");
	    				$("#disp").addClass("text-danger");
	    				$("#disp").text(response);

	    			}
	    		}

	    	})
	    }

	}






///////////////////////////////////////////////REDIRECT FUNCTION////////////////////////////////////////////
	function Redirect(){
		window.location.href = "../Index/index.php";
	}
	

	function RedirectLogin(){
		window.location.href = "../Login/login.php";
	}









////////////////////////////////////////////////////////VIEW PASS/////////////////////////////////////////

	function ShowPass1(){

		event.preventDefault();
        if($('#show_hide_password input').attr("type") == "text"){
            $('#show_hide_password input').attr('type', 'password');
            $('#password1').attr('type', 'password');
            $('#show_hide_password i').addClass( "fa-eye-slash" );
            $('#show_hide_password i').removeClass( "fa-eye" );

        }else if($('#show_hide_password input').attr("type") == "password"){
            $('#show_hide_password input').attr('type', 'text');
            $('#password1').attr('type', 'text');
            $('#show_hide_password i').removeClass( "fa-eye-slash" );
            $('#show_hide_password i').addClass( "fa-eye" );
        }
	}

	function ShowPass2(){

		event.preventDefault();
        if($('#show_hide_password input').attr("type") == "text"){
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass( "fa-eye-slash" );
            $('#show_hide_password i').removeClass( "fa-eye" );

        }else if($('#show_hide_password input').attr("type") == "password"){
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass( "fa-eye-slash" );
            $('#show_hide_password i').addClass( "fa-eye" );
        }
	}



////////////////////////////////SUCCESS//////////////////////////////////////////////////////


	function RegSuccess(){
			
		setTimeout(function() {

		    Swal.fire({
		        icon: 'success',
		        title: 'Register Successfull',
		        html: 'Please check your email to complete the registration',
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,
		        showConfirmButton: false,
		        timer: 1500
		    })
		}, delayInMilliseconds);
	}

	function RecoverSuccess(){

		setTimeout(function() {

		    Swal.fire({
		        icon: 'success',
		        title: 'Check You Email For Futher Instruction To Recover Your Password',
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,
		    })
		}, delayInMilliseconds);


	}
	function UpdatePassSuccess(){

		setTimeout(function() {

		    Swal.fire({
		        icon: 'success',
		        title: 'Your Password Has Been Changed.You May Try To Relogin',
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,
		    })
		}, delayInMilliseconds);


	}
	function RegistrationCompleted(){

		setTimeout(function() {

		    Swal.fire({
		        icon: 'success',
		        title: 'Registration has been completed.You May Try To Relogin',
		        allowOutsideClick: false,
		        allowEscapeKey: false,
		        allowEnterKey: false,
		    })
		}, delayInMilliseconds);


	}