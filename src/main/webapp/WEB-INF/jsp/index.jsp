<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>
	$(document).ready(function() {
		$(".queicon").mouseover(function() {
			$(".why").toggle();
		});
		$(".queicon").mouseout(function() {
			$(".why").toggle();
		});
		$(".queicon").click(function() {
			$(".why").toggle();
		});
		$("#boys").click(function() {
			var mapOptions = {
				zoom : 16,
				center : new google.maps.LatLng(23.029666, 72.553107),
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map($("#map").get(0), mapOptions);
			marker = new google.maps.Marker({
				map : map,
				animation : google.maps.Animation.DROP,
				position : {
					lat : 23.029666,
					lng : 72.553360
				},
				title : 'SP Boys Hostel'
			});
		});
		$("#girls").click(function() {
			var mapOptions = {
				zoom : 16,
				center : new google.maps.LatLng(23.051636, 72.543552),
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map($("#map").get(0), mapOptions);
			marker = new google.maps.Marker({
				map : map,
				animation : google.maps.Animation.DROP,
				position : {
					lat : 23.051636,
					lng : 72.543552
				},
				title : 'SP Girls Hostel'
			});
		});
	});
</script>
<div id="newsmain" class="container">
	<c:if test="${not empty error}">
		<div class="alert alert-danger text-center" role="alert">
			${error}</div>
	</c:if>
	<c:remove var="error" />

	<c:if test="${globalPara.admissionOn}">
		<div class="col-md-12">
			<marquee onmouseover="stop()" onmouseout="start()" scrollamount="10"
				scrolldelay="1" direction="left">

				<div id="admission">Admission is Open Now.</div>
			</marquee>
		</div>
		
	</c:if>
</div>
<hr>
<div id="about" class="container">
	<div class="col-md-6">
		<div class="row">
			<h2 class="wow fadeInDown" data-wow-duration="2s">Saurastra
				Patel Kelavani Mandal</h2>
			<h4 class="wow fadeInUp" data-wow-duration="3s">S.P.Hostels for
				saurastra patel students</h4>
			<p class="wow fadeInDown" data-wow-duration="3s">Shree Saurastra
				Patel Kelavani Mandal(SSPKM) is accomplishing wonderful task by
				providing opportunity to the students of Saurashtra through the
				medium of accommodation in huge city like Ahmedabad and encouraging
				them to pursue higher and better education. It aims at providing
				comfortable, hygienic accommodations with assured quality standards
				at affordable rates. All in all, the hostel life in SSPKM is one of
				the most enviable among the student community, providing students
				with conducive atmosphere for learning and personal development.</p>
			<a class="more-link wow bounce" href="<c:url value='aboutus'/>">Read
				More</a>
		</div>
		<div class="myapps row">
			<h5>Follow Us On</h5>
			<ul>
				<li><img class="wow animated bounceInUp" data-wow-duration="1s"
					src="<c:url value='/dist/img/icon/Facebook.png'/>" alt="FB"></li>
				<li><img class="wow bounceInUp" data-wow-duration="2s"
					src="<c:url value='/dist/img/icon/Instagram.png'/>" alt="Instagram"></li>
				<li><img class="wow bounceInUp" data-wow-duration="3s"
					src="<c:url value='/dist/img/icon/Twitter.png'/>" alt="Twitter"></li>
				<li><img class="wow animated bounceInUp" data-wow-duration="4s"
					src="<c:url value='/dist/img/icon/GooglePlus.png'/>"
					alt="GooglePlus"></li>
				<li><img class="wow bounceInUp" data-wow-duration="5s"
					src="<c:url value='/dist/img/icon/YouTube.png'/>" alt="Youtube"></li>
			</ul>
		</div>
	</div>
	<div class="col-md-6 wow fadeInUp myphoto" data-wow-duration="4s">
		<img src="<c:url value='/dist/img/new-building.jpg'/>" alt="SP">
	</div>
</div>
<hr>
<div id="services" class="container">
	<div class="sectionhead  row wow fadeInUp">
		<span class="bigicon icon-cup "></span>
		<h3>This is what I can do for you</h3>
		<hr class="separetor">
	</div>
	<div class="row">
		<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
			<a id="black" href="<c:url value='facilities'/>"> <img
				src="<c:url value='/dist/img/s1.png'/>" alt="">
				<h4 class="serviceh4">Hosteling Facilities</h4>
				<p>We provides excellent Hostelling Facilies for the students in
					the centered area of ahmedabad</p>
			</a>
		</div>
		<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
			<a id="black" href="<c:url value='facilities'/>"> <img
				src="<c:url value='/dist/img/s2.png'/>" alt="">
				<h4 class="serviceh4">Healthy Food Services</h4>
				<p>Healthy and nourishing food is also provided in the dining
					halls.</p>
			</a>
		</div>
		<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
			<a id="black" href="<c:url value='facilities'/>"> <img
				src="<c:url value='/dist/img/s3.png'/>" alt="">
				<h4 class="serviceh4">Library</h4>

				<p>In both hostel campus 24*7 available reading room with some
					good non-academic books.</p>
			</a>
		</div>
		<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
			<img src="<c:url value='/dist/img/s4.png'/>" alt="">
			<h4 class="serviceh4">Scholarships</h4>
			<p>Trust and subsidiaries are giving scholarship to the scholar
				students.
		</div>
		<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
			<a id="black" href="<c:url value='facilities'/>"> <img
				src="<c:url value='/dist/img/s5.png'/>" alt="" />
				<h4 class="serviceh4">Gym</h4>
				<p>Boys hostel have gym which has most of the gyming equipments.
				</p>
			</a>
		</div>
		<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-duration="3s">
			<a id="black" href="<c:url value='facilities'/>"> <img
				src="<c:url value='/dist/img/s6.png'/>" alt="">
				<h4 class="serviceh4">Tuitions</h4>
				<p>School students are given tuitions and consultancy for
					competitive exams is provided.</p>
			</a>
		</div>
	</div>
</div>
<div id="portfolio">
	<div class="sectionhead wow bounceInUp" data-wow-duration="2s">
		<span class="bigicon icon-rocket"></span>
		<h3>Recent activities</h3>
		<hr class="separetor">
	</div>
	<div class="portfolioitems container  wow fadeInUp">
		<ul>
			<div id="shotsByPlayerId">
				<li><a href="activities"> <img
						src="<c:url value='/dist/img/Sports/1.jpg'/>" alt="">
				</a>
					<h3>
						<a href="activities">Sports Day</a>
					</h3></li>
				<li><a href="activities"> <img
						src="<c:url value='/dist/img/Republicday/9.jpg'/>" alt="">
				</a>
					<h3>
						<a href="activities">Independence Day</a>
					</h3></li>
				<li><a href="activities"> <img
						src="<c:url value='/dist/img/Republicday/9.jpg'/>" alt="">
				</a>
					<h3>
						<a href="activities">Republic Day</a>
					</h3></li>
				<li><a href="activities"> <img
						src="<c:url value='/dist/img/Navratri/3.jpg'/>" alt="">
				</a>
					<h3>
						<a href="activities">Navratri</a>
					</h3></li>
				<li><a href="activities"> <img
						src="<c:url value='/dist/img/aa.jpg'/>" alt="">
				</a>
					<h3>
						<a href="activities">Satra Prarambh</a>
					</h3></li>
			</div>
		</ul>
	</div>
</div>
<div id="testimonials" class="container">
	<div class="sectionhead wow bounceInUp" data-wow-duration="2s">
		<span class="bigicon icon-bubbles"></span>
		<h3>This is what we love to listen</h3>
		<h4>Opinion of previous students about hostel</h4>
		<hr class="separetor">
	</div>
	<div class="row">
		<!-- 1ST TESTIMONIAL ITEM -->
		<div class="col-md-6 wow bounceIn" data-wow-duration="2s">
			<div class="clientsphoto">
				<img src="<c:url value='/dist/img/userm.png'/>" alt="Ridham">
			</div>
			<div class="quote">
				<blockquote>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Quia et pariatur ipsam tempora officia ea iusto expedita, nulla,
						hic odit saepe repellat nesciunt dolorum, officiis laborum ad,
						aliquam. Quos, et.</p>
				</blockquote>
				<h5>Ridham</h5>
				<p>Founder,Maximize</p>
			</div>
		</div>
		<div class="col-md-6 wow bounceIn" data-wow-duration="3s">
			<div class="clientsphoto">
				<img src="<c:url value='/dist/img/userf.png'/>" alt="Ridham">
			</div>
			<div class="quote">
				<blockquote>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Quia et pariatur ipsam tempora officia ea iusto expedita, nulla,
						hic odit saepe repellat nesciunt dolorum, officiis laborum ad,
						aliquam. Quos, et. lorem</p>
				</blockquote>
				<h5>ABCD</h5>
				<p>Art Director at Maximize</p>
			</div>
		</div>
		<div class="col-md-6 wow bounceIn" data-wow-duration="3s">
			<div class="clientsphoto">
				<img src="<c:url value='/dist/img/userm.png'/>" alt="Ridham">
			</div>
			<div class="quote">
				<blockquote>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Quia et pariatur ipsam tempora officia ea iusto expedita, nulla,
						hic odit saepe repellat nesciunt dolorum, officiis laborum ad,
						aliquam. Quos, et.</p>
				</blockquote>
				<h5>PQRS</h5>
				<p>Principal Designer, Maximize</p>
			</div>
		</div>
		<div class="col-md-6 wow bounceIn" data-wow-duration="2s">
			<div class="clientsphoto">
				<img src="<c:url value='/dist/img/userf.png'/>" alt="Ridham">
			</div>
			<div class="quote">
				<blockquote>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Quia et pariatur ipsam tempora officia ea iusto expedita, nulla,
						hic odit saepe repellat nesciunt dolorum, officiis laborum ad,
						aliquam. Quos, et.</p>
				</blockquote>
				<h5>WXYZ</h5>
				<p>Visual Designer,Maximize</p>
			</div>
		</div>
	</div>
</div>
<div id="contact" class="container">
	<div class="col-lg-4  wow bounce">
		<h3 class="title">Want a Map</h3>
		<button id="boys">See Boy's Hostel Map</button>
		<button id="girls">See Girl's Hostel Map</button>
		<br />
		<div id="map">
			<div id="spinner" class="spinner" style="display: none;">
				<img src="<c:url value='/dist/img/loaderorange1.gif'/>"
					id="img-spinner" name="Loading" />
			</div>
		</div>
	</div>
	<div class="col-lg-4 wow bounce">
		<h3 class="title">Address</h3>
		<hr />
		<p>Oppo. Pankaj Vidhyalaya,</p>
		<p>Near BSNL Office,</p>
		<p>Gulbai Tekra,EllisBridge,</p>
		<p>Ahmedabad-380006</p>
		<h3>Phone & Email</h3>
		<p>079 26302341</p>
		<p>admin@sspkm.org</p>
		<h3>President</h3>
		<p>Shree Himmatbhai Kasvala</p>
		<p>9825184661</p>
	</div>
	<div class="col-lg-4 suggesion bounce">
		<h3 class="title">Leave Us A Message</h3>
		
			<h4 class="suggesionhead">Full Name</h4>
			<input type="text" id="name" name="name"/>
			<h4 class="suggesionhead">Email</h4>
			<input type="email" id="email" name="email"/>
			<h4 class="suggesionhead">Phone</h4>
			<input type="number" id="phone" name="phone"/>
			<h4 class="suggesionhead">Message</h4>
			<textarea id="message" name="message"></textarea>
			<br /> <input type="submit" onclick="onSubmit();"/>
		
	</div>
</div>
<script type="text/javascript">
function onSubmit(){
	var n=$("#name").val();
	var e=$("#email").val();
	var p=$("#phone").val();
	var m=$("#message").val();
	if(!!n || !!e || !!p || !!m) {
	$.ajax({
		type : "POST",
		url : "/sspkm/",
		data : {name:n,email:e,phone:p,message:m},
		success : function(response) {
			if(response){
			$("#name").val('');
			$("#email").val('');
			$("#phone").val('');
			$("#message").val('');
			alert("sucessfull");
			}
			else{
				alert("Please fill all fields")
			}
		}
	});
	}else{
		alert("Please fill all fields")
	}
};
</script>
<script>
	$(document).ready(function() {
		
		var mapOptions = {
			zoom : 16,
			center : new google.maps.LatLng(23.029666, 72.553107),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map($("#map").get(0), mapOptions);
		marker = new google.maps.Marker({
			map : map,
			animation : google.maps.Animation.DROP,
			position : {
				lat : 23.029666,
				lng : 72.553360
			},
			title : 'SP Boys Hostel'
		});
		var time = 4;
		var $progressBar, $bar, $elem, isPause, tick, percentTime;
		$("#owl-demo").owlCarousel({
			slideSpeed : 500,
			paginationSpeed : 500,
			singleItem : true,
			afterInit : progressBar,
			afterMove : moved,
			startDragging : pauseOnDragging
		});
		function progressBar(elem) {
			$elem = elem;
			buildProgressBar();
			start();
		}
		function buildProgressBar() {
			$progressBar = $("<div>", {
				id : "progressBar"
			});
			$bar = $("<div>", {
				id : "bar"
			});
			$progressBar.append($bar).prependTo($elem);
		}
		function start() {
			percentTime = 0;
			isPause = false;
			tick = setInterval(interval, 10);
		}
		;
		function interval() {
			if (isPause === false) {
				percentTime += 1 / time;
				$bar.css({
					width : percentTime + "%"
				});
				if (percentTime >= 100) {
					$elem.trigger('owl.next')
				}
			}
		}
		function pauseOnDragging() {
			isPause = true;
		}
		function moved() {
			clearTimeout(tick);
			start();
		}
		$elem.on('mouseover', function() {
			isPause = true;
		})
		$elem.on('mouseout', function() {
			isPause = false;
		})
	});
</script>