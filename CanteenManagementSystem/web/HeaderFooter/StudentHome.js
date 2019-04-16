 var credPoints = new Date().getHours();
  var notice;
  if (credPoints < 10) {
    notice = "Your current credit points is below 50pt";
  } else {
    notice = null;
  } 
document.getElementById("student").innerHTML = notice;


