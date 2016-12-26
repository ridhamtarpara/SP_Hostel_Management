function formValidation() {

	var fname = document.getElementById("firstName");
	var lname = document.getElementById("lastName");
	var email = document.getElementById("email");
	var password = document.getElementById("password");
	var password2 = document.getElementById("password2");
	var mobile = document.getElementById("mobileNumber");
	var bloodgroup = document.getElementById("bloodGroup");
	var gender = document.getElementById("gender");
	var address1 = document.getElementById("address1");
	var address2 = document.getElementById("address2");
	var city = document.getElementById("city");
	var zipcode = document.getElementById("zipCode");
	var nativevillage = document.getElementById("nativeVillage");
	var nativetaluka = document.getElementById("nativeTaluka");
	var nativedistrict = document.getElementById("nativeDistrict");
	var nativezipcode = document.getElementById("nativeZipcode");
	var dob = document.getElementById("birthDate");
	var tc = document.getElementById("tc");

	//
	// var x =
	// var y = document.forms["registerForm"]["password1"].value;
	// if(x!==y){
	// alert("Passwords Do Not Match");
	// return false;
	// }

	if (fname.value.length == 0) {
		document.getElementById('fnameerror').innerText = "First Name Required";
		fname.style.border = "1px red solid";
		fname.focus();
		return false;
	} else if (inputAlphabet(fname, "Only Alphabets Allowed In First Name",
			"fnameerror") == false) {
		return false;
	}

	if (lname.value.length == 0) {
		document.getElementById('lnameerror').innerText = "Last Name Required";
		lname.style.border = "1px red solid";
		lname.focus();
		return false;
	} else if (inputAlphabet(lname, "Only Alphabets Allowed In Last Name",
			"lnameerror") == false) {
		return false;
	}

	if (mobilenumber(mobile, "mobileNoerror") == false) {
		return false;
	}

	if (email.value.length == 0 || email.value == null || email.value == "") {
		document.getElementById('emailerror').innerText = "Email Required";
		email.style.border = "1px red solid";
		email.focus();
		return false;
	} else if (emailValidation(email, "* Please enter a valid email address *") == false) {
		return false;
	}

	if (lengthDefine(password, 6, 20)) {

		if (passwordMatch(password, password2, "Password Must Match") == false) {

			return false;
		}
	} else {
		return false;
	}

	if (bloodgroup.value.length == 0 || bloodgroup.value == null
			|| bloodgroup.value == "") {
		document.getElementById('bgerror').innerText = "Blood Group Required";
		bloodgroup.style.border = "1px red solid";
		bloodgroup.focus();
		return false;
	}

	if (gender.value.length == 0 || gender.value == null || gender.value == '') {
		document.getElementById('gendererror').innerText = "Plz Select Gender";
		gender.style.border = "1px red solid";
		gender.focus();
		return false;
	}

	if (address1.value.length == 0 || address1.value == null
			|| address1.value == "") {
		document.getElementById('address1error').innerText = "Address Line 1 Required";
		address1.style.border = "1px red solid";
		address1.focus();
		return false;
	}

	if (address2.value.length == 0 || address2.value == null
			|| address2.value == "") {
		document.getElementById('address2error').innerText = "Address Line 2 Required";
		address2.style.border = "1px red solid";
		address2.focus();
		return false;
	}

	if (city.value.length == 0 || city.value == null || city.value == "") {
		document.getElementById('cityerror').innerText = "City Name Required";
		city.style.border = "1px red solid";
		city.focus();
		return false;
	}

	if (zipcode.value.length == 0 || zipcode.value == null
			|| zipcode.value == "") {
		document.getElementById('zipCodeerror').innerText = "Zip Code Required";
		zipcode.style.border = "1px red solid";
		zipcode.focus();
		return false;
	}

	if (checkZipcode(zipcode, "Enter 6 digit zip code", "zipCodeerror") == false) {
		return false;
	}

	if (nativevillage.value.length == 0 || nativevillage.value == null
			|| nativevillage.value == "") {
		document.getElementById('nativeVillageerror').innerText = "Native Village Required";
		nativevillage.style.border = "1px red solid";
		nativevillage.focus();
		return false;
	} else if (inputAlphabet(nativevillage,
			"Only Alphabets Allowed In Native Village Name",
			"nativeVillageerror") == false) {
		return false;
	}

	if (nativetaluka.value.length == 0 || nativetaluka.value == null
			|| nativetaluka.value == "") {
		document.getElementById('nativeTalukaerror').innerText = "Native Taluka Required";
		nativetaluka.style.border = "1px red solid";
		nativetaluka.focus();
		return false;
	} else if (inputAlphabet(nativetaluka,
			"Only Alphabets Allowed In Native Taluka Name", "nativeTalukaerror") == false) {
		return false;
	}

	if (nativedistrict.value.length == 0 || nativedistrict.value == null
			|| nativedistrict.value == "") {
		document.getElementById('nativeDistricterror').innerText = "Native District Required";
		nativedistrict.style.border = "1px red solid";
		nativedistrict.focus();
		return false;
	}

	if (nativezipcode.value.length == 0 || nativezipcode.value == null
			|| nativezipcode.value == "") {
		document.getElementById('nativeZipcodeerror').innerText = "Zip code Required";
		nativezipcode.style.border = "1px red solid";
		nativezipcode.focus();
		return false;
	}
	if (checkZipcode(nativezipcode, "Enter 6 digit native zip code",
			"nativeZipcodeerror") == false) {
		return false;
	}

	return true;
}

