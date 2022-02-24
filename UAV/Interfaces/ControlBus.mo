within UAV.Interfaces;
expandable connector ControlBus "控制总线"
  extends Modelica.Icons.SignalBus;
  SI.Position Position[3] "位置";
  SI.Angle Angle[3] "姿态角";
  SI.AngularVelocity w[4] "转速";
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, 70.0}, 
      extent = {{-140.0, -30.0}, {140.0, 30.0}}, 
      textString = "%name", 
      textStyle = {TextStyle.None})}));
end ControlBus;