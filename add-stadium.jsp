
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<base href="${pageContext.request.contextPath}/Admin/">
    <meta charset="utf-8">
    <title>Add Stadium</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="description" content="Avenxo Admin Theme">
    <meta name="author" content="KaijuThemes">

    <link type='text/css' href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,600' rel='stylesheet'>

    <link type="text/css" href="css/font-awesome.min.css" rel="stylesheet">        <!-- Font Awesome -->
    <link type="text/css" href="css/themify-icons.css" rel="stylesheet">              <!-- Themify Icons -->
    <link type="text/css" href="css/styles.css" rel="stylesheet">                                     <!-- Core CSS with all styles -->

    <link type="text/css" href="css/prettify.css" rel="stylesheet">                <!-- Code Prettifier -->
    <link type="text/css" href="css/blue.css" rel="stylesheet">              <!-- iCheck -->

    <!--[if lt IE 10]>
        <script type="text/javascript" src="js/media.match.min.js"></script>
        <script type="text/javascript" src="js/respond.min.js"></script>
        <script type="text/javascript" src="js/placeholder.min.js"></script>
    <![endif]-->
    <!-- The following CSS are included as plugins and can be removed if unused-->
    <script>

	function loadCity() {
	
		var stateId = document.getElementById("stateId");
		
		var xmlhttp = new XMLHttpRequest();
		removeAllState();

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				var jsonObj = JSON.parse(xmlhttp.responseText);
				

				for (i = 0; i < jsonObj.length; i++) {

					var createOption = document.createElement("option");
					alert(JSON.stringify(jsonObj));
/* stateId,stateName- means name given in json file */
					createOption.value = jsonObj[i].cityId;
					createOption.text = jsonObj[i].cityName;

					document.stadiumForm.cityId.options.add(createOption);
				}
			}
		}
		/* step-5 -if get then write method in doget ,and if post then write in dopost flag=loadState,this flag will bw passed in controller's doget &countryId,means this is the name given by us,we  can give a ,b,c any name.this name will be passed in controller's parseint*/

		xmlhttp.open("get","${pageContext.request.contextPath}/stadiumCo?flag=loadCity&stateId="+stateId.value, true);
		
		xmlhttp.send();

		/* Holds the status of the XMLHttpRequest. Changes from 0 to 4:
			0: request not initialized
			1: server connection established
			2: request received
			3: processing request
			4: request finished and response is ready */
	}

	function removeAllState() {
		var removeState = document.stadiumForm.cityId.options.length;
		for (i = removeState; i > 0; i--) {
			document.stadiumForm.cityId.remove(i);
		}
	}
</script>

    </head>

    <body class="animated-content">
        
        <jsp:include page="Header.jsp"></jsp:include>

        <div id="wrapper">
            <div id="layout-static">
                <jsp:include page="Menu.jsp"></jsp:include>
                <div class="static-content-wrapper">
                    <div class="static-content">
                        <div class="page-content">
                            <ol class="breadcrumb">
                                
<li><a href="Index.jsp">Home</a></li>
<li class="active"><a href="add-stadium.jsp">Add Stadium</a></li>

                            </ol>
                            <div class="container-fluid">
                                
