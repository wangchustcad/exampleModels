within SandTable.Components.Internals;
model WheelContactJointII

  Modelica.Mechanics.MultiBody.Joints.Spherical spherical(animation=false)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,70})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n={0,1,0}, animation=
       false) annotation (Placement(transformation(extent={{-60,50},{-40,70}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(animation=false,
      useAxisFlange=true)
    annotation (Placement(transformation(extent={{-90,70},{-70,50}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,80})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(
    useAxisFlange=true,
    animation=false,
    n={0,0,1}) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-20,60})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
    "Coordinate system fixed to the component with one cut-force and cut-torque"
    annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,100})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a axis_contact
    "1-dim. translational flange that drives the joint"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Translational.Sources.Force force
    annotation (Placement(transformation(extent={{-92,20},{-72,40}})));
  Modelica.Blocks.Interfaces.RealInput f_x "Driving force as input signal"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Sensors.AccSensor accSensor
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Interfaces.RealOutput a_z
    "Absolute velocity of flange as output signal" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-20})));
equation
  connect(prismatic2.frame_b,prismatic1. frame_a) annotation (Line(
      points={{-70,60},{-60,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixed.frame_b,prismatic2. frame_a) annotation (Line(
      points={{-90,70},{-90,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.frame_b,spherical. frame_b) annotation (Line(
      points={{-10,60},{-1.83697e-015,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic1.frame_b,prismatic. frame_a) annotation (Line(
      points={{-40,60},{-30,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(spherical.frame_a, frame_a) annotation (Line(
      points={{1.83697e-015,80},{0,80},{0,100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.axis, axis_contact) annotation (Line(
      points={{-12,54},{40,54},{40,0},{100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(force.flange, prismatic2.axis) annotation (Line(
      points={{-72,30},{-72,54}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(force.f, f_x) annotation (Line(
      points={{-94,30},{-100,30},{-100,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(accSensor.a, a_z) annotation (Line(
      points={{-19,30},{0,30},{0,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prismatic.axis, accSensor.flange) annotation (Line(
      points={{-12,54},{-12,40},{-40,40},{-40,30}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(graphics={
        Ellipse(
          extent={{-30,82},{30,22}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-60,40},{60,0}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-60,0},{88,0}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{0,52},{0,100}},
          color={0,0,0},
          smooth=Smooth.None),              Text(
          extent={{0,-20},{0,-40}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}));
end WheelContactJointII;
