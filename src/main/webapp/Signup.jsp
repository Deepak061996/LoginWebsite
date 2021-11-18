<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
<title>Jsp page</title>
</head>
<body style="background:url(img/pic1.jpg);background-size:cover;background-attachment:fixed">
  <div class="container">
      <div class="row">
      
         <div class="col m6 offset-m3">
              <div class="card">
                   <div class="card-content">
                    <h1 style="margin-top:10px" class="center-align"> Register hear  !!!</h1>
                    <% out.println("---------------------------------------------------------------------------"); %>
                    <h5 id="msg" class="center-align"></h5>
                     
                     <div class="form center-align">
                    
                     <form action="Register" method="post" id="myform">
                       <!--Creating form -->
                       <input type="text" name="user_name" placeholder="Enter user name" required />
                       <input type="password" name="user_password" placeholder="Enter password" required/>
                       <input type="email" name="user_email" placeholder="abc@gmail.com" required/>
                       <div class="file-field input-field">
					      <div class="btn blue">
					        <span>File</span>
					        <input name="image" type="file">
					      </div>
					      <div class="file-path-wrapper">
					        <input class="file-path validate" type="text" placeholder="uplod the file........." required>
					      </div>
					    </div>
                       
                       <button type="submit" class="btn   light-blue accent-3">Submit</button>
                       <button type="reset" class="btn   light-blue accent-3">Reset</button>
                     </form>
                     </div>
                     
                     <div class="loader center-align" style="margin-top:10px;display:none;">
                      <div class="preloader-wrapper big active">
					      <div class="spinner-layer spinner-blue">
					        <div class="circle-clipper left">
					          <div class="circle"></div>
					        </div><div class="gap-patch">
					          <div class="circle"></div>
					        </div><div class="circle-clipper right">
					          <div class="circle"></div>
					        </div>
					      </div>
					
					      <div class="spinner-layer spinner-red">
					        <div class="circle-clipper left">
					          <div class="circle"></div>
					        </div><div class="gap-patch">
					          <div class="circle"></div>
					        </div><div class="circle-clipper right">
					          <div class="circle"></div>
					        </div>
					      </div>
					
					      <div class="spinner-layer spinner-yellow">
					        <div class="circle-clipper left">
					          <div class="circle"></div>
					        </div><div class="gap-patch">
					          <div class="circle"></div>
					        </div><div class="circle-clipper right">
					          <div class="circle"></div>
					        </div>
					      </div>
					
					      <div class="spinner-layer spinner-green">
					        <div class="circle-clipper left">
					          <div class="circle"></div>
					        </div><div class="gap-patch">
					          <div class="circle"></div>
					        </div><div class="circle-clipper right">
					          <div class="circle"></div>
					        </div>
					      </div>
					    </div>
					    <h5>Please wait....</h5>
                     </div>
                   </div>
              </div>
          
         </div>
      
      </div>
  </div>
   
  <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
  <script>
  
  $(document).ready(function(){
	 console.log("page ready..");
	 
	 $("#myform").on('submit',function(event){
		 event.preventDefault();
		 
		 $(".loader").show();
		 $(".form").hide();
		 
//		 var f=$(this).serialize();
 
          let f=new FormData(this);
		 
		 console.log(f);
		 
		 $.ajax({
			 url:"Register",
			 data:f,
			 type:'POST',
			 success:function(data, textStatus, jqXHR){
				 console.log(data);
				 console.log("Success......");
				 $(".loader").hide();
				 $(".form").show();
				 
				 if(data.trim() === 'done')
				{
					 $('#msg').html("Successfully Registered  !!!")
					 $('#msg').addClass('green-text') 
				}
				 else
				{
					 $('#msg').html("Something went wrong on server.....  !!!") 
					  $('#msg').addClass('red-text')
				}
				 
			 },
			 error:function(jqXHR,textStatus,errorThrown){
				 console.log(data);
				 console.log("error......");
				 $(".loader").hide();
				 $(".form").show();
				 $('#msg').html("Something went wrong on server.....  !!!")
			 },
			 
			 processData: false,
			 contentType: false
		 })
	 })
  })
  
  
  </script>
</body>
</html>