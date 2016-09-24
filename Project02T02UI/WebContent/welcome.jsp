 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Welcome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="jquery.min.js"></script>
    <!-- Bootstrap -->
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    
     <script type="text/javascript">
        function sendSession() {
            window.location.href = "listvms.jsp?userName=<%=session.getAttribute("userName")%>";
        }
    </script>
</head>
<!--div id="bar"><h4 style="float:left;color:white">Welcome <%=session.getAttribute("userName")%></h4><p style="color:white;font-family:Arial;margin:15px 0px 0px 580px;">CMPE-283 Project1</p></div-->
 <div id="bar" onclick=detunav() > <span id="emer" style="float:left;color:white;margin:8px 20px 0px 20px;font-family:sans-serif;opacity:1!important" onmouseover="emeron()" ><b> About ?</b></span>

   <span style="float:left;color:white;margin:8px 20px 0px 500px;font-family:sans-serif;opacity:1!important" > The Log

<span class="glyphicon glyphicon-duplicate" style="color:red;border:1px ridge blue" ></span>
  Manager

   </span>

   <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="float:right;color:white;margin:10px 20px 0px 0px;font-family:sans-serif;opacity:1!important" onclick="register()">
   <a href="logout.jsp" class="formdesc" style="text-decoration:none;color:white">Logout</a></span>


   </div>
   
    <div id="container-fluid">

    <div id="info" style="color:white">

    <span id="infocont" style="display:none">
   The application is a management tool
   </br>Helps manage the virtual machines and many more.. </span>

    <span id="close" onclick="emeroff()">Close</span>


   </div>
<!--a href="logout.jsp" class="formdesc" style="text-decoration:none;color:white;margin-left:1200px">Logout</a-->
<body>
    <div id="video">
        
                <video id="lvid" autoplay loop> 
                        <source src="1.mp4" type="video/mp4" />
                </video>
                    <video id="lvid" autoplay loop> 
                        <source src="3.mp4" type="video/mp4" />
                </video>
                    <video id="lvid" autoplay loop> 
                        <source src="2.mp4" type="video/mp4" />
                </video>
                    <video id="lvid" autoplay loop> 
                        <source src="4.mp4" type="video/mp4" />
                </video>
                
    </div>
<%
    if(session.getAttribute("userName") == null) {
        response.sendRedirect("error.jsp?error=No session.. You must login to see the page");
    }
%>
 
            <div id="row" >
                <div class="formdesc" style="margin-left:90px;">
                    <h4 style="color:rgba(255,255,255,1)"><u>OPTIONS</u></h4>
                </div>
                 <div class="panel-body" >
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="formdesc" onclick=det1av() >
                                DashBoard</label>
                            <!--div class="col-md-4">
                                <a href="createsel.jsp" class="forminp">Create VM</a>
                            </div-->
                        </div>
                        <div class="form-group">
                            <label class="formdesc" onclick=det2av() >Elastic search browser</label>
                            <!--div class="col-md-4">
                                <a href="listvms.jsp" class="forminp">List VMs</a>
                            </div-->
                        </div>
                        <div class="form-group">
                            <label class="formdesc" onclick=det3av() >Create alarm</label>
                            <!--div class="col-md-4">
                                <a href="perfstats.jsp" class="forminp">Perf Stats</a>
                            </div-->
                        </div>
                    </form>
                </div>
                 
            </div>
     
     	<div id="detail1">
     		
     		<div class="col-md-4">
     							<p style="color:white;font-weight:30px;margin-left:20px">Visualized virtual machine's statistics generated from the logs.</p>
                                <a href="http://ec2-52-8-102-203.us-west-1.compute.amazonaws.com:9200/_plugin/head/" class="btn btn-warning" style="margin:10px 0px 0px 60px">Go!</a>
                            </div>
     	
     	</div>
     		<div id="detail2">
     		
     		<div class="col-md-4">
     		<p style="color:white;font-weight:30px;margin-left:20px">Go to the logs and look specifically</p>
                                <a href="http://ec2-52-8-102-203.us-west-1.compute.amazonaws.com:5601/#/discover?_g=()&_a=(columns:!(_source),index:'logstash-*" 
                                class="btn btn-warning" style="margin:50px 0px 0px 60px" >Go!</a>
                            </div>
     	
     	</div>
     		<div id="detail3">
     		
     		<div style="padding:20px 20px 20px 20px">
     		<p style="color:white;font-weight:30px;margin-left:20px">Get yourself notified by setting up the alarms.</p>
                                <button class="btn btn-warning" id="alarm" style="margin:50px 0px 0px 60px" onclick="alarmset()">Go!</button>
                                
            </div> </div>
           <div id="detail3e" style="padding:40px 40px 40px 40px"> 
     <form class="form-horizontal" role="form" action="setalarm.jsp">
     		<p style="color:white;font-weight:30px"><b>PLEASE FILL IN THE DETAILS:</b></p>
     		
     		<label>VM Name</label>
			<input type="text" class="form-control" name="vmname" placeholder="VM for which alarm is required">
															
															
     		<label class=" col-md-4" style="margin:80px 0px 40px 40px">Select Metric
     		<select name="metric" class=" btn btn-group dropdown-toggle btn-warning"  style="width:15ss0px">
                                                                        <option value="cpu">CPU</option>
                                                                        <option value="mem">MEMORY</option>
																		 
																		</select></label>
			 <label  class=" col-md-4" style="margin:80px 0px 40px 60px">Value 
     		<select  name="threshold" class=" btn btn-group dropdown-toggle btn-warning"  style="width:150px">
                                                                        <option value="null">Select Value</option>
                                                                        <option value="10">10%</option>
																		<option value="20">20%</option>
																		<option value="30">30%</option>
																		<option value="40">40%</option>
																		<option value="50">50%</option>
																		<option value="60">60%</option>
																		<option value="70">70%</option>
																		<option value="80">80%</option>
																		<option value="90">90%</option>
																		<option value="100">100%</option>
																		</select></label>

                                <button class="btn btn-danger" id="alarm" style="margin:50px 0px 0px 170px">SET ALARM</button>
                                
                                </form>
                                
                            </div>
                            
            
     	</div>
 



