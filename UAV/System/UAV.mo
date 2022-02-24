within UAV.System;
model UAV "无人机"
  extends Modelica.Icons.Example;
  output SI.Angle angle_command[3] = {controller.timetable_gamma.y, controller.timetable_pesi.y, controller.timetable_phi.y} "指令姿态角";
  output SI.Angle angle[3] = dynamics.controlbus.Angle "无人机姿态角";
  output SI.AngularVelocity w[4] = dynamics.controlbus.w "无人机四旋翼转速";
  output SI.Force F1 = rotorwing1.fm.Force[2] "旋翼1升力";
  output SI.Force F2 = rotorwing2.fm.Force[2] "旋翼2升力";
  output SI.Force F3 = rotorwing3.fm.Force[2] "旋翼3升力";
  output SI.Force F4 = rotorwing4.fm.Force[2] "旋翼4升力";
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.02, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = false));
  Dynamics.Dynamics dynamics
    annotation (
      Placement(transformation(extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  RotorWing.RotorWing rotorwing1(d = -7.22e-9)
    annotation (
      Placement(transformation(origin = {40.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  RotorWing.RotorWing rotorwing2(n = 2)
    annotation (
      
      Placement(transformation(origin = {40.0, -40.0}, 
        extent = {{-10.0, 10.0}, {10.0, -10.0}})));RotorWing.RotorWing rotorwing3(n = 3, d = -7.22e-9)
    annotation (
      Placement(transformation(origin = {-40.0, -40.0}, 
        extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  RotorWing.RotorWing rotorwing4(n = 4)
    annotation (
      Placement(transformation(origin = {-40.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Controller.Controller controller(kp_gamma = 100, ki_gamma = 1, kd_gamma = 10, kp_pesi = 100, ki_pesi = 1, kd_pesi = 10, ki_phi = 1, kp_phi = 100, 
    kd_phi = 10)

    annotation (
      
      Placement(transformation(origin = {80.0, 10.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));inner Modelica.Mechanics.MultiBody.World world(animateWorld = false, animateGravity = false)
    annotation (
      Placement(transformation(origin = {-70.0, -70.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(dynamics.frame_a1, rotorwing1.frame_b)
    annotation (
      
      Line(origin = {34.0, 68.0}, 
        points = {{-14.0, -48.0}, {6.0, -48.0}, {6.0, -28.0}}, 
        color = {95, 95, 95}, 
        thickness = 1.0));connect(dynamics.frame_a2, rotorwing2.frame_b)
    annotation (
      
      Line(origin = {60.0, -62.0}, 
        points = {{-40.0, 42.0}, {-40.0, 43.0}, {-20.0, 43.0}, {-20.0, 22.0}}, 
        color = {95, 95, 95}, 
        thickness = 1.0));connect(dynamics.frame_a3, rotorwing3.frame_b)
    annotation (
      
      Line(origin = {-60.0, -60.0}, 
        points = {{40.0, 40.0}, {20.0, 40.0}, {20.0, 20.0}}, 
        color = {95, 95, 95}, 
        thickness = 1.0));connect(dynamics.frame_a4, rotorwing4.frame_b)
    annotation (
      
      Line(origin = {-60.0, 60.0}, 
        points = {{40.0, -40.0}, {20.0, -40.0}, {20.0, -20.0}}, 
        color = {95, 95, 95}, 
        thickness = 1.0));connect(dynamics.controlbus, controller.controlbus)
    annotation (
      
      Line(origin = {62.0, 2.0}, 
        points = {{-62.0, -2.0}, {8.0, -2.0}}, 
        color = {255, 204, 51}, 
        thickness = 1.0));
  connect(controller.controlbus, rotorwing2.controlbus)
    annotation (
      Line(origin = {50.0, -30.0}, 
        points = {{20.0, 30.0}, {20.0, -30.0}, {-10.0, -30.0}, {-10.0, -16.0}}, 
        color = {255, 204, 51}, 
        thickness = 0.5));
  connect(controller.controlbus, rotorwing1.controlbus)
    annotation (
      Line(origin = {55.0, 29.0}, 
        points = {{15.0, -29.0}, {15.0, 31.0}, {-15.0, 31.0}, {-15.0, 17.0}}, 
        color = {255, 204, 51}, 
        thickness = 0.5));
  connect(controller.controlbus, rotorwing4.controlbus)
    annotation (
      Line(origin = {15.0, 29.0}, 
        points = {{55.0, -29.0}, {55.0, 31.0}, {-55.0, 31.0}, {-55.0, 17.0}}, 
        color = {255, 204, 51}, 
        thickness = 0.5));
  connect(controller.controlbus, rotorwing3.controlbus)
    annotation (Line(origin = {15.0, -30.0}, 
      points = {{55.0, 30.0}, {55.0, -30.0}, {-55.0, -30.0}, {-55.0, -16.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
end UAV;