function advanceRegister() {
	var fatherfname = document.getElementById("fatherFname");
	var fathermname = document.getElementById("fatherMname");
	var fatherlname = document.getElementById("fatherLname");
	var fathermobileno = document.getElementById("fatherMobileNumber");
	var totalmembers = document.getElementById("totalMembers");
	var fatherbusiness = document.getElementById("fatherBusiness");
	var fatherincome = document.getElementById("fatherIncome");

	var relativefname = document.getElementById("relativeFname");
	var relativemname = document.getElementById("relativeMname");
	var relativelname = document.getElementById("relativeLname");
	var relativemobileno = document.getElementById("relativeMobileNumber");
	var relation = document.getElementById("relation");
	var relativeAddress = document.getElementById("relativeAddress");

	var tc = document.getElementById("tc");
	// var flag = true;

	if (fatherfname.value.length == 0) {
		document.getElementById('fatherFnameerror').innerText = "First Name Required";
		fatherfname.style.border = "1px red solid";
		fatherfname.focus();
		return false;
	} else if (inputAlphabet(fatherfname,
			"Only Alphabets Allowed In First Name", "fatherFnameerror") == false) {
		return false;
	}

	if (fathermname.value.length == 0) {
		document.getElementById('fatherMnameerror').innerText = "Middle Name Required";
		fathermname.style.border = "1px red solid";
		fathermname.focus();
		return false;
	} else if (inputAlphabet(fathermname,
			"Only Alphabets Allowed In Middle Name", "fatherMnameerror") == false) {
		return false;
	}

	if (fatherlname.value.length == 0) {
		document.getElementById('fatherLnameerror').innerText = "Last Name Required";
		fatherlname.style.border = "1px red solid";
		fatherlname.focus();
		return false;
	} else if (inputAlphabet(fatherlname,
			"Only Alphabets Allowed In Last Name", "fatherLnameerror") == false) {
		return false;
	}

	if (mobilenumber(fathermobileno, "fatherMobileNumbererror") == false) {
		return false;
	}

	if (totalmembers.value < 1) {
		document.getElementById('totalMemberserror').innerText = "Enter Valid Number";
		totalmembers.style.border = "1px red solid";
		return false;
	}

	if (fatherbusiness.value.length == 0) {
		document.getElementById('fatherBusinesserror').innerText = "Business Name Required";
		fatherbusiness.style.border = "1px red solid";
		fatherbusiness.focus();
		return false;
	} else if (inputAlphabet(fatherbusiness,
			"Only Alphabets Allowed In Business Name", "fatherBusinesserror") == false) {
		return false;
	}

	if (inputNumber(fatherincome, "fatherIncomeerror", alertmsg) == false) {
		return false;
	}

	// validation for relative

	if (relativefname.value.length == 0) {
		document.getElementById('relativeFnameerror').innerText = "First Name Required";
		relativefname.style.border = "1px red solid";
		relativefname.focus();
		return false;
	} else if (inputAlphabet(relativefname,
			"Only Alphabets Allowed In First Name", "relativeFnameerror") == false) {
		return false;
	}

	if (relativemname.value.length == 0) {
		document.getElementById('relativeMnameerror').innerText = "Middle Name Required";
		relativemname.style.border = "1px red solid";
		relativemname.focus();
		return false;
	} else if (inputAlphabet(relativemname,
			"Only Alphabets Allowed In Middle Name", "relativeMnameerror") == false) {
		return false;
	}

	if (relativelname.value.length == 0) {
		document.getElementById('relativeLnameerror').innerText = "Last Name Required";
		relativelname.style.border = "1px red solid";
		relativelname.focus();
		return false;
	} else if (inputAlphabet(relativelname,
			"Only Alphabets Allowed In Last Name", "relativeLnameerror") == false) {
		return false;
	}

	if (mobilenumber(relativemobileno, "relativeMobileNumbererror") == false) {
		return false;
	}

	if (fathermname.value.length == 0) {
		document.getElementById('relationerror').innerText = "Relation Required";
		fathermname.style.border = "1px red solid";
		fathermname.focus();
		return false;
	} else if (inputAlphabet(fathermname,
			"Only Alphabets Allowed In Relation Name", "relationerror") == false) {
		return false;
	}

	return true;

}

