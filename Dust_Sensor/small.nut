function loop() {
  //make shorter pin5 name
  local pin5 = hardware.pin5;
  //make shorter pin1 name
  local pin1 = hardware.pin1;

  //configure pin5 to turn on/off led
  //led is used to sense dust particles
  pin5.configure(DIGITAL_OUT);
  //configure pin1 to read voltage
  //of dust sensor, will later involve
  //algorithm to calculate dust density
  pin1.configure(ANALOG_IN);

  //turn led on
  pin5.write(0);
  //take time to sample
  imp.sleep(0.0000028);
  //read dust value
  local voMeasured = pin1.read();
  //take some more delay time
  imp.sleep(0.00000040);
  //turn led off
  pin5.write(1);
  //take some more delay time
  imp.sleep(0.00009680);

  //0-3.3V mapped to 0-65,535 integer value
  //recover voltage based in slope intercept
  //of voltage versus reading
  local calcVoltage = (2.7/65535)*voMeasured + 0.6;
  //recover dust density based on slope intercept
  //of dust density versus voltage given in 
  //Sharp's datasheet via sparkfun
  local dustDensity = (calcVoltage - 0.6)/6.0;

  //log answer
  server.log("Raw Signal Value (0-65,535): " + voMeasured);
  server.log("Voltage: " + calcVoltage);
  server.log("Dust Density: " + dustDensity);
}

function bigLoop() { 
    loop();
    imp.wakeup(900, bigLoop); // sleep for 10 seconds
}
 
bigLoop();