within UAV.Controller;
model Controller "控制器"
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, 130.0}, 
      extent = {{-100.0, -30.0}, {100.0, 30.0}}, 
      textString = "%name", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.Bold}), Polygon(origin = {0.0, -60.0}, 
      lineColor = {135, 135, 135}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      points = {{-60.0, 20.0}, {100.0, 20.0}, {60.0, -20.0}, {-100.0, -20.0}}), Rectangle(origin = {-20.0, -90.0}, 
      lineColor = {100, 100, 100}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-80.0, -10.0}, {80.0, 10.0}}), Polygon(origin = {80.0, -70.0}, 
      lineColor = {100, 100, 100}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      points = {{20.0, 10.0}, {-20.0, -30.0}, {-20.0, -10.0}, {20.0, 30.0}}), Rectangle(origin = {0.0, -10.0}, 
      lineColor = {135, 135, 135}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.VerticalCylinder, 
      extent = {{-10.0, -50.0}, {10.0, 50.0}}), Ellipse(origin = {0.0, 42.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Sphere, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}})}));
  parameter Real table_gamma[:,:] = {{0, 0}, {100, 0}} "gamma指令" annotation (Dialog(group = "姿态指令"));
  parameter Real table_pesi[:,:] = {{0, 0}, {100, 0}} "pesi指令" annotation (Dialog(group = "姿态指令"));
  parameter Real table_phi[:,:] = {{0, 0}, {5, pi / 4}, {6, pi / 4}, {10, 0}} "phi指令" annotation (Dialog(group = "姿态指令"));
  parameter Real b = 2.74e-7 "升力系数,N.s2";
  parameter SI.Mass m = 0.0465 "质量";
  parameter SI.Acceleration g = 9.81 "重力加速度";
  parameter SI.AngularVelocity w0 = sqrt(m * g / (4 * b)) "参考转速";
  parameter Real kp_gamma = 1 annotation (Dialog(group = "gamma"));
  parameter Real ki_gamma = 1 annotation (Dialog(group = "gamma"));
  parameter Real kd_gamma = 1 annotation (Dialog(group = "gamma"));
  parameter Real kp_pesi = 1 annotation (Dialog(group = "pesi"));
  parameter Real ki_pesi = 1 annotation (Dialog(group = "pesi"));
  parameter Real kd_pesi = 1 annotation (Dialog(group = "pesi"));
  parameter Real kp_phi = 10 annotation (Dialog(group = "phi"));
  parameter Real ki_phi = 1 annotation (Dialog(group = "phi"));
  parameter Real kd_phi = 10 annotation (Dialog(group = "phi"));
  import pi = Modelica.Constants.pi;
  Interfaces.ControlBus controlbus "控制总线" 
    annotation (
      Placement(transformation(origin = {-100.0, -100.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = 90.0)));
  Modelica.Blocks.Sources.TimeTable timetable_gamma(table = table_gamma)
    annotation (
      Placement(transformation(origin = {-80.0, 50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timetable_pesi(table = table_pesi)
    annotation (
      Placement(transformation(origin = {-80.0, 10.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timetable_phi(table = table_phi)
    annotation (
      Placement(transformation(origin = {-80.0, -30.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Feedback feedback_gamma
    annotation (
      Placement(transformation(origin = {-50.0, 50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Feedback feedback_pesi
    annotation (
      Placement(transformation(origin = {-50.0, 10.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Feedback feedback_phi
    annotation (
      Placement(transformation(origin = {-50.0, -30.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.InstructionDispatch instruction_gamma(k3 = 0, k2 = -1, k4 = 1, k1 = 0)
    annotation (
      Placement(transformation(origin = {10.0, 50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.InstructionDispatch instruction_pesi(k1 = -1, k2 = 1, k3 = -1, k4 = 1)
    annotation (
      Placement(transformation(origin = {10.0, 10.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.InstructionDispatch instruction_phi(k1 = 1, k3 = -1, k2 = 0, k4 = 0)
    annotation (
      Placement(transformation(origin = {10.0, -30.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.PID pid_gamma(kp = kp_gamma, ki = ki_gamma, kd = kd_gamma)
    annotation (
      Placement(transformation(origin = {-20.0, 50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.PID pid_pesi(kp = kp_pesi, ki = ki_pesi, kd = kd_pesi)
    annotation (
      Placement(transformation(origin = {-20.0, 10.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Components.PID pid_phi(kp = kp_phi, ki = ki_phi, kd = kd_phi)
    annotation (
      Placement(transformation(origin = {-20.0, -30.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Add3 add3_w1
    annotation (Placement(transformation(origin = {90.0, 70.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Add3 add3_w2
    annotation (
      Placement(transformation(origin = {90.0, 30.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Add3 add3_w3
    annotation (
      Placement(transformation(origin = {90.0, -10.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Add3 add3_w4
    annotation (
      Placement(transformation(origin = {90.0, -50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  // w[1] = sqrt(max(1e-6, add3_w1.y));
  // w[2] = sqrt(max(1e-6, add3_w2.y));
  // w[3] = sqrt(max(1e-6, add3_w3.y));
  // w[4] = sqrt(max(1e-6, add3_w4.y));
  //controlbus.w = {transw1.y, transw2.y, transw3.y, transw4.y} + ones(4) * w0;
  controlbus.w = {add3_w1.y, add3_w2.y, add3_w3.y, add3_w4.y} + ones(4) * w0;
  connect(timetable_gamma.y, feedback_gamma.u1)
    annotation (
      Line(origin = {-49.0, 50.0}, 
        points = {{-20.0, 0.0}, {-9.0, 0.0}}, 
        color = {0, 0, 127}));
  connect(timetable_pesi.y, feedback_pesi.u1)
    annotation (
      Line(origin = {-49.0, 10.0}, 
        points = {{-20.0, 0.0}, {-9.0, 0.0}}, 
        color = {0, 0, 127}));
  connect(timetable_phi.y, feedback_phi.u1)
    annotation (
      Line(origin = {-49.0, -30.0}, 
        points = {{-20.0, 0.0}, {-9.0, 0.0}}, 
        color = {0, 0, 127}));
  connect(controlbus.Angle[1], feedback_gamma.u2)
    annotation (
      Line(origin = {-65.0, -29.0}, 
        points = {{-35.0, -71.0}, {-35.0, 59.0}, {15.0, 59.0}, {15.0, 71.0}}));
  connect(controlbus.Angle[2], feedback_pesi.u2)
    annotation (
      Line(origin = {-65.0, -49.0}, 
        points = {{-35.0, -51.0}, {-35.0, 39.0}, {15.0, 39.0}, {15.0, 51.0}}));
  connect(controlbus.Angle[3], feedback_phi.u2)
    annotation (
      Line(origin = {-65.0, -69.0}, 
        points = {{-35.0, -31.0}, {-35.0, 19.0}, {15.0, 19.0}, {15.0, 31.0}}));
  connect(feedback_gamma.y, pid_gamma.u)
    annotation (
      Line(origin = {-11.0, 50.0}, 
        points = {{-30.0, 0.0}, {-20.0, 0.0}}, 
        color = {0, 0, 127}));
  connect(pid_gamma.y, instruction_gamma.u)
    annotation (
      Line(origin = {30.0, 50.0}, 
        points = {{-39.0, 0.0}, {-32.0, 0.0}}, 
        color = {0, 0, 127}));
  connect(feedback_pesi.y, pid_pesi.u)
    annotation (
      Line(origin = {-11.0, 10.0}, 
        points = {{-30.0, 0.0}, {-20.0, 0.0}}, 
        color = {0, 0, 127}));
  connect(pid_pesi.y, instruction_pesi.u)
    annotation (
      Line(origin = {30.0, 10.0}, 
        points = {{-39.0, 0.0}, {-32.0, 0.0}}, 
        color = {0, 0, 127}));
  connect(feedback_phi.y, pid_phi.u)
    annotation (
      Line(origin = {-11.0, -30.0}, 
        points = {{-30.0, 0.0}, {-20.0, 0.0}}, 
        color = {0, 0, 127}));
  connect(pid_phi.y, instruction_phi.u)
    annotation (
      Line(origin = {30.0, -30.0}, 
        points = {{-39.0, 0.0}, {-32.0, 0.0}}, 
        color = {0, 0, 127}));
  connect(instruction_gamma.y1, add3_w1.u1)
    annotation (
      Line(origin = {70.0, 67.0}, 
        points = {{-49.0, -11.0}, {-44.0, -11.0}, {-44.0, 11.0}, {8.0, 11.0}}, 
        color = {0, 0, 127}));
  connect(instruction_pesi.y1, add3_w1.u2)
    annotation (
      Line(origin = {70.0, 43.0}, 
        points = {{-49.0, -27.0}, {-40.0, -27.0}, {-40.0, 27.0}, {8.0, 27.0}}, 
        color = {0, 0, 127}));
  connect(instruction_phi.y1, add3_w1.u3)
    annotation (
      Line(origin = {70.0, 19.0}, 
        points = {{-49.0, -43.0}, {-36.0, -43.0}, {-36.0, 43.0}, {8.0, 43.0}}, 
        color = {0, 0, 127}));
  connect(instruction_gamma.y2, add3_w2.u1)
    annotation (Line(origin = {50.0, 45.0}, 
      points = {{-29.0, 7.0}, {-12.0, 7.0}, {-12.0, -7.0}, {28.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(instruction_pesi.y2, add3_w2.u2)
    annotation (Line(origin = {50.0, 21.0}, 
      points = {{-29.0, -9.0}, {-12.0, -9.0}, {-12.0, 9.0}, {28.0, 9.0}}, 
      color = {0, 0, 127}));
  connect(instruction_phi.y2, add3_w2.u3)
    annotation (
      Line(origin = {50.0, -3.0}, 
        points = {{-29.0, -25.0}, {-8.0, -25.0}, {-8.0, 25.0}, {28.0, 25.0}}, 
        color = {0, 0, 127}));
  connect(instruction_gamma.y3, add3_w3.u1)
    annotation (
      Line(origin = {50.0, 23.0}, 
        points = {{-29.0, 25.0}, {0.0, 25.0}, {0.0, -25.0}, {28.0, -25.0}}, 
        color = {0, 0, 127}));
  connect(instruction_pesi.y3, add3_w3.u2)
    annotation (
      Line(origin = {50.0, -1.0}, 
        points = {{-29.0, 9.0}, {-4.0, 9.0}, {-4.0, -9.0}, {28.0, -9.0}}, 
        color = {0, 0, 127}));
  connect(instruction_phi.y3, add3_w3.u3)
    annotation (Line(origin = {50.0, -25.0}, 
      points = {{-29.0, -7.0}, {-4.0, -7.0}, {-4.0, 7.0}, {28.0, 7.0}}, 
      color = {0, 0, 127}));
  connect(instruction_gamma.y4, add3_w4.u1)
    annotation (
      Line(origin = {50.0, 1.0}, 
        points = {{-29.0, 43.0}, {18.0, 43.0}, {18.0, -43.0}, {28.0, -43.0}}, 
        color = {0, 0, 127}));
  connect(instruction_pesi.y4, add3_w4.u2)
    annotation (Line(origin = {50.0, -23.0}, 
      points = {{-29.0, 27.0}, {14.0, 27.0}, {14.0, -27.0}, {28.0, -27.0}}, 
      color = {0, 0, 127}));
  connect(instruction_phi.y4, add3_w4.u3)
    annotation (Line(origin = {50.0, -47.0}, 
      points = {{-29.0, 11.0}, {10.0, 11.0}, {10.0, -11.0}, {28.0, -11.0}}, 
      color = {0, 0, 127}));
end Controller;