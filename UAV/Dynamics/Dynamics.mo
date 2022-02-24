within UAV.Dynamics;
model Dynamics "动力学模型"
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Polygon(origin = {0.0, 0.0}, 
      lineColor = {165, 165, 165}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Sphere, 
      points = {{100.0, 100.0}, {60.0, 80.0}, {20.0, 40.0}, {10.0, 20.0}, {-10.0, 20.0}, {-20.0, 40.0}, {-60.0, 80.0}, {-100.0, 100.0}, {-80.0, 60.0}, {-40.0, 20.0}, {-20.0, 10.0}, {-20.0, -10.0}, {-40.0, -20.0}, {-80.0, -60.0}, {-100.0, -100.0}, {-60.0, -80.0}, {-20.0, -40.0}, {-10.0, -20.0}, {10.0, -20.0}, {20.0, -40.0}, {60.0, -80.0}, {100.0, -100.0}, {80.0, -60.0}, {40.0, -20.0}, {20.0, -10.0}, {20.0, 10.0}, {40.0, 20.0}, {80.0, 60.0}}), Text(origin = {0.0, 100.0}, 
      extent = {{-60.0, -20.0}, {60.0, 20.0}}, 
      textString = "%name", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.Bold}, 
      textColor = {0, 0, 128}), Text(origin = {140.0, 70.0}, 
      extent = {{-40.0, -30.0}, {40.0, 30.0}}, 
      textString = "frame_a1", 
      textStyle = {TextStyle.None}), Text(origin = {140.0, -70.0}, 
      extent = {{-40.0, -30.0}, {40.0, 30.0}}, 
      textString = "frame_a2", 
      textStyle = {TextStyle.None}), Text(origin = {-140.0, -70.0}, 
      extent = {{-40.0, -30.0}, {40.0, 30.0}}, 
      textString = "frame_a3", 
      textStyle = {TextStyle.None}), Text(origin = {-140.0, 70.0}, 
      extent = {{-40.0, -30.0}, {40.0, 30.0}}, 
      textString = "frame_a4", 
      textStyle = {TextStyle.None})}));
  parameter Real b = 2.74e-7 "升力系数,N.s2";
  parameter SI.Mass m = 0.0465 "质量";
  parameter SI.Acceleration g = 9.8 "重力加速度";
  parameter SI.AngularVelocity w0 = sqrt(m * g / (4 * b)) "参考转速";
  parameter SI.Inertia I_11 = 5.3e-5 "转动惯量";
  parameter SI.Inertia I_22 = 5.4e-5 "转动惯量";
  parameter SI.Inertia I_33 = 10.2e-5 "转动惯量";
  parameter SI.Inertia I_21 = 1e-7 "转动惯量";
  parameter SI.Inertia I_31 = 1e-7 "转动惯量";
  parameter SI.Inertia I_32 = 1e-7 "转动惯量";
  parameter SI.Position R = 0.062 "旋翼离质心距离";
  import pi = Modelica.Constants.pi;
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a1
    annotation (
      Placement(transformation(origin = {100.0, 100.0}, 
        extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a2
    annotation (
      Placement(transformation(origin = {100.0, -100.0}, 
        extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a3
    annotation (
      Placement(transformation(origin = {-100.0, -100.0}, 
        extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a4
    annotation (
      Placement(transformation(origin = {-100.0, 100.0}, 
        extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Interfaces.ControlBus controlbus
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(
    I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32, angles_fixed = false, animation = false)
    annotation (
      Placement(transformation(origin = {0.0, 70.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = 90.0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation1(r = {R, 0, 0}, 
    animation = false) annotation (
      Placement(transformation(origin = {70.0, 60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation2(r = {0, 0, R}, 
    animation = false) annotation (
      Placement(transformation(origin = {70.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation3(r = {-R, 0, 0}, 
    animation = false) annotation (
      Placement(transformation(origin = {-70.0, 20.0}, 
        extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation4(r = {0, 0, -R}, 
    animation = false) annotation (
      Placement(transformation(origin = {-70.0, 60.0}, 
        extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsolutePosition absoluteposition
    annotation (
      Placement(transformation(origin = {20.0, 30.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = -90.0)));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteAngles absoluteangles
    annotation (
      Placement(transformation(origin = {-20.0, 30.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        rotation = -90.0)));
  Controller.Components.Limit limit(N = 3, Limit = pi)
    annotation (
      Placement(transformation(origin = {-30.0, -10.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedshape(shapeType = "1", 
    length = 1 / 1000, width = 1 / 1000, height = 1 / 1000, 
    widthDirection = {0, -1, 0}, 
    extra = 1, 
    r_shape = {20 / 1000, 0, 257 / 1000}, 
    color = {255, 255, 0})annotation (Placement(transformation(origin = {30.0, 90.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedshape1(shapeType = "2", 
    length = 1 / 1000, width = 1 / 1000, height = 1 / 1000, 
    extra = 1, 
    color = {255, 0, 0})


    annotation (
      Placement(transformation(origin = {70.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation5(r = {0.230, 0, 0.230}, animation = false)
    annotation (
      Placement(transformation(origin = {10.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(
    useAxisFlange = true, 
    animation = false, 
    n = {0, 1, 0})


    annotation (
      Placement(transformation(origin = {40.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed1(
    exact = true, f_crit = 10000) annotation (
      
      Placement(transformation(origin = {30.0, -10.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedshape2(shapeType = "2", 
    length = 1 / 1000, width = 1 / 1000, height = 1 / 1000, 
    extra = 1, 
    color = {255, 0, 0})
    annotation (
      Placement(transformation(origin = {70.0, -100.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation6(r = {-0.230, 0, 0.230}, 
    animation = false)
    annotation (
      Placement(transformation(origin = {10.0, -100.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(
    useAxisFlange = true, 
    n = {0, 1, 0}, 
    animation = false)
    annotation (
      Placement(transformation(origin = {40.0, -100.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed2(
    exact = true, f_crit = 10000) annotation (
      Placement(transformation(origin = {30.0, -70.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedshape3(shapeType = "2", 
    length = 1 / 1000, width = 1 / 1000, height = 1 / 1000, 
    extra = 1, 
    color = {255, 0, 0})
    annotation (
      Placement(transformation(origin = {-18.0, -100.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation7(r = {-0.230, 0, -0.230}, 
    animation = false)
    annotation (
      Placement(transformation(origin = {-80.0, -100.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(
    useAxisFlange = true, 
    n = {0, 1, 0}, 
    animation = false)
    annotation (
      Placement(transformation(origin = {-48.0, -100.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed3(
    exact = true, f_crit = 10000) annotation (
      Placement(transformation(origin = {-58.0, -70.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedshape4(shapeType = "2", 
    length = 1 / 1000, width = 1 / 1000, height = 1 / 1000, 
    extra = 1, 
    color = {255, 0, 0})
    annotation (
      Placement(transformation(origin = {-20.0, -50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedtranslation8(r = {0.230, 0, -0.230}, 
    animation = false)
    annotation (
      Placement(transformation(origin = {-80.0, -50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute4(
    useAxisFlange = true, 
    n = {0, 1, 0}, 
    animation = false)
    annotation (
      Placement(transformation(origin = {-50.0, -50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed4(
    exact = true, f_crit = 10000) annotation (
      Placement(transformation(origin = {-60.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const(k = w0)
    annotation (Placement(transformation(origin = {-130.0, -50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed
    annotation (
      Placement(transformation(origin = {-50.0, 90.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical(animation = false)
    annotation (
      Placement(transformation(origin = {-20.0, 90.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(fixedtranslation1.frame_b, frame_a1)
    annotation (
      Line(origin = {80.0, 71.0}, 
        points = {{0.0, -11.0}, {20.0, -11.0}, {20.0, 29.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(body.frame_a, fixedtranslation2.frame_a)
    annotation (
      Line(origin = {20.0, 0.0}, 
        points = {{-20.0, 60.0}, {20.0, 60.0}, {20.0, 20.0}, {40.0, 20.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(fixedtranslation2.frame_b, frame_a2)
    annotation (
      Line(origin = {79.0, -70.0}, 
        points = {{1.0, 90.0}, {1.0, -30.0}, {21.0, -30.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(body.frame_a, fixedtranslation3.frame_a)
    annotation (
      Line(origin = {-20.0, 0.0}, 
        points = {{20.0, 60.0}, {-20.0, 60.0}, {-20.0, 20.0}, {-40.0, 20.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(fixedtranslation3.frame_b, frame_a3)
    annotation (
      Line(origin = {-80.0, -70.0}, 
        points = {{0.0, 90.0}, {-20.0, 90.0}, {-20.0, -30.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(body.frame_a, fixedtranslation4.frame_a)
    annotation (
      Line(origin = {-20.0, 40.0}, 
        points = {{20.0, 20.0}, {-40.0, 20.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(fixedtranslation4.frame_b, frame_a4)
    annotation (
      Line(origin = {-80.0, 70.0}, 
        points = {{0.0, -10.0}, {-20.0, -10.0}, {-20.0, 30.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(body.frame_a, absoluteangles.frame_a)
    annotation (Line(origin = {-10.0, 50.0}, 
      points = {{10.0, 10.0}, {10.0, -10.0}, {-10.0, -10.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(body.frame_a, absoluteposition.frame_a)
    annotation (Line(origin = {10.0, 50.0}, 
      points = {{-10.0, 10.0}, {-10.0, -10.0}, {10.0, -10.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(absoluteposition.r, controlbus.Position)
    annotation (Line(origin = {10.0, 10.0}, 
      points = {{10.0, 9.0}, {10.0, -10.0}, {-10.0, -10.0}}, 
      color = {0, 0, 127}));
  connect(limit.y, controlbus.Angle)
    annotation (
      Line(origin = {1.0, -15.0}, 
        points = {{-20.0, 5.0}, {-1.0, 5.0}, {-1.0, 15.0}}, 
        color = {0, 0, 127}));
  connect(body.frame_a, fixedshape.frame_a)
    annotation (
      Line(origin = {10.0, 74.0}, 
        points = {{-10.0, -14.0}, {10.0, -14.0}, {10.0, 16.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(absoluteangles.angles, limit.u)
    annotation (Line(origin = {-35.0, 5.0}, 
      points = {{15.0, 14.0}, {15.0, 5.0}, {-15.0, 5.0}, {-15.0, -15.0}, {-6.0, -15.0}}, 
      color = {0, 0, 127}));
  connect(fixedtranslation5.frame_b, revolute1.frame_a)
    annotation (
      Line(origin = {25.0, -50.0}, 
        points = {{-5.0, 10.0}, {5.0, 10.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(revolute1.frame_b, fixedshape1.frame_a)
    annotation (
      Line(origin = {55.0, -50.0}, 
        points = {{-5.0, 10.0}, {5.0, 10.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(revolute1.axis, speed1.flange)
    annotation (
      
      Line(origin = {40.0, -25.0}, 
        points = {{0.0, -5.0}, {0.0, 15.0}}));
  connect(fixedtranslation6.frame_b, revolute2.frame_a)
    annotation (
      Line(origin = {25.0, -110.0}, 
        points = {{-5.0, 10.0}, {5.0, 10.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(revolute2.frame_b, fixedshape2.frame_a)
    annotation (
      Line(origin = {55.0, -110.0}, 
        points = {{-5.0, 10.0}, {5.0, 10.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(revolute2.axis, speed2.flange)
    annotation (
      Line(origin = {40.0, -85.0}, 
        points = {{0.0, -5.0}, {0.0, 15.0}}));
  connect(fixedtranslation7.frame_b, revolute3.frame_a)
    annotation (
      Line(origin = {-63.0, -110.0}, 
        points = {{-7.0, 10.0}, {5.0, 10.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(revolute3.frame_b, fixedshape3.frame_a)
    annotation (
      Line(origin = {-33.0, -110.0}, 
        points = {{-5.0, 10.0}, {5.0, 10.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(revolute3.axis, speed3.flange)
    annotation (
      Line(origin = {-48.0, -85.0}, 
        points = {{0.0, -5.0}, {0.0, 15.0}}));
  connect(fixedtranslation8.frame_b, revolute4.frame_a)
    annotation (
      Line(origin = {-65.0, -60.0}, 
        points = {{-5.0, 10.0}, {5.0, 10.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(revolute4.frame_b, fixedshape4.frame_a)
    annotation (
      Line(origin = {-35.0, -60.0}, 
        points = {{-5.0, 10.0}, {5.0, 10.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(revolute4.axis, speed4.flange)
    annotation (
      Line(origin = {-50.0, -35.0}, 
        points = {{0.0, -5.0}, {0.0, 15.0}}));
  connect(body.frame_a, fixedtranslation8.frame_a)
    annotation (Line(origin = {-45.0, 5.0}, 
      points = {{45.0, 55.0}, {5.0, 55.0}, {5.0, 9.0}, {-45.0, 9.0}, {-45.0, -55.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedtranslation7.frame_a, fixedtranslation8.frame_a)
    annotation (
      Line(origin = {-82.0, -88.0}, 
        points = {{-8.0, -12.0}, {-8.0, 38.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(fixedtranslation8.frame_a, fixedtranslation5.frame_a)
    annotation (Line(origin = {-45.0, -42.0}, 
      points = {{-45.0, -8.0}, {-45.0, 8.0}, {45.0, 8.0}, {45.0, 2.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedtranslation6.frame_a, fixedtranslation5.frame_a)
    annotation (
      
      Line(origin = {-1.0, -70.0}, 
        points = {{1.0, -30.0}, {1.0, 30.0}}, 
        color = {95, 95, 95}, 
        thickness = 0.5));
  connect(fixedtranslation1.frame_a, body.frame_a)
    annotation (Line(origin = {30.0, 60.0}, 
      points = {{30.0, 0.0}, {-30.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(const.y, speed4.w_ref)
    annotation (Line(origin = {-96.0, -35.0}, 
      points = {{-23.0, -15.0}, {-14.0, -15.0}, {-14.0, 15.0}, {24.0, 15.0}}, 
      color = {0, 0, 127}));
  connect(const.y, speed1.w_ref)
    annotation (Line(origin = {-51.0, -30.0}, 
      points = {{-68.0, -20.0}, {-59.0, -20.0}, {-59.0, 2.0}, {69.0, 2.0}, {69.0, 20.0}}, 
      color = {0, 0, 127}));
  connect(const.y, speed3.w_ref)
    annotation (Line(origin = {-95.0, -60.0}, 
      points = {{-24.0, 10.0}, {-15.0, 10.0}, {-15.0, -10.0}, {25.0, -10.0}}, 
      color = {0, 0, 127}));
  connect(const.y, speed2.w_ref)
    annotation (Line(origin = {-51.0, -65.0}, 
      points = {{-68.0, 15.0}, {-59.0, 15.0}, {-59.0, -15.0}, {69.0, -15.0}, {69.0, -5.0}}, 
      color = {0, 0, 127}));
  connect(fixed.frame_b, spherical.frame_a)
    annotation (Line(origin = {-35.0, 90.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(spherical.frame_b, body.frame_a)
    annotation (Line(origin = {-5.0, 75.0}, 
      points = {{-5.0, 15.0}, {-5.0, -15.0}, {5.0, -15.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
end Dynamics;