<style type="text/css">

body{


    background-color:black;
}

#bar{
                color: white;
                width: 100%;
                border: 2px ridge gray;
                background-color:black;
                margin:auto;
                height: 50px;
                position: absolute;
                background-image: url('pattern.png');
            }

     #row{   position: absolute;
                        color: white;
                        border: 4px groove gray;
                        width: 450px; 
                        padding: 40px 20px 20px 45px;
                        margin: auto;
                        margin-top: 180px;
                        margin-left: 430px;
                        background-color: rgba(0,0,0,0.2);
                        background-image: url('pattern.png');

            }

            #video{

                 
                height: 0%;
                z-index: -1000;
                position: absolute;
                margin-left:4%;

            }

            video{

                border: 2px solid white;
                opacity: 0.5;
            }
#main{

    
    border: 3px ridge rgba(255,153,0,0.9);
    background-color: rgba(0,0,0,0.5);
    width: 400px !important;
    padding: 50px 0px 0px 80px;
    border-radius:100px;
    height:390px;
    margin: 180px 0px 0px 400px;
}


.col-md-4{
	 margin-top: 10px;
	 padding: 5px 5px 5px 5px;
	 width:150px;
}


.form-group{
	margin-top: 20px;
}

.lgin{

    width: 80px;
    height: 30px;
    color:black;
    margin:20px 0px 0px 70px;
 
}

label{
	color:white;
}

.sgup{
    
    text-decoration:none;
    color:black;
    font-weight:100px !important;
    margin-top:20px;
    float:right;
    margin-right:30px;

}


 
   #emer:hover{

        color: red !important;
        cursor: pointer;



      }


      #info{
        font-weight: 30px;
        color: red;
        border: 2px ridge black;
        width: 300px;
        height: 300px;
        position: absolute;
        margin: 50px 0px 0px 30px;
      background-image: url('pattern.png');
      background-color: rgba(255,255,255,0.3);
      padding: 100px 10px 10px 30px;
      border-radius: 300px;
      display: none;
      

      }

      #rush,#close{

        text-decoration: none;
        color: yellow;
       margin-left:40px;
       float: left;
       margin-top: 20px;
         
      }


     #rush,#close:hover{

       cursor: pointer;
         
      }
      
      #detail1{
      
      background:rgba(0,0,0,0.7);
      width:200px;
      height:200px;
      float:right;
      margin:100px 50px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
      
      #detail2{
      
       background:rgba(0,0,0,0.7);
      width:200px;
      height:200px;
      float:left;
      margin:400px 100px 0px 50px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
      
      #detail3{
      
      background:rgba(0,0,0,0.7);
      width:200px;
      height:200px;
      float:right;
      margin:70px 150px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
      
      #detail3e{
      
      background:rgba(0,0,0,0.7);
      width:500px;
      height:80%;
      float:right;
      margin:70px 150px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
 

</style>
 <script type="text/javascript">
 
function det1av(){
	
	$("#detail1").show("slow");
	$("#detail2").hide("slow");
	$("#detail3").hide("slow");
	$("#detail3e").hide("slow");
	$("#row").animate({
		 marginLeft:"430px"
	 },500);
	
}

function det2av(){
	
	$("#detail1").hide("slow");
	$("#detail2").show("slow");
	$("#detail3").hide("slow");
	$("#detail3e").hide("slow");
	$("#row").animate({
		 marginLeft:"430px"
	 },500);
}

function det3av(){
	
	$("#detail1").hide("slow");
	$("#detail2").hide("slow");
	$("#detail3").show("slow");
	$("#detail3e").hide("slow");
	$("#row").animate({
		 marginLeft:"430px"
	 },500);
}

function detunav(){
	
	$("#detail1").hide("slow");
	$("#detail2").hide("slow");
	$("#detail3").hide("slow");
	$("#detail3e").hide("slow");
	$("#row").animate({
		 marginLeft:"430px"
	 },500);
}
 

 function emeron(){

  $("#sgup").animate({
    marginLeft:"500px"},1000);
   $("#info").show("veryslow");
   $("#infocont").show("slow");

  
 
 }
 function emeroff(){
  $("#info").hide("slow");
  $("#sgup").animate({
    marginLeft:"30px"},1000);
  $("#info").hide("slow");
  $("#infocont").hide("slow");
 }

 function alarmset(){
	 
	 $("#detail3").hide("slow");
	 $("#detail3e").show("slow");
	 $("#row").animate({
		 marginLeft:"100px"
	 },500);
 }
              
</script>
</html>
