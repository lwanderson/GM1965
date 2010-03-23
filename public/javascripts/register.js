
// <![CDATA[

function showRandRWindow() {
   setx = (screen.availWidth - 620)/2;
   sety = (screen.availHeight-720)/2;
   window.open("member_randr.html", "newWin", "status=no,menubar=no,width=620,height=750,screenx="+setx+",screeny="+sety)
}

function toggleSubmit(button) {
   button.form.submit.disabled = !button.checked;
}

function validateForm(theform) {

	var now = new Date();
	var returnVal = false;

   if (theform.first_name.value.length == 0) {
	   alert("First Name is required.");
	   theform.first_name.focus();
	   return false;
	   }
	if (!(checkString(theform.first_name.value))) {
	   alert("First Name contains an invalid character. Please reenter.");
	   theform.first_name.focus();
	   return false;
	   }

	if (theform.mi.value.length > 1 ) {
	   alert("Middle initial may be one character only.");
	   theform.mi.focus();
	   return false;
	   }

	if (theform.mi.value.length == 1 && !(checkString(theform.mi.value))) {
	   alert("Middle initial contains an invalid character. Please reenter.");
	   theform.mi.focus();
	   return false;
	   }

	if (theform.last_name.value.length == 0) {
	   alert("Last Name is required.");
	   theform.last_name.focus();
	   return false;
	   }
	if (!(checkString(theform.last_name.value))) {
	   alert("Last Name contains an invalid character. Please reenter.");n
	   theform.last_name.focus();
	   return false;
	   }

	if (theform.class_name.value.length == 0) {
	   alert("Class Name is required.");
	   theform.class_name.focus();
	   return false;
	   }
	if (!(checkString(theform.class_name.value))) {
	   alert("Class Name contains an invalid character. Please reenter.");
	   theform.class_name.focus();
	   return false;
	   }

	if (theform.address_1.value.length > 0 && !(checkString(theform.address_1.value))) {
	   alert("Address contains an invalid character. Please reenter.");
	   theform.address_1.focus();
	   return false;
	   }

	if (theform.address_2.value.length > 0 && !(checkString(theform.address_2.value))) {
	   alert("Address contains an invalid character. Please reenter.");
	   theform.address_2.focus();
	   return false;
	   }

	if (theform.city.value.length > 0 && !(checkString(theform.city.value))) {
	   alert("City contains an invalid character. Please reenter.");
	   theform.city.focus();
	   return false;
	   }

	if (theform.zip.value.length > 0 && !(checkNumber(theform.zip.value))) {
  	   alert("Zip code contains an invalid character. Please reenter.");
	   theform.zip.focus();
	   return false;
	   }

	if (theform.province.value.length > 0 && !(checkString(theform.province.value))) {
	   alert("Province contains an invalid character. Please reenter.");
	   theform.province.focus();
	   return false;
	   }

	if (theform.country.value.length > 0 && !(checkString(theform.country.value))) {
	   alert("Country contains an invalid character. Please reenter.");
	   theform.country.focus();
	   return false;
	   }

	if (theform.email.value.length == 0) {
	   alert("Email address is required.");
	   theform.email.focus();
      return (false);
  	   }
	if (!(checkString(theform.email.value))) {
	   alert("Email address contains an invalid character. Please reenter.");
	   theform.email.focus();
	   return false;
	   }
   var email_at = theform.email.value.indexOf('@');
   var email_domain = theform.email.value.indexOf('.', email_at);
	if (email_at == -1 || email_domain == -1 ) {
	   alert("Email address is invalid. Please reenter.");
	   theform.email.focus();
	   return false;
	   }

	if (theform.gm_street.value.length == 0) {
	   alert("GM street location is required.");
	   theform.gm_street.focus();
      return (false);
  	   }
	if (!(checkString(theform.gm_street.value))) {
	   alert("GM street location contains an invalid character. Please reenter.");
	   theform.gm_street.focus();
	   return false;
	   }

	if (theform.gm_colors.value.length == 0) {
	   alert("GM colors is required.");
	   theform.gm_colors.focus();
      return (false);
  	   }
	if (!(checkString(theform.gm_colors.value))) {
	   alert("GM colors contains an invalid character. Please reenter.");
	   theform.gm_colors.focus();
	   return false;
	   }

	if (theform.gm_PIAA.value.length == 0) {
	   alert("GM PIAA is required.");
	   theform.gm_PIAA.focus();
      return (false);
  	   }
	if (!(checkString(theform.gm_PIAA.value))) {
	   alert("GM PIAA contains an invalid character. Please reenter.");
	   theform.gm_PIAA.focus();
	   return false;
	   }

	if (theform.class_colors.value.length == 0) {
	   alert("Class of 65 colors is required.");
	   theform.class_colors.focus();
      return (false);
  	   }
	if (!(checkString(theform.class_colors.value))) {
	   alert("Class of 65 colors contains an invalid character. Please reenter.");
	   theform.class_colors.focus();
	   return false;
	   }

	if (theform.class_motto.value.length == 0) {
	   alert("Class of 65 motto is required.");
	   theform.class_motto.focus();
      return (false);
  	   }
	if (!(checkString(theform.class_motto.value))) {
	   alert("Class of 65 motto contains an invalid character. Please reenter.");
	   theform.class_motto.focus();
	   return false;
	   }

	if (theform.class_flower.value.length == 0) {
	   alert("Class of 65 flower is required.");
	   theform.class_flower.focus();
      return (false);
  	   }
	if (!(checkString(theform.class_flower.value))) {
	   alert("Class of 65 flower contains an invalid character. Please reenter.");
	   theform.class_flower.focus();
	   return false;
	   }

	if (theform.class_size.value.length == 0) {
	   alert("Class of 65 size is required.");
	   theform.class_size.focus();
      return (false);
  	   }
	if (!(checkNumber(theform.class_size.value))) {
	   alert("Class of 65 size contains an invalid character. Please reenter.");
	   theform.class_size.focus();
	   return false;
	   }

	return true;
	}

function checkString(thestring) {

   //var checkit = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzƒŠŒšœŸÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖØÙÚÛÜİŞßàáâãäåæçèéêëìíîïğñòóôõöøùúûüış0123456789-.@_ \t\r\n\f";
   var checkit = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzƒŠŒšœŸàáâãäåæçèéêëìíîï0123456789-.@_ \t\r\n\f";
   var checkStr = thestring;
   var returnVal = true;

   for (i = 0;  i < checkStr.length;  i++)  {
      ch = checkStr.charAt(i);
      for (j = 0;  j < checkit.length;  j++) {
         if (ch == checkit.charAt(j))
            break;
		 }
      if (j == checkit.length) {
         returnVal = false;
         break;
         }
      }
	return returnVal;
	}

function checkNumber(thestring) {

	var checkit = "0123456789-.";
  	var checkStr = thestring;
	var returnVal = true;

  	for (i = 0;  i < checkStr.length;  i++) {
       ch = checkStr.charAt(i);
       for (j = 0;  j < checkit.length;  j++) {
       	  if (ch == checkit.charAt(j))
           	 break;
	      }
       if (j == checkit.length) {
       	  returnVal = false;
      	  break;
    	  }
  	   }
	return returnVal;
	}

function cancelForm() {
   if (confirm('Are you sure you want to leave this form?', 'Confirm cancel:')) {
      history.back();
      }
	}

function sayThanks() {
   location.replace(document.URL.substring(0,(document.URL.lastIndexOf('/'))+1)+"thanks.php");
	return true;
	}

// ]]>
