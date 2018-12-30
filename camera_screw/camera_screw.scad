include <../screw/screw_lib.scad>;
            
/*
 * Countersink style:
 *                         -2 - Not even flat ends
 *                         -1 - Bottom (countersink'd and top flat)
 *                          0 - None (top and bottom flat)
 *                          1 - Top (bottom flat)
 *                          2 - Both (countersink'd)
 */

module camera_screw(height = 10) {
  PI=3.141592;
  diameterThread = 6;
  step = 1.2;
  roundness = 4;
  degrees = 45;
    
  countersink_style = 1;
  screw_thread(diameterThread, step, degrees, height, PI / roundness, countersink_style);
    
}
