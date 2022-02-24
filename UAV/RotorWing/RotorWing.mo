within UAV.RotorWing;
model RotorWing "旋翼"
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Polygon(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      points = {{100.0, 100.0}, {60.0, 80.0}, {-60.0, -80.0}, {-100.0, -100.0}, {-80.0, -60.0}, {80.0, 60.0}}), Polygon(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      points = {{-100.0, 100.0}, {-60.0, 80.0}, {60.0, -80.0}, {100.0, -100.0}, {80.0, -60.0}, {-80.0, 60.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-100.0, -30.0}, {100.0, 30.0}}, 
      textString = "%name", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.Bold}), Ellipse(origin = {2.0, -2.0}, 
      fillColor = {255, 255, 255}, 
      pattern = LinePattern.DashDot, 
      extent = {{-62.0, -62.0}, {62.0, 62.0}})}));
  parameter Integer n = 1 "旋翼编号";
  parameter Real b = 2.74e-7 "升力系数,N.s2";
  parameter Real d = 7.22e-9 "阻力系数,N.m.s2";
  Interfaces.ControlBus controlbus
    annotation (
      Placement(transformation(origin = {0.0, 60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
    annotation (
      Placement(transformation(extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Modelica.Mechanics.MultiBody.Forces.WorldForceAndTorque forceAndTorque(animation = false)
    annotation (
      Placement(transformation(origin = {-40.0, -20.0}, 
        extent = {{-20.0, -20.0}, {20.0, 20.0}})));
  Components.FM fm(n = n, b = b, d = d)
    annotation (
      Placement(transformation(origin = {-40.0, 40.0}, 
        extent = {{20.0, -20.0}, {-20.0, 20.0}})));
equation 
  connect(forceAndTorque.frame_b, frame_b)
    annotation (Line(origin = {-10.0, -20.0}, 
      points = {{-10.0, 0.0}, {10.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fm.controlbus, controlbus)
    annotation (Line(origin = {-10.0, 30.0}, 
      points = {{-10.0, 10.0}, {10.0, 10.0}, {10.0, -10.0}}, 
      color = {255, 204, 51}, 
      thickness = 0.5));
  connect(fm.Torque, forceAndTorque.torque)
    annotation (Line(origin = {-71.0, 12.0}, 
      points = {{9.0, 20.0}, {-9.0, 20.0}, {-9.0, -20.0}, {7.0, -20.0}}, 
      color = {0, 0, 127}));
  connect(fm.Force, forceAndTorque.force)
    annotation (Line(origin = {-76.0, 8.0}, 
      points = {{14.0, 40.0}, {-14.0, 40.0}, {-14.0, -40.0}, {12.0, -40.0}}, 
      color = {0, 0, 127}));
end RotorWing;