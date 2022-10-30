<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="fixed dark">
	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<title>Staff Page</title>
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
                <link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/bootstrap/css/bootstrap.css"/>" />
                <link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/animate/animate.compat.css"/>">
                <link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/font-awesome/css/all.min.css"/>" />
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/boxicons/css/boxicons.min.css"/>" />
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/magnific-popup/magnific-popup.css"/>" />
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css"/>" />
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/jquery-ui/jquery-ui.css"/>" />
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/jquery-ui/jquery-ui.theme.css"/>" />
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/bootstrap-multiselect/css/bootstrap-multiselect.css"/>" />
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/simple-line-icons/css/simple-line-icons.css"/>" />
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/vendor/morris/morris.css"/>"/>
                
		<!-- Theme CSS -->
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/css/theme.css"/>" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/css/skins/default.css"/>" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="<c:url value="/resources/StaffAssets/css/custom.css"/>">

		<!-- Head Libs -->
		<script src="<c:url value="/resources/StaffAssets/vendor/modernizr/modernizr.js"/>"></script>
                
                <!-- custom -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.0/dist/sweetalert2.all.min.js"></script>
	</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<header class="header">
				<div class="logo-container">
					<a href="../4.0.0" class="logo">
                                            <img src="<c:url value="/resources/StaffAssets/img/logo.png"/>" width="75" height="35" alt="Porto Admin" />
					</a>

					<div class="d-md-none toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
						<i class="fas fa-bars" aria-label="Toggle sidebar"></i>
					</div>

				</div>
				<div class="header-right">
					<div id="userbox" class="userbox">

						<figure class="profile-picture">
                                                    <img src="<c:url value="/resources/StaffAssets/img/!logged-user.jpg"/>" alt="Joseph Doe" class="rounded-circle" data-lock-picture="<c:url value="/resources/StaffAssets/img/!logged-user.jpg"/>" />
						</figure>
						<div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@okler.com">
							<span class="name USERNAME"></span>
							
						</div>
					</div>
				</div>
				<!-- end: search & user box -->
			</header>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<aside id="sidebar-left" class="sidebar-left">

				    <div class="sidebar-header">
				        <div class="sidebar-title">
				            Navigation
				        </div>
				        <div class="sidebar-toggle d-none d-md-block" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
				            <i class="fas fa-bars" aria-label="Toggle sidebar"></i>
				        </div>
				    </div>

				    <div class="nano">
				        <div class="nano-content">
				            <nav id="menu" class="nav-main" role="navigation">

				                <ul class="nav nav-main">
				                    <li>
				                        <a class="nav-link" href="staffMain.jsp">
				                            <i class="bx bx-home-alt" aria-hidden="true"></i>
				                            <span>Dashboard</span>
				                        </a>                        
				                    </li>
				                    <li class="nav-parent">
				                        <a class="nav-link" href="#">
				                            <i class="bx bx-detail" aria-hidden="true"></i>
				                            <span>Form Feedback</span>
				                        </a>
				                        <ul class="nav nav-children">
				                            <li>
				                                <a class="nav-link" href="staffAddFeedBack.jsp">
				                                    Add FeedBack Form
				                                </a>
				                            </li>
				                            <li>
				                                <a class="nav-link" href="staffViewFeedBack.jsp">
				                                    View Feedback Form
				                                </a>
				                            </li>
				                        </ul>
				                    </li>
				                </ul>
				            </nav>
				            <hr class="separator" />
				            <div class="sidebar-widget widget-tasks">
				                <div class="widget-content">
				                    <ul class="list-unstyled m-0">
				                        <li><a href="Logout.jsp">Logout</a></li>
				                    </ul>
				                </div>
				            </div>				        

				    </div>

				</aside>
				<!-- end: sidebar -->