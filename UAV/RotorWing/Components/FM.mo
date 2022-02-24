within UAV.RotorWing.Components;
model FM "力和力矩计算"
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {-80.0, 0.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
      textString = "w", 
      textStyle = {TextStyle.None}), Text(origin = {60.0, 0.0}, 
      extent = {{-40.0, -20.0}, {40.0, 20.0}}, 
      textString = "Force[3]", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, 130.0}, 
      extent = {{-100.0, -30.0}, {100.0, 30.0}}, 
      textString = "%name", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.Bold})}));
  parameter Integer n = 1 "旋翼编号";
  parameter Real b = 2.74e-7 "升力系数,N.s2";
  parameter Real d = 7.22e-9 "阻力系数,N.m.s2";
  Modelica.Blocks.Interfaces.RealOutput Force[3]
    annotation (
      Placement(transformation(origin = {110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput Torque[3]
    annotation (
      Placement(transformation(origin = {110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.ControlBus controlbus
    annotation (
      Placement(transformation(origin = {-100.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = -90.0)));
equation 
  Force = {0, b * controlbus.w[n] ^ 2, 0};
  Torque = {0, 0, d * controlbus.w[n] ^ 2};
end FM;