<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Config Property</title>
<link rel="stylesheet" href="${resource(dir: 'internal_resources', file: 'css_uow_base.css')}" type="text/css" media="screen" />
<!--[if lte IE 7]>
<link href="${resource(dir: 'internal_resources', file: 'css_uow_ie7.css')}" rel="stylesheet" type="text/css" media="screen" />
<![endif]-->
<link rel="stylesheet" type="text/css" href="${resource(dir: 'internal_resources', file: 'additional.css')}" media="screen">
<r:layoutResources />
<g:layoutHead />
</head>
<body class="uow">
<div id="wrap">
	<div id="header" class="container_24 clearfix">
		<div id="uowlogo"><a href="http://www.uow.edu.au/index.html"><img alt="University of Wollongong" title="University of Wollongong" src="${resource(dir: 'internal_resources', file: 'img_logo_uow.png')}"></a></div>
	</div>
	<div id="content-box" class="clearfix container_24">
		<div id="content" class="clearfix grid_24">
			<div id="page-title">DB Config Property</div>
			<div class="submenu grid_24 alpha omega">
				<ul class="left">
					<li class="alpha pointer"><a href="#" class="menu">Admin</a>
						<ul>
							<li><g:link controller="configProperty" action="list">Manage Property</g:link></li>
							<li><g:link controller="configProperty" action="Create">Create Property</g:link></li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="breadcrumb"><a href="${createLink(uri: '/')}">Home</a> &gt; <g:link class="list" action="list">List</g:link></div>
			<div id="column-main" class="grid_24 alpha omega">
				<g:layoutBody />
			</div>
		</div>
	</div>
	<div id="footer" class="container_24 clearfix">
		<div class="copyright grid_24 footer"> </div>
	</div>
</div>
</body>
</html>