<div data-widget-group="group1">
	<div class="row">
		<div class="col-sm-12">
			
			<div class="panel panel-midnightblue" data-widget='{"draggable": "false"}'>
				<div class="panel-heading">
					<h2>Add Stadium</h2>
					<!-- <div class="panel-ctrls" data-actions-container="" data-action-collapse='{"target": ".panel-body, .panel-footer"}'></div> -->
				
				</div>
				<div class="panel-body">
					<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
							<form name="stadiumForm" class="form-horizontal" action="<%=request.getContextPath()%>/stadiumCo" method="post">
							<div class="form-group mb-n">
									<label for="largeinput" class="col-sm-2 control-label label-input-lg">Stadium Name</label>
									<div class="col-sm-8">
										<input type="text" name="stadium" class="form-control input-lg" id="largeinput" placeholder="Enter Stadium Name" required>
									</div>
								 </div> <br/>
							<div class="form-group mb-n">
								    <label for="largeinput" class="col-sm-2 control-label label-input-lg">Select State</label>
									<div class="col-sm-8">
										<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
									<select name="stateId" id="stateId" class="form-control" onchange="loadCity()">
									<option>Select State</option>
										<c:forEach items="${sessionScope.loadstate}" var="l">
										<option value="${l.id}">${l.state}</option>
										</c:forEach>
									</select>
									</div>
											
								</div> <br>
								<div class="form-group mb-n">
								    <label for="largeinput" class="col-sm-2 control-label label-input-lg">Select City</label>
									<div class="col-sm-8">
									<select name="cityId" id="cityId" class="form-control">
									
										<option >select city</option>
										
									</select>
									</div>
								</div> <br>					  
								<div class="form-group mb-n">
									<label for="largeinput" class="col-sm-2 control-label label-input-lg">Capacity</label>
									<div class="col-sm-8">
										<input type="text" name="capacity" class="form-control input-lg" id="largeinput" placeholder="Enter Capacity Of People" required>
									</div>
								 </div> <br>
								 <div class="form-group mb-n">
									<label for="largeinput" class="col-sm-2 control-label label-input-lg">Parking Capacity</label>
									<div class="col-sm-8">
										<input type="text" name="p_capacity" class="form-control input-lg" id="largeinput" placeholder="Enter Capacity Of Parking" required>
									</div>
								 </div> 
								<br/>
								
					<div class="row">
						<div class="col-sm-8 col-sm-offset-2">
							<button class="btn-primary btn" name="flag" value="insertstadium">Add Stadium</button>
							<button class="btn-default btn">Cancel</button>
						</div>
					</div>
				
							</form>
						</div>
						
						
						
					</div>
				</div>
				
			</div>
		</div>
	</div>


                </div>
            </div>
        </div>

    
    <!-- Switcher -->
    <div class="demo-options">
        <div class="demo-options-icon"><i class="ti ti-paint-bucket"></i></div>
        <div class="demo-heading">Demo Settings</div>

        <div class="demo-body">
            <div class="tabular">
                <div class="tabular-row">
                    <div class="tabular-cell">Fixed Header</div>
                    <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" checked data-size="mini" data-on-color="success" data-off-color="default" name="demo-fixedheader" data-on-text="&nbsp;" data-off-text="&nbsp;"></div>
                </div>
                <div class="tabular-row">
                    <div class="tabular-cell">Boxed Layout</div>
                    <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" data-size="mini" data-on-color="success" data-off-color="default" name="demo-boxedlayout" data-on-text="&nbsp;" data-off-text="&nbsp;"></div>
                </div>
                <div class="tabular-row">
                    <div class="tabular-cell">Collapse Leftbar</div>
                    <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" data-size="mini" data-on-color="success" data-off-color="default" name="demo-collapseleftbar" data-on-text="&nbsp;" data-off-text="&nbsp;"></div>
                </div>
            </div>
        </div>

        <div class="demo-body">
            <div class="option-title">Topnav</div>
            <ul id="demo-header-color" class="demo-color-list">
                <li><span class="demo-cyan"></span></li>
                <li><span class="demo-light-blue"></span></li>
                <li><span class="demo-blue"></span></li>
                <li><span class="demo-indigo"></span></li>
                <li><span class="demo-deep-purple"></span></li> 
                <li><span class="demo-purple"></span></li> 
                <li><span class="demo-pink"></span></li> 
                <li><span class="demo-red"></span></li>
                <li><span class="demo-teal"></span></li>
                <li><span class="demo-green"></span></li>
                <li><span class="demo-light-green"></span></li>
                <li><span class="demo-lime"></span></li>
                <li><span class="demo-yellow"></span></li>
                <li><span class="demo-amber"></span></li>
                <li><span class="demo-orange"></span></li>               
                <li><span class="demo-deep-orange"></span></li>
                <li><span class="demo-midnightblue"></span></li>
                <li><span class="demo-bluegray"></span></li>
                <li><span class="demo-bluegraylight"></span></li>
                <li><span class="demo-black"></span></li> 
                <li><span class="demo-gray"></span></li> 
                <li><span class="demo-graylight"></span></li> 
                <li><span class="demo-default"></span></li>
                <li><span class="demo-brown"></span></li>
            </ul>
        </div>

        <div class="demo-body">
            <div class="option-title">Sidebar</div>
            <ul id="demo-sidebar-color" class="demo-color-list">
                <li><span class="demo-cyan"></span></li>
                <li><span class="demo-light-blue"></span></li>
                <li><span class="demo-blue"></span></li>
                <li><span class="demo-indigo"></span></li>
                <li><span class="demo-deep-purple"></span></li> 
                <li><span class="demo-purple"></span></li> 
                <li><span class="demo-pink"></span></li> 
                <li><span class="demo-red"></span></li>
                <li><span class="demo-teal"></span></li>
                <li><span class="demo-green"></span></li>
                <li><span class="demo-light-green"></span></li>
                <li><span class="demo-lime"></span></li>
                <li><span class="demo-yellow"></span></li>
                <li><span class="demo-amber"></span></li>
                <li><span class="demo-orange"></span></li>               
                <li><span class="demo-deep-orange"></span></li>
                <li><span class="demo-midnightblue"></span></li>
                <li><span class="demo-bluegray"></span></li>
                <li><span class="demo-bluegraylight"></span></li>
                <li><span class="demo-black"></span></li> 
                <li><span class="demo-gray"></span></li> 
                <li><span class="demo-graylight"></span></li> 
                <li><span class="demo-default"></span></li>
                <li><span class="demo-brown"></span></li>
            </ul>
        </div>



    </div>
<!-- /Switcher -->
    <!-- Load site level scripts -->

<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script> -->

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> 							<!-- Load jQuery -->
<script type="text/javascript" src="js/jqueryui-1.10.3.min.js"></script> 							<!-- Load jQueryUI -->
<script type="text/javascript" src="js/bootstrap.min.js"></script> 								<!-- Load Bootstrap -->
<script type="text/javascript" src="js/enquire.min.js"></script> 									<!-- Load Enquire -->

<script type="text/javascript" src="js/velocity.min.js"></script>					<!-- Load Velocity for Animated Content -->
<script type="text/javascript" src="js/velocity.ui.min.js"></script>

<script type="text/javascript" src="js/wijets.js"></script>     						<!-- Wijet -->

<script type="text/javascript" src="js/prettify.js"></script> 				<!-- Code Prettifier  -->
<script type="text/javascript" src="js/bootstrap-switch.js"></script> 		<!-- Swith/Toggle Button -->

<script type="text/javascript" src="js/bootstrap-tabdrop.js"></script>  <!-- Bootstrap Tabdrop -->

<script type="text/javascript" src="js/icheck.min.js"></script>     					<!-- iCheck -->

<script type="text/javascript" src="js/jquery.nanoscroller.min.js"></script> <!-- nano scroller -->

<script type="text/javascript" src="js/application.js"></script>
<script type="text/javascript" src="js/demo.js"></script>
<script type="text/javascript" src="js/demo-switcher.js"></script>

<!-- End loading site level scripts -->
    
    <!-- Load page level scripts-->
    

    <!-- End loading page level scripts-->

    </body>
</html>