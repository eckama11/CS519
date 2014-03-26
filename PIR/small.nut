motion <- hardware.pin1;
function readPin(){  
  server.log(motion.read());
  if(motion.read() == 1)  {     
    local current_light = hardware.lightlevel();     
    local voltage = hardware.voltage();          
    server.log("Motion Detected - Light Level:" + current_light + " - Voltage:" + voltage);     
    //agent.send("motionDetected", "Motion Detected - Light Level:" + current_light + " - Voltage:" + voltage);  
    } 
  
}
motion.configure(DIGITAL_IN_WAKEUP, readPin); 