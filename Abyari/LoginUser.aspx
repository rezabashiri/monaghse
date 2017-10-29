<%@ Page Language="C#" Title="ورود اعضا" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs"  Inherits="Abyari.LoginUser" %>
<html  id="extr-page">
	
<!-- Mirrored from 192.241.236.31/themes/preview/smartadmin/1.8.x/ajax/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Jul 2017 06:57:55 GMT -->
<head>
		<meta charset="utf-8">
		<title>سامانه جامع انجمن صنفی پیمانکاران آبیاری تحت فشار استان اصفهان</title>
		<meta name="description" content="سامانه جامع اعلان : مدیریت مناقصات و کنترل پروژه های آبیاری تحت فشار">
		<meta name="keyboard" content="مرورگران_نوآوری_توسعه,مرورگران">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<!-- #CSS Links -->
		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css"   href="/Design/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css"  href="/Design/css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<%--<link rel="stylesheet" type="text/css" media="screen" href="/Design/css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css"   href="/Design/css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css"   href="/Design/css/smartadmin-skins.min.css">

		<!-- SmartAdmin RTL Support -->
		<link rel="stylesheet" type="text/css" media="screen" href="/Design/css/smartadmin-rtl.min.css"> --%>

		<!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

    <link href="/Design/css/custom.css" rel="stylesheet" />


		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="/Design/img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">

 

		<!-- #APP SCREEN / ICONS -->
		<!-- Specifying a Webpage Icon for Web Clip 
			 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
		<link rel="apple-touch-icon" href=" img/splash/sptouch-icon-iphone.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">
		
		<!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		
		<!-- Startup image for web apps -->
		<link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
		<link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
		<link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <style type="text/css">
            body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(/Design/img/metropolitan.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}
            @media screen and (min-width:768px) {
               body > .row {
                padding-top:8%;
                }
            }
        </style>
    <script src="Design/js/libs/jquery-2.1.1.min.js"></script>
 
    <script src="Design/js/bootstrap/bootstrap.min.js"></script>

	</head>
	
	<body class="animated fadeInDown  " style="overflow-x:hidden">
         <div class="body"></div>
	 

				<div class="row text-block">
			
            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 hidden-xs hidden-sm center-block">
							<img src="/Design/img/demo/iphoneview.png" class="pull-right " alt="" style="width:210px">

                        </div>
				 
                                   <form id="Form1" name="login-form"    runat="server">
                                          <telerik:RadScriptManager  ID="RadScriptManager1"  runat="server"></telerik:RadScriptManager>
                             
                    <div class="col-md-4 col-sm-12 text-center">
               
                    <uc1:SignUp ID="v" GroupName="پیمانکاران"   runat="server" />
                    </div>
                        <div class="col-md-4 col-sm-12 text-center">
               
                    <uc1:Login runat="server" ID="LoginControl"></uc1:Login>
    

                    </div>
                
                                         </form>
				 
			</div>
        

		
		<!--================================================== -->	

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
	<%--	<script src="js/plugin/pace/pace.min.js"></script>

	    
		<script> if (!window.jQuery) { document.write('<script src="/Design/js/libs/jquery-2.1.1.min.js"><\/script>'); } </script>

	    
		<script> if (!window.jQuery.ui) { document.write('<script src="/Design/js/libs/jquery-ui-1.10.3.min.js"><\/script>'); } </script>

		<!-- IMPORTANT: APP CONFIG -->
		<script src="/Design/js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

		<!-- BOOTSTRAP JS -->		
		<script src="/Design/js/bootstrap/bootstrap.min.js"></script>

	 
		
		<!-- JQUERY MASKED INPUT -->
		<script src="/Design/js/plugin/masked-input/jquery.maskedinput.min.js"></script>
		
		<!--[if IE 8]>
			
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
			
		<![endif]-->

		<!-- MAIN APP JS FILE -->
		<script src="/Design/js/app.min.js"></script>--%>

 
 
		<uc1:LoadMoroorgaranControls LoadValidationScripts="true"   LoadValidationStyle="true" ID="load" runat="server" ></uc1:LoadMoroorgaranControls>
	</body>

<!-- Mirrored from 192.241.236.31/themes/preview/smartadmin/1.8.x/ajax/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Jul 2017 06:57:57 GMT -->
</html>
 