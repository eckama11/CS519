<?php

  $dbuser="air_quality";
  $dbpass="air_quality";
  /* This responds to a POST request. It expects data in key=value form. This might come 
     from an imp agent, an html page, or a curl command such as
   
     curl --header "Content-Type: application/x-www-form-urlencoded" --data "str1=place&str2=here" http://server-ip/insertdb.php
   
     The supplied data is accessed through the $_POST variable which can be indexed by key to obtain
     the corresponding value (i.e. $_POST[str1]).
   */
  
  if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die("not post request");
  }
  
  $con = mysqli_connect("localhost",$dbuser,$dbpass);
  if (mysqli_connect_errno()) {
    die("connection failed: " . mysqli_connect_error());
  }
  unset($dbuser,$dbpass);

  $sql = "use air_quality";
  if (!mysqli_query($con,$sql)) {
    die("use database failed: " . mysqli_error($con));
  }
  $imp = mysqli_real_escape_string($con,$_POST[imp]);
  $newTemp = mysqli_real_escape_string($con,$_POST[newTemp]);
  $newHum = mysqli_real_escape_string($con,$_POST[newHum]);
  $pressure = mysqli_real_escape_string($con,$_POST[pressureA]);
  $altitude = mysqli_real_escape_string($con,$_POST[altitude]);
  $latitude = mysqli_real_escape_string($con,$_POST[latitude]);
  $longitude = mysqli_real_escape_string($con,$_POST[longitude]);
  $particles = mysqli_real_escape_string($con,$_POST[particles]);
  $time = date('Y-m-d H:i:s');
  
  
  $sql = "insert into sensors(impId, timeInfo, temperature, humidity, pressure, altitude, latitude, longitude, particles) 
  values('$imp','$time', $newTemp, $newHum, $pressure, $altitude, $latitude, $longitude, $particles)";
  
  if (!mysqli_query($con,$sql)) {
    die("database insert failed: " . mysqli_error($con));
  }
  
  echo $newTemp;  
  echo "success";
  
  mysqli_close($con);
?>