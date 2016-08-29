var strength = 0
$(document).ready(function() {
$('#password').keyup(function() {
$('#result').html(checkStrength($('#password').val()))
})
function checkStrength(password) {

$("#div1").show();
if (password.length < 6) {
	$("#meter1").val('10')
$('#result').removeClass()
$('#result').addClass('short')
return 'Too short'
}
if (password.length > 7) strength += 1
// If password contains both lower and uppercase characters, increase strength value.
if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) strength += 1
// If it has numbers and characters, increase strength value.
if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/)) strength += 1
// If it has one special character, increase strength value.
if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
// If it has two special characters, increase strength value.
if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
// Calculated strength value, we can return messages
// If value is less than 2
if (strength < 2) {
	$("#meter1").val('25')
$('#result').removeClass()
$('#result').addClass('weak')
return 'Weak'
} else {
	$("#meter1").val('100')
$('#result').removeClass()
$('#result').addClass('strong')
return 'Strong'
}
}
});


function validate(){
    if(strength >= 2)
      {}
     else
     	alert("Password is not strong")
}

