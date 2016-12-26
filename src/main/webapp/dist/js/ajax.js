function getHostel() {
	var id = $('#hostelSelect').val();
	$.ajax({
		type : "POST",
		url : "/sspkm/admin/getHostel",
		data : "id=" + id,
		success : function(response) {
			$(".hostelDetail").show();
			var h = $.parseJSON(response);
			$("#hostelName").attr("value", h.hostelName);
			$("#contactNumber").attr("value", h.contactNumber);
			$("#availableSeats").attr("value", h.availableSeats);
			$("#deposit").attr("value", h.deposit);
			$("#fee").attr("value", h.fee);
			$("#foodBill").attr("value", h.foodBill);
			$("#hostelId").attr("value", h.hostelId);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function getRooms() {
	$(".loader").show();
	var hId = $('#hostelSelect').val();
	var aId = $('#applicantId').val();
	$.ajax({
		type : "POST",
		url : "/sspkm/admin/getRooms",
		data : {
			applicantId : aId,
			hostelId : hId,
		},
		success : function(response) {
			var roomjson = "";
			var rooms = $.parseJSON(response);
			$.each(rooms, function(index, element) {

				roomjson = roomjson + '<option value="' + element.roomId + '">'
						+ element.roomNumber + '  [Number of student : '
						+ element.numberOfStudents + ']' + '</option>';
			});
			$("#roomSelect").html(roomjson);
			$(".loader").hide();
		},
		error : function(e) {
			alert('Error: ' + e);
			$(".loader").show();
		}
	});

}

function viewApplicant(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/admin/viewApplicant",
		data : "id=" + id,
		success : function(response) {
			var a = $.parseJSON(response);
			$("#applicantName").text(a.firstName).append(' ' + a.middleName)
					.append(' ' + a.lastName);
			$("#applicantEmail").text(a.email);
			$("#applicantMobileNumber").text(a.mobileNumber);
			$("#applicantBirthDate").text(a.birthDate);
			$("#applicantBloodGroup").text(a.bloodGroup);
			$("#applicantAddress").text(a.address1)
					.append('<br/>' + a.address2).append(', ' + a.city).append(
							' - ' + a.zipCode);
			$("#fatherName").text(a.parent_firstName).append(
					' ' + a.parent_middleName).append(' ' + a.parent_lastName);
			$("#fatherMobileNumber").text(a.parent_mobileNumber);
			$("#fatherBusiness").text(a.parent_business);
			$("#fatherIncome").text(a.parent_income);
			$("#familyMember").text(a.parent_totalMembers);
			$("#nativeAddress").text(a.nativeVillage).append(
					'<br />Taluka - ' + a.nativeTaluka).append(
					'<br/>Dist. - ' + a.nativeDistrict).append(
					'<br/>Pincode -' + a.nativeZipCode);
			$("#relativeName").text(a.relative_firstName).append(
					' ' + a.relative_middleName).append(
					' ' + a.relative_lastName);
			$("#relativeMobileNumber").text(a.relative_mobileNumber);
			$("#relation").text(a.relative_relation);
			$("#relativeAddress").text(a.relative_address);
			$("#10thPer").text(a.x);
			$("#12thPer").text(a.xii);
			$("#courseName").text(a.subCourseName);
			$("#collegeName").text(a.collegeName);
			$("#collegeAddress").text(a.address);
			$("#self").attr("src", a.urlSelf);
			$("#parent").attr("src", a.urlParent);
			$("#relative").attr("src", a.urlRelative);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function viewStudent(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/viewStudent",
		data : "studentid=" + id,
		success : function(response) {

			var a = $.parseJSON(response);
			$("#applicantName").text(a.firstName).append(' ' + a.middleName)
					.append(' ' + a.lastName);
			$("#applicantEmail").text(a.email);
			$("#applicantMobileNumber").text(a.mobileNumber);
			$("#applicantBirthDate").text(a.birthDate);
			$("#applicantBloodGroup").text(a.bloodGroup);
			$("#applicantHostel").text(a.hostelName);
			$("#applicantRoom").text(a.roomNumber);
			$("#applicantAddress").text(a.address1)
					.append('<br/>' + a.address2).append(', ' + a.city).append(
							' - ' + a.zipCode);
			$("#fatherName").text(a.parent_firstName).append(
					' ' + a.parent_middleName).append(' ' + a.parent_lastName);
			$("#fatherMobileNumber").text(a.parent_mobileNumber);
			$("#fatherBusiness").text(a.parent_business);
			$("#fatherIncome").text(a.parent_income);
			$("#familyMember").text(a.parent_totalMembers);
			$("#nativeAddress").text(a.nativeVillage).append(
					'<br />Taluka - ' + a.nativeTaluka).append(
					'<br/>Dist. - ' + a.nativeDistrict).append(
					'<br/>Pincode -' + a.nativeZipCode);
			$("#relativeName").text(a.relative_firstName).append(
					' ' + a.relative_middleName).append(
					' ' + a.relative_lastName);
			$("#relativeMobileNumber").text(a.relative_mobileNumber);
			$("#relation").text(a.relative_relation);
			$("#relativeAddress").text(a.relative_address);
			$("#10thPer").text(a.x);
			$("#12thPer").text(a.xii);
			$("#courseName").text(a.subCourseName);
			$("#collegeName").text(a.collegeName);
			$("#collegeAddress").text(a.collegeAddress);
			$("#self").attr("src", a.urlSelf);
			$("#parent").attr("src", a.urlParent);
			$("#relative").attr("src", a.urlRelative);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function viewStudentLeaveRequest(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/viewRequest",
		data : {
			leaveApplicatioId : id,
			complaintId : '',
			vehicleRegisterId : '',
			achievementId : ''
		},
		success : function(response) {
			var r = $.parseJSON(response);
			$("#lId").text(r.leaveApplicationId);
			$("#ltitle").text(r.title);
			$("#ldetail").text(r.detail);
			$("#laddress").text(r.address);
			$("#lstatus").text(r.status);
			$("#ldate").text(r.leaveDate);
			$("#rdate").text(r.returnDate);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function viewStudentComplaintRequest(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/viewRequest",
		data : {
			leaveApplicatioId : '',
			complaintId : id,
			vehicleRegisterId : '',
			achievementId : ''
		},
		success : function(response) {
			var r = $.parseJSON(response);
			$("#ctitle").text(r.title);
			$("#ctype").text(r.complaintType);
			$("#cdetail").text(r.detail);
			$("#cstatus").text(r.status);
			$("#cdate").text(r.date);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function viewStudentVehicleRequest(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/viewRequest",
		data : {
			leaveApplicatioId : '',
			complaintId : '',
			vehicleRegisterId : id,
			achievementId : ''
		},
		success : function(response) {
			var r = $.parseJSON(response);
			$("#vehicleNumber").text(r.vehicleNumber);
			$("#vehicleModel").text(r.vehicleModel);
			$("#licenceNumber").text(r.licenceNumber);
			$("#vstatus").text(r.status);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function viewStudentAchievementRequest(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/viewRequest",
		data : {
			leaveApplicatioId : '',
			complaintId : '',
			vehicleRegisterId : '',
			achievementId : id
		},
		success : function(response) {
			var r = $.parseJSON(response);
			$("#atitle").text(r.title);
			$("#adetail").text(r.detail);
			$("#astatus").text(r.status);
			$("#adate").text(r.date);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function getActivity(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/rector/viewActivities",
		data : "id=" + id,
		success : function(response) {
			var r = $.parseJSON(response);
			$("#type").text(r.type);
			$("#title").text(r.title);
			$("#description").text(r.description);
			$("#date").text(r.date);

		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function getSubcourse() {
	$(".loader").show();
	var id = $('#courseSelect').val();
	$.ajax({
		type : "POST",
		url : "/sspkm/forum/getSubcourse",
		data : "courseId=" + id,
		success : function(response) {
			$('#subCourseSelect').removeAttr("disabled");
			var appenddata = "<option value='-1' selected>All</option>";
			$.each(JSON.parse(response), function(key, value) {
				appenddata += "<option value = '" + value.subCourseId + " '>"
						+ value.subCourseName + " </option>";
			});
			$('#subCourseSelect').html(appenddata);
			$(".loader").hide();
		},
		error : function(e) {
			alert('Error: ' + e);
			$(".loader").hide();
		}
	});

}

function getTrustee(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/trustee/viewTrustees",
		data : "id=" + id,
		success : function(response) {
			var a = $.parseJSON(response);
			$("#trusteeName").text(a.firstName).append(' ' + a.middleName)
					.append(' ' + a.lastName);
			$("#trusteeEmail").text(a.email);
			$("#trusteeDesignation").text(a.designation);
			$("#trusteeMobileNumber").text(a.mobileNumber);
			$("#trusteeBirthDate").text(a.birthDate);
			$("#trusteeBloodGroup").text(a.bloodGroup);
			$("#trusteeAddress").text(a.address1).append('<br/>' + a.address2)
					.append(', ' + a.city).append(' - ' + a.zipCode);

		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function getAdmin(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/trustee/viewAdmins",
		data : "id=" + id,
		success : function(response) {
			var a = $.parseJSON(response);
			$("#adminName").text(a.firstName).append(' ' + a.middleName)
					.append(' ' + a.lastName);
			$("#adminEmail").text(a.email);
			$("#adminQualification").text(a.qualifications);
			$("#adminMobileNumber").text(a.mobileNumber);
			$("#adminBirthDate").text(a.birthDate);
			$("#adminBloodGroup").text(a.bloodGroup);
			$("#adminAddress").text(a.address1).append('<br/>' + a.address2)
					.append(', ' + a.city).append(' - ' + a.zipCode);
			$("#photo").attr("src", a.photo);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function getRector(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/viewRectors",
		data : "id=" + id,
		success : function(response) {
			var a = $.parseJSON(response);
			$("#rectorName").text(a.firstName).append(' ' + a.middleName)
					.append(' ' + a.lastName);
			$("#rectorEmail").text(a.email);
			$("#rectorQualification").text(a.qualifications);
			$("#rectorHostelName").text(a.hostelName);
			$("#rectorHostelAddress").text(a.address);
			$("#rectorMobileNumber").text(a.mobileNumber);
			$("#rectorBirthDate").text(a.birthDate);
			$("#rectorBloodGroup").text(a.bloodGroup);
			$("#rectorAddress").text(a.address1).append('<br/>' + a.address2)
					.append(', ' + a.city).append(' - ' + a.zipCode);
			$("#photo").attr("src", a.photo);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
function getReport(a) {
	var id = a;
	$.ajax({
		type : "POST",
		url : "/sspkm/admin/viewReports",
		data : "id=" + id,
		success : function(response) {
			var r = $.parseJSON(response);
			$("#title").text(r.title);
			$("#date").text(r.date);
			$("#description").text(r.description);

		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

}

function getMessage() {
	$(".loader").show();

	$
			.ajax({
				type : "POST",
				url : "/sspkm/student/allMessages",
				success : function(response) {
					console.log(response);
					var messageshtml = "";
					var messages = $.parseJSON(response);
					$
							.each(
									messages,
									function(index, element) {
										var d = new Date(
												element.messages[0].time);
										var date = d.getHours() + ":"
												+ d.getMinutes() + " "
												+ d.getDate() + '/'
												+ (d.getMonth() + 1) + '/'
												+ d.getFullYear();
										messageshtml = messageshtml
												+ "<li><a href='/sspkm/student/myMessages?userId="
												+ element.messageFrom.userId
												+ "'><div class='pull-left'><img src='/sspkm/dist/img/user/"
												+ element.messageFrom.userId
												+ "/self"
												+ element.messageFrom.appliedOn
												+ ".jpg' class='img-circle' alt='User Image'></div><h4>"
												+ element.messageFrom.firstName
												+ " "
												+ element.messageFrom.lastName
												+ "</h4><small><i class='fa fa-clock-o'></i>"
												+ date + "</small><p>"
												+ element.messages[0].message
												+ "</p></a></li>";
									});
					$("#allMessages").html(messageshtml);
					$(".loader").hide();
				},
				error : function(e) {

					$(".loader").hide();
					$("#allMessages").html("No messages");
				}
			});
}