function inputAlphabet(inputtext, alertMsg, display) {
	var alphaExp = /^[a-zA-Z]+$/;
	if (inputtext.value.match(alphaExp)) {
		return true;
	} else {
		document.getElementById(display).innerText = alertMsg;
		inputtxt.style.border = "1px red solid";
		inputtext.focus();
		return false;
	}
}

function lengthDefine(inputtext, min, max) {
	var uInput = inputtext.value;
	if (uInput.length >= min && uInput.length <= max) {
		return true;
	} else {

		document.getElementById("passworderror").innerText = "* Please enter between "
				+ min + " and " + max + " characters *"; // this segment
		// displays the
		// validation rule
		// for username
		inputtext.focus();
		return false;
	}
}

function emailValidation(inputtext, alertMsg) {
	var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if (inputtext.value.match(emailExp)) {
		return true;
	} else {
		document.getElementById("emailerror").innerText = alertMsg;
		inputtext.focus();
		return false;
	}
}

function passwordMatch(p1, p2, alertMsg) {
	if (p1.value != p2.value) {
		document.getElementById("password2error").innerText = alertMsg;
		p2.focus();
		return false;
	} else {
		return true;
	}
}

function validateForgetPassword() {
	var x = document.forms["forgetpasswordform"]["email"].value;
	var atpos = x.indexOf("@");
	var dotpos = x.lastIndexOf(".");
	if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
		alert("Not a valid e-mail address");
		return false;
	}
}

function mobilenumber(inputtxt, display) {
	var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
	if (inputtxt.value.match(phoneno)) {
		return true;
	} else {
		document.getElementById(display).innerText = "Enter 10 digit mobile number";
		inputtxt.style.border = "1px red solid";
		inputtxt.focus();
		return false;
	}
}

function checkZipcode(inputtxt, alertMsg, display) {
	var zipcode = /^([1-9])([0-9]){5}$/;
	if (inputtxt.value.match(zipcode)) {
		return true;
	} else {
		document.getElementById(display).innerText = alertMsg;
		inputtxt.style.border = "1px red solid";
		inputtxt.focus();
		return false;
	}
}

function inputNumber(inputtxt, display, alertmsg) {
	var no = /^\d+/;
	if (inputtxt.value.match(no)) {
		return true;
	} else {
		document.getElementById(display).innerText = alertmsg;
		inputtxt.style.border = "1px red solid";
		inputtxt.focus();
		return false;
	}
}

// function textAlphanumeric(inputtext, alertMsg) {
// var alphaExp = /^[0-9a-zA-Z]+$/;
// if (inputtext.value.match(alphaExp)) {
// return true;
// } else {
// document.getElementById('p5').innerText = alertMsg;
// inputtext.focus();
// return false;
// }
// }

// function trueSelection(inputtext, alertMsg) {
// if (inputtext.value == "Please Choose") {
// document.getElementById('p4').innerText = alertMsg;
// inputtext.focus();
// return false;
// } else {
// return true;
// }
// }

// function checkPass() {
//
// if (password.value == password1.value) {
// document.getElementById("password1").style.border = "2px #66cc66 dashed";
// } else {
// document.getElementById("password1").style.border = "2px #ff6666 dashed";
// }
// }
