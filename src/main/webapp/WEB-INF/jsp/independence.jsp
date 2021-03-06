<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.jssora05l, .jssora05r {
	display: block;
	position: absolute;
	width: 40px;
	height: 40px;
	cursor: pointer;
	background: url(img/a17.png) no-repeat;
	overflow: hidden
}

.jssora05l {
	background-position: -10px -40px
}

.jssora05r {
	background-position: -70px -40px
}

.jssora05l:hover {
	background-position: -130px -40px
}

.jssora05r:hover {
	background-position: -190px -40px
}

.jssora05l.jssora05ldn {
	background-position: -250px -40px
}

.jssora05r.jssora05rdn {
	background-position: -310px -40px
}

.jssort01 {
	position: absolute;
	width: 960px;
	height: 100px
}

.jssort01 .p {
	position: absolute;
	top: 0;
	left: 0;
	width: 72px;
	height: 72px
}

.jssort01 .t {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border: none
}

.jssort01 .w {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

.jssort01 .c {
	position: absolute;
	top: 0;
	left: 0;
	width: 68px;
	height: 68px;
	border: #000 2px solid;
	box-sizing: content-box;
	background: url(img/t01.png) -960px -960px no-repeat;
	_background: none
}

.jssort01 .pav .c {
	top: 2px;
	_top: 0;
	left: 2px;
	_left: 0;
	width: 68px;
	height: 68px;
	border: #000 0 solid;
	_border: #fff 2px solid;
	background-position: 50% 50%
}

.jssort01 .p:hover .c {
	top: 0;
	left: 0;
	width: 70px;
	height: 70px;
	border: #fff 1px solid;
	background-position: 50% 50%
}

.jssort01 .p.pdn .c {
	background-position: 50% 50%;
	width: 68px;
	height: 68px;
	border: #000 2px solid
}

* html .jssort01 .c, * html .jssort01 .pdn .c, * html .jssort01 .pav .c
	{
	width: 72px;
	height: 72px
}
</style>
<script>
	jQuery(document)
			.ready(
					function($) {

						var _SlideshowTransitions = [

						{
							$Duration : 1200,
							x : 0.3,
							$During : {
								$Left : [ 0.3, 0.7 ]
							},
							$Easing : {
								$Left : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							x : -0.3,
							$SlideOut : true,
							$Easing : {
								$Left : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							x : -0.3,
							$During : {
								$Left : [ 0.3, 0.7 ]
							},
							$Easing : {
								$Left : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							x : 0.3,
							$SlideOut : true,
							$Easing : {
								$Left : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							y : 0.3,
							$During : {
								$Top : [ 0.3, 0.7 ]
							},
							$Easing : {
								$Top : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2,
							$Outside : true
						}

						, {
							$Duration : 1200,
							y : -0.3,
							$SlideOut : true,
							$Easing : {
								$Top : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2,
							$Outside : true
						}

						, {
							$Duration : 1200,
							y : -0.3,
							$During : {
								$Top : [ 0.3, 0.7 ]
							},
							$Easing : {
								$Top : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							y : 0.3,
							$SlideOut : true,
							$Easing : {
								$Top : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							x : 0.3,
							$Cols : 2,
							$During : {
								$Left : [ 0.3, 0.7 ]
							},
							$ChessMode : {
								$Column : 3
							},
							$Easing : {
								$Left : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2,
							$Outside : true
						}

						, {
							$Duration : 1200,
							x : 0.3,
							$Cols : 2,
							$SlideOut : true,
							$ChessMode : {
								$Column : 3
							},
							$Easing : {
								$Left : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2,
							$Outside : true
						}

						, {
							$Duration : 1200,
							y : 0.3,
							$Rows : 2,
							$During : {
								$Top : [ 0.3, 0.7 ]
							},
							$ChessMode : {
								$Row : 12
							},
							$Easing : {
								$Top : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							y : 0.3,
							$Rows : 2,
							$SlideOut : true,
							$ChessMode : {
								$Row : 12
							},
							$Easing : {
								$Top : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							y : 0.3,
							$Cols : 2,
							$During : {
								$Top : [ 0.3, 0.7 ]
							},
							$ChessMode : {
								$Column : 12
							},
							$Easing : {
								$Top : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2,
							$Outside : true
						}

						, {
							$Duration : 1200,
							y : -0.3,
							$Cols : 2,
							$SlideOut : true,
							$ChessMode : {
								$Column : 12
							},
							$Easing : {
								$Top : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							x : 0.3,
							$Rows : 2,
							$During : {
								$Left : [ 0.3, 0.7 ]
							},
							$ChessMode : {
								$Row : 3
							},
							$Easing : {
								$Left : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2,
							$Outside : true
						}

						, {
							$Duration : 1200,
							x : -0.3,
							$Rows : 2,
							$SlideOut : true,
							$ChessMode : {
								$Row : 3
							},
							$Easing : {
								$Left : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							x : 0.3,
							y : 0.3,
							$Cols : 2,
							$Rows : 2,
							$During : {
								$Left : [ 0.3, 0.7 ],
								$Top : [ 0.3, 0.7 ]
							},
							$ChessMode : {
								$Column : 3,
								$Row : 12
							},
							$Easing : {
								$Left : $JssorEasing$.$EaseInCubic,
								$Top : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2,
							$Outside : true
						}

						, {
							$Duration : 1200,
							x : 0.3,
							y : 0.3,
							$Cols : 2,
							$Rows : 2,
							$During : {
								$Left : [ 0.3, 0.7 ],
								$Top : [ 0.3, 0.7 ]
							},
							$SlideOut : true,
							$ChessMode : {
								$Column : 3,
								$Row : 12
							},
							$Easing : {
								$Left : $JssorEasing$.$EaseInCubic,
								$Top : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2,
							$Outside : true
						}

						, {
							$Duration : 1200,
							$Delay : 20,
							$Clip : 3,
							$Assembly : 260,
							$Easing : {
								$Clip : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							$Delay : 20,
							$Clip : 3,
							$SlideOut : true,
							$Assembly : 260,
							$Easing : {
								$Clip : $JssorEasing$.$EaseOutCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							$Delay : 20,
							$Clip : 12,
							$Assembly : 260,
							$Easing : {
								$Clip : $JssorEasing$.$EaseInCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}

						, {
							$Duration : 1200,
							$Delay : 20,
							$Clip : 12,
							$SlideOut : true,
							$Assembly : 260,
							$Easing : {
								$Clip : $JssorEasing$.$EaseOutCubic,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						} ];

						var options = {
							$AutoPlay : true,
							$AutoPlayInterval : 4000,
							$PauseOnHover : 1,
							$DragOrientation : 3,
							$ArrowKeyNavigation : true,
							$SlideDuration : 800,

							$SlideshowOptions : {
								$Class : $JssorSlideshowRunner$,
								$Transitions : _SlideshowTransitions,
								$TransitionsOrder : 1,
								$ShowLink : true
							},
							$ArrowNavigatorOptions : {
								$Class : $JssorArrowNavigator$,
								$ChanceToShow : 1
							},
							$ThumbnailNavigatorOptions : {
								$Class : $JssorThumbnailNavigator$,
								$ChanceToShow : 2,

								$ActionMode : 1,
								$SpacingX : 8,
								$DisplayPieces : 10,
								$ParkingPosition : 360
							}
						};

						var jssor_slider1 = new $JssorSlider$(
								"slider1_container", options);

						function ScaleSlider() {
							var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
							if (parentWidth)
								jssor_slider1.$ScaleWidth(Math.max(Math.min(
										parentWidth, 960), 300));
							else
								window.setTimeout(ScaleSlider, 30);
						}
						ScaleSlider();

						$(window).bind("load", ScaleSlider);
						$(window).bind("resize", ScaleSlider);
						$(window).bind("orientationchange", ScaleSlider);

					});
</script>

<div id="about" class="container">

	<h1 class="sectionhead">Independence Day</h1>
	<p></p>
	<p>
	<p>
	<div id="slider1_container"
		style="position: relative; top: 0px; left: 0px; width: 960px; height: 600px; background: #191919; overflow: hidden; margin-left: auto; margin-right: auto; margin-bottom: 10px;">
		<div u="loading" style="position: absolute; top: 0px; left: 0px;">
			<div
				style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; background-color: #000000; top: 0px; left: 0px; width: 100%; height: 100%;">
			</div>
			<div
				style="position: absolute; display: block; background: url(img/loading.gif) no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;">
			</div>
		</div>
		<div u="slides"
			style="cursor: move; position: absolute; left: 0px; top: 0px; width: 960px; height: 500px; overflow: hidden;">
			<div>
				<img u="image" src="<c:url value='/dist/img/Independence/1.JPG'/>"
					alt="Independence Day"> <img u="thumb"
					src="<c:url value='/dist/img/Independence/1.JPG'/>">
			</div>
			<div>
				<img u="image" src="<c:url value='/dist/img/Independence/2.JPG'/>">
				<img u="thumb" src="<c:url value='/dist/img/Independence/2.JPG'/>">
			</div>
			<div>
				<img u="image" src="<c:url value='/dist/img/Independence/3.JPG'/>">
				<img u="thumb" src="<c:url value='/dist/img/Independence/3.JPG'/>">
			</div>
			<div>
				<img u="image" src="<c:url value='/dist/img/Independence/4.JPG'/>">
				<img u="thumb" src="<c:url value='/dist/img/Independence/4.JPG'/>">
			</div>
			<div>
				<img u="image" src="<c:url value='/dist/img/Independence/5.JPG'/>">
				<img u="thumb" src="<c:url value='/dist/img/Independence/5.JPG'/>">
			</div>
			<div>
				<img u="image" src="<c:url value='/dist/img/Independence/6.JPG'/>">
				<img u="thumb" src="<c:url value='/dist/img/Independence/6.JPG'/>">
			</div>
			<div>
				<img u="image" src="<c:url value='/dist/img/Independence/7.JPG'/>">
				<img u="thumb" src="<c:url value='/dist/img/Independence/7.JPG'/>">
			</div>
			<div>
				<img u="image" src="<c:url value='/dist/img/Independence/8.JPG'/>">
				<img u="thumb" src="<c:url value='/dist/img/Independence/8.JPG'/>">
			</div>
			<div>
				<img u="image" src="<c:url value='/dist/img/Independence/9.JPG'/>">
				<img u="thumb" src="<c:url value='/dist/img/Independence/9.JPG'/>">
			</div>
			<div>
				<img u="image" src="<c:url value='/dist/img/Independence/10.JPG'/>">
				<img u="thumb" src="<c:url value='/dist/img/Independence/10.JPG'/>">
			</div>
		</div>
		<span u="arrowleft" class="jssora05l" style="top: 250px; left: 8px;">
		</span> <span u="arrowright" class="jssora05r" style="top: 250px; right: 8px">
		</span>
		<div u="thumbnavigator" class="jssort01"
			style="left: 0px; bottom: 0px; width: 960px;">
			<div u="slides" style="cursor: default; width: 960px;">
				<div u="prototype" class="p">
					<div class="w">
						<div u="thumbnailtemplate" class="t"></div>
					</div>
					<div class="c"></div>
				</div>
			</div>
		</div>
	</div>
</div>

