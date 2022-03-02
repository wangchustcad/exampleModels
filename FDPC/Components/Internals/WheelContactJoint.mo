within SandTable.Components.Internals;
model WheelContactJoint

  Modelica.Mechanics.MultiBody.Joints.Spherical spherical(animation=false)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,10})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n={0,1,0}, animation=
       false) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(animation=false)
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,20})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(
    useAxisFlange=true,
    animation=false,
    n={0,0,1}) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-20,0})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
    "Coordinate system fixed to the component with one cut-force and cut-torque"
    annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,100})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a axis_contact
    "1-dim. translational flange that drives the joint"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  connect(prismatic2.frame_b,prismatic1. frame_a) annotation (Line(
      points={{-70,0},{-60,0}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixed.frame_b,prismatic2. frame_a) annotation (Line(
      points={{-90,10},{-90,0}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.frame_b,spherical. frame_b) annotation (Line(
      points={{-10,-1.22465e-015},{-4,-1.22465e-015},{-4,0},{-1.83697e-015,0}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic1.frame_b,prismatic. frame_a) annotation (Line(
      points={{-40,0},{-36,0},{-36,1.22465e-015},{-30,1.22465e-015}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(spherical.frame_a, frame_a) annotation (Line(
      points={{1.83697e-015,20},{0,20},{0,100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.axis, axis_contact) annotation (Line(
      points={{-12,-6},{40,-6},{40,0},{100,0}},
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
          extent={{0,-20},{0,-60}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}));
end WheelContactJoint;
