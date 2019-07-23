<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>jsTree</title>
	<meta name="viewport" content="width=device-width" />

	<meta name="robots" content="index,follow" />
	<link rel="stylesheet" href="//static.jstree.com/3.3.7/assets/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="//static.jstree.com/3.3.7/assets/dist/themes/default/style.min.css" />
	<link rel="stylesheet" href="//static.jstree.com/3.3.7/assets/docs.css" />

	<link rel="icon" href="//static.jstree.com/3.3.7/assets/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon-precomposed" href="//static.jstree.com/3.3.7/assets/apple-touch-icon-precomposed.png" />
	<script>window.$q=[];window.$=window.jQuery=function(a){window.$q.push(a);};</script>
<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="/feed.xml" /><script>WR = "/";</script><meta property="og:title" content="jstree" /><meta property="og:type" content="website" /><meta property="og:description" content="jsTree is jquery plugin, that provides interactive trees. It is absolutely free, open source and distributed under the MIT license. jsTree is easily extendable, themable and configurable, it supports HTML & JSON data sources and AJAX loading." /><meta property="og:url" content="//www.jstree.com/demo/" /><meta property="og:image" content="//www.jstree.com/jstree.png" /><link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="Search jstree API"></head>
<body>
	<header id="head">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-12">
					<h1 id="logo"><a href="//jstree.com">jsTree - jQuery tree plugin<span>3.3.7</span></a></h1>
				</div>
				<div class="col-md-6 col-sm-8">
					<nav>
						<ul class="nav nav-pills" id="menu"><li><a href="/"><i class="glyphicon glyphicon-home"></i> Home</a></li><li class="active"><a href="/demo"><i class="glyphicon glyphicon-flash"></i> Demo</a></li><li><a href="/api"><i class="glyphicon glyphicon-cog"></i> API</a></li><li><a href="/plugins"><i class="glyphicon glyphicon-link"></i> Plugins</a></li></ul>
					</nav>
				</div>
				<div class="col-md-3 col-sm-4">
					<form role="search">
						<input type="text" id="srch" class="form-control" placeholder="API search" />
					</form>
				</div>
			</div>
		</div>
	</header>
	<div class="container" id="content">
		<div class="row page" id="demo" style="display:block;">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4 col-sm-8 col-xs-8">
						<button type="button" class="btn btn-success btn-sm" onclick="demo_create();"><i class="glyphicon glyphicon-asterisk"></i> Create</button>
						<button type="button" class="btn btn-warning btn-sm" onclick="demo_rename();"><i class="glyphicon glyphicon-pencil"></i> Rename</button>
						<button type="button" class="btn btn-danger btn-sm" onclick="demo_delete();"><i class="glyphicon glyphicon-remove"></i> Delete</button>
						<div id="event_result"></div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-4" style="text-align:right;">
						<input type="text" value="" style="box-shadow:inset 0 0 4px #eee; width:120px; margin:0; padding:6px 12px; border-radius:4px; border:1px solid silver; font-size:1.1em;" id="demo_q" placeholder="Search" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div id="jstree_demo" class="demo" style="margin-top:1em; min-height:200px;"></div>
						<script>
						function demo_create() {
							var ref = $('#jstree_demo').jstree(true),
								sel = ref.get_selected();
							if(!sel.length) { return false; }
							sel = sel[0];
							sel = ref.create_node(sel, {"type":"file"});
							if(sel) {
								ref.edit(sel);
							}
						};
						function demo_rename() {
							var ref = $('#jstree_demo').jstree(true),
								sel = ref.get_selected();
							if(!sel.length) { return false; }
							sel = sel[0];
							ref.edit(sel);
						};
						function demo_delete() {
							var ref = $('#jstree_demo').jstree(true),
								sel = ref.get_selected();
							if(!sel.length) { return false; }
							ref.delete_node(sel);
						};
						$(function () {
							var to = false;
							$('#demo_q').keyup(function () {
								if(to) { clearTimeout(to); }
								to = setTimeout(function () {
									var v = $('#demo_q').val();
									$('#jstree_demo').jstree(true).search(v);
								}, 250);
							});

							$('#jstree_demo').on('changed.jstree', function (e, data) {
    								var i, j, r = [];
    								for(i = 0, j = data.selected.length; i < j; i++) {
      									r.push(data.instance.get_node(data.selected[i]).text);
    								}
    								$('#event_result').html('Selected: ' + r.join(', '));
  								}).jstree({
									"core" : {
										"animation" : 0,
										"check_callback" : true,
										'force_text' : true,
										"themes" : { "stripes" : true },
										'data' : {
											'url' : function (node) {
												return node.id === '#' ? './assets/ajax_demo_roots.do' : './assets/ajax_demo_children.do'+'?id='+node.id;
											},
											'data' : function (node) {
												return { 'id' : node.id };
											}
										}
									},
									"types" : {
										"#" : { "max_children" : 1, "max_depth" : 4, "valid_children" : ["root"] },
										"root" : { "icon" : "./static/tree_icon.png", "valid_children" : ["default"] },
										"default" : { "valid_children" : ["default","file"] },
										"file" : { "icon" : "glyphicon glyphicon-file", "valid_children" : [] }
									},
									"plugins" : [ "contextmenu", "dnd", "search", "state", "types", "wholerow" ]
								});
						});
						</script>
					</div>
					<div class="col-md-12">
						<p style="text-align:center; padding-top:1em;">
							<button class="btn btn-info" onclick="$(this).blur().parent().next().slideToggle(); return false;">show the complete code</button>
						</p>
					</div>
				</div>
				<div class="row" style="margin-top:2em;">
					<div class="col-md-12">
						<div class="alert alert-block alert-info" style="text-align:center;">You can see the code of the following demos in the <code>demo</code> folder of the download</div>
					</div>
				</div>
			</div>
		<p style="text-align:center; margin-top:2em;"><a href="//old.jstree.com">click here for the old site (v.1)</a></p><div style="margin-top:4em; text-align:center; border-bottom:40px solid white;" class="hidden-sm hidden-xs"><script type="text/javascript">google_ad_client = "pub-3390774673776502";/* 728x90, created 9/28/09 */google_ad_slot = "0034777413";google_ad_width = 728;google_ad_height = 90;</script><script type="text/javascript" src="//pagead2.googlesyndication.com/pagead/show_ads.js"></script></div></div>
	</div>
	<script src="./static/dist/jstree.js"></script>
	<script src="./static/site.js"></script>
	<script>$.each($q,function(i,f){$(f)});$q=null;</script>
</body>
</html>
