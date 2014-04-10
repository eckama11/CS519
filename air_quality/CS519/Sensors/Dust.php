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
  echo "awesome ";
  $con = mysqli_connect("localhost","air_quality","air_quality");
  if (mysqli_connect_errno()) {
    die("connection failed: " . mysqli_connect_error());
  }
  unset($dbuser,$dbpass);

  $sql = "use air_quality";
  if (!mysqli_query($con,$sql)) {
    die("use database failed: " . mysqli_error($con));
  }
  echo "awesome2 ";
  $date = date('m/d/Y h:i:s a', time());
   echo "awesome3 ";
  $str1 = mysqli_real_escape_string($con,$_POST[str1]);
   echo "awesome4 ";
  $sql = "insert into sensorParticle(timeInfo,particles) values (now(), '".$str1."')";
  echo "awesome5 "; 
  if (!mysqli_query($con,$sql)) {
    die("database insert failed: " . mysqli_error($con));
  }
	echo "awesome4 ";  
  echo "success";
  
  mysqli_close($con);