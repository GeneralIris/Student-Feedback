


function Submiting(x){
    
    var Questions = [];
    
    var FeedbackDesc = $("#FeedBackDesc").val();
    var StaffID = $("#staffID").val();
    var error = 0;
    
    if(FeedbackDesc===null || FeedbackDesc==="" )
        error=1;
    
    else{

        for(let i = 1 ; i<=x ; i++){

            var aQuestion = $('#Question'+i).val();

                if(aQuestion === ""){
                    error=2;
                    break;
                }

            Questions.push($('#Question'+i).val());


        }
    }

    if(error===1||error===2){
        Swal.fire({
            icon: 'error',
            title: '',
            html: 'Please Every Input',
            showConfirmButton : true
          });

    }else{

        Swal.fire({
            title: '',
            text: "Are you sure?",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.isConfirmed) {

                var params = {
                    Questions:Questions,
                    FeedbackDesc:FeedbackDesc,
                    StaffID:StaffID
                }

                $.ajax({
                    url : "AddFeedBack",    
                    method:"POST",     
                    data:JSON.stringify(params),
                    success:function(response){

                       if(response==="SQL Error"){
                            Swal.fire({
                                icon: 'error',
                                title: '',
                                text: 'DB Error!',
                                timer:1500,
                                showConfirmButton : false
                            }).then(() => {
                                location.reload(true);
                            })
                            
                       }else{
                           Swal.fire({
                                text: 'Feedback ' +FeedbackDesc+' addedd',
                                timer:2000,
                                icon :'success',
                                showConfirmButton : false
                            }).then(() => {
                                location.reload(true);
                            })
                           
                           
                           
                       }

                    }
                });





            }
        })
        
        
        
        
    }
    
  
    
}

