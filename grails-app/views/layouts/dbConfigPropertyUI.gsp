<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Config Property</title>
<link rel="stylesheet" href="${resource(dir: 'internal_resources', file: 'css_base.css')}" type="text/css" media="screen" />
<!--[if lte IE 7]>
<link href="${resource(dir: 'internal_resources', file: 'css_ie7.css')}" rel="stylesheet" type="text/css" media="screen" />
<![endif]-->
<link rel="stylesheet" type="text/css" href="${resource(dir: 'internal_resources', file: 'additional.css')}" media="screen">
<r:layoutResources />
<g:layoutHead />
</head>
<body class="uow">
<div id="wrap">
	<div id="content-box" class="clearfix container_24">
		<div id="content" class="clearfix grid_24">
			<div id="breadcrumb"><a href="${createLink(uri: '/')}">Home</a> &gt; <g:link class="list" action="list">List</g:link></div>
			<div id="column-main" class="grid_24 alpha omega">
				<g:layoutBody />
			</div>
		</div>
	</div>
</div>
</body>
</html>