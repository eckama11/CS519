<?php
	//require_once(dirname(__FILE__)."/../common.php");
	
	/*
	if (!isset($loginSession))
        doUnauthenticatedRedirect();
	*/
        
  /*
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die("not post request");
  }
  */
  
  $con = mysqli_connect("localhost","air_quality","air_quality");
  if (mysqli_connect_errno()) {
    die("connection failed: " . mysqli_connect_error());
  }
  unset($dbuser,$dbpass);

  $sql = "use air_quality";
  if (!mysqli_query($con,$sql)) {
    die("use database failed: " . mysqli_error($con));
  }
  
  $date = new DateTime();
  
  $str1 = mysqli_real_escape_string($con,$_POST[str1]);
  
  $sql = "INSERT INTO sensorParticle (timeInfo, particles) VALUES ('$date', '1.33')";
  if (!mysqli_query($con,$sql)) {
    die("database insert failed: " . mysqli_error($con));
  }
    
  echo "success";
  
  mysqli_close($con);