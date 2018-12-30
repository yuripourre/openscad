include <../knurled_finish/knurled_finish_lib.scad>;
include <camera_screw.scad>;

module knurled_camera_screw(height = 10,
diameterKnob = 15, heightKnob = 6, knurlWidth = 3, knurlHeight = 4, knurlDepth = 1.5, knurlEndSmooth = 2, knurlSurfaceSmooth = 0) {

knurled_cyl(heightKnob, diameterKnob,
            knurlWidth, knurlHeight, knurlDepth,
            knurlEndSmooth, knurlSurfaceSmooth);

translate([0, 0, heightKnob])
camera_screw(height);
}