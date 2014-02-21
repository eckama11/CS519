// TMP102 Temperature Reader
// Uses i2c on pins 8, 9
// Parts Taken from http://forums.electricimp.com/discussion/336/tmp102-and-i2c/p1
 
class TemperatureReader {
    i2c = null;
    temp = null;
    // Constructor
    constructor() {
        hardware.i2c89.configure(CLOCK_SPEED_100_KHZ);
        i2c = hardware.i2c89;
    }
    
    function readData() {
        // Read msb and lsb
        local a = i2c.read(0x90, "\x00", 2);
        
        // Calculate no of steps. Each step is 0.0625 degrees centigrades.
        temp = ((((a[0] & 0x7f) << 8) + a[1]) >> 4) * 0.0625;
        
        // Is negative value?
        if (a[0] & 0x80) {
            temp *= -1;
        }
        temp = temp * 1.8 + 32;
        return temp;
    }
}
 
// My TMP102 uses i2c on pins 8, 9
// it has the ADD pin tied to VCC, so that its 7bit address is 1001001 = 0×49
local mysensor = TemperatureReader();
 
function bigLoop() {
    local temp = mysensor.readData();
    agent.send("Xively", temp);
    imp.wakeup(5, bigLoop); // sleep for 10 seconds
}

//read temp
bigLoop();