<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Chaos Dashboard</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" />
		
	<style>
	body {
	  padding-top: 60px;
	  padding-bottom: 40px;
	}
	</style>
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
  <link rel="stylesheet" href="css/animate.css">
  <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
  <!--[if lt IE9 ]  <link rel="stylesheet" href="font-awesome/css/font-awesome-ie7.css"><![endif]-->
  <link rel="stylesheet" href="fancybox/jquery.fancybox.css?v=2.0.6" type="text/css" media="screen" />
  <link rel="stylesheet" href="css/style.css">
  
	<!--[if lt IE 9]>
	<script src="js/html5-3.4-respond-1.1.0.min.js"></script>
	<![endif]-->
  
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:javascript library="jquery" plugin="jquery"/>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		
		<body data-spy="scroll" data-target="#primary-nav">
  <div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">Menu</a>
        <a class="brand" href="#"> Pandemonium Paddy </a>
        <div id="primary-nav" class="nav-collapse">
          <ul class="nav">
            <li class="active"><a class="anchorLink" href="#home">Home</a></li>
            <li><a class="anchorLink" href="#createJob">Create a Job</a></li>
            <li><a class="anchorLink" id="editFormLink" href="#editJob">Update Job info</a></li>
            <li><a class="anchorLink" href="#createJob">Run the Job</a></li>
            <li><a class="anchorLink" href="#serverStatus">Cloud Status</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div><!--/container-->
    </div><!--/navbar-inner-->
  </div><!--/navbar-->
    
  <header id="home">
    <div class="container">
      <div class="row">
        <div class="span12 headline">
          <h1>Build architectures that survive failures</h1>
          <i class="description">Test your cloud app here</i>
        </div><!--/span12-->
      </div><!--/row-->
      <div class="row animated fadeInUp">
        <div class="span12">
          <div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">
              <!--slide-->
              <div class="active item">
                <div class="row">
                  <div class="span6">
                    <img src="images/cloud1.png" alt=""/>
                  </div>
                  <div class="span4">
                    <h2>Don't fail</h2>
                    <p>In modern online sites, revenue is generated 24/7 and thus availability of these sites much meet this core business requirement.  Currently leveraging most IAAS providers there is no automatic or even real way to test / verify the resilience of your architecture within a build/development pipeline.
                    This tool looks to fill a serious under tested and underappreciated  concept of failures in non-production environments (that are usually very stable under small load).    
</p>
                    
                    <a class="btn btn-red" href="#createJob">Awesome let me try!</a>
                  </div>
                </div>
              </div>
              <!--slide-->
              <div class="item">
                <div class="row">
                  <div class="span6 animated rotateInDownLeft">
                    <img src="assets/slide-half-2.png" alt=""/>
                  </div>
                  <div class="span4 animated rotateInUpRight">
                    <h2>Simulate actual failures</h2>
                    <p>This tool will simulate failures to provide an accurate view of resilience of your architecture.   Utilising JClouds functionality this tools sits on top offering chaos capabilities to CloudStack, OpenStack, EC2, VMWare ESX and even VirtualBox.  
As this tool exposes rest services, server failure testing can now be automatically brought into nightly Jenkins tests.  This tool moves failures from reactive production head scratching to proactive pre-production solutions to ensure the highest SLA’s.</p>
                    <a class="btn btn-red" href="#createJob">Want to start now?</a>
                  </div>
                   <div class="span6">
                    <img src="images/computercrash.png" alt="" class="simulateImg"/>
                  </div>
                </div>
              </div>
              </div><!--/carousel-inner-->
            <!-- Carousel nav -->
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
          </div><!--/myCarousel-->
        </div><!--/span12-->
      </div><!--/row-->
    </div><!--/container-->
  </header>
  
  <div class="container"><!--main content-->
    <div class="strip">
      <div class="row">
        <div class="span12">
          <span class="call-to-action">Test the availability of your architecture</span>
        </div>
      </div>
    </div>
    
    <g:layoutBody/>
    
  
  
  </div><!--/main content-->
      
  <footer>
    <div class="container">
      <div class="row">
        <div class="span2">
					<h3>Developers</h3>
					<ul>
						<li><a href="#" title=""><i class="icon-external-link"></i> Conor Hawkshaw</a></li>
						<li><a href="#" title=""><i class="icon-external-link"></i> Niall O'Reilly</a></li>
						<li><a href="#" title=""><i class="icon-external-link"></i> Noel King</a></li>
					</ul>
				</div>
      </div><!--/row-->
    </div> <!-- /container -->
    <div class="base">
      <div class="container">
        <p>All Rights Reserved.</p>
      </div>
    </div>
  </footer>
  
  <g:javascript library="application"/>
  <g:javascript library="chaos"/>
  <r:layoutResources />
    
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/jquery-1.7.2.min.js"><\/script>')</script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.anchor.js" type="text/javascript"></script>
  <script type="text/javascript" src="js/jquery.gritter.js"></script>
  
  <script type="text/javascript" src="fancybox/jquery.fancybox.pack.js?v=2.0.6"></script>
  <script src="js/script.js"></script>
		
	</body>
</html>
