within SandTable.Components;
model Mounting
    parameter SI.Position r0[3]={0.699,0.085,-0.112}
    "Position vector from world frame to frame_b, resolved in world frame";
        parameter SI.Diameter D_d = 0.1 "diameter of drive wheel";
    parameter SI.Diameter D_f = 0.075 "diameter of follower wheel";

    parameter SI.TranslationalSpringConstant k1(final min=0, start = 613) = 613
    "Dpring constant";
         parameter SI.TranslationalSpringConstant k2(final min=0, start = 3500) = 3500
    "Dpring constant";

    parameter SI.Angle phi = 0.005;

    parameter Real mue_d = 0.6;
    parameter SI.Height h_d = 0 "height of the drive wheel";
    parameter SI.Height h_f = 0 "height of the follower wheel";
    parameter Boolean vib_act = false;
    parameter Boolean acc_mea = false;

  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r=r0, animation=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,-90})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n={0,1,0}, animation=false)
    annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r={0.033,
        0,0.05}, animation=false)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,-20})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(
    animateSphere=false,
    r={-0.1025,0,0},
    shapeType="106",
    length=1,
    width=1,
    height=1,
    extra=1,
    lengthDirection={0,0,-1},
    r_shape={-0.44429,-0.068,0.11441},
    m=0.335868431*7.9,
    r_CM={-0.0795,-0.02,0.044},
    color={230,230,230})
         annotation (Placement(transformation(extent={{-48,-70},{-28,-50}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute shaft2(n={0,1,0}, animation=false,
    useAxisFlange=true)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(
    animateSphere=false,
    shapeType="110",
    length=1,
    width=1,
    height=1,
    extra=1,
    lengthDirection={1,0,0},
    widthDirection={0,1,0},
    r_shape={-0.0375,-0.0125,-0.0375},
    r={0,0,0},
    r_CM={0,0,0},
    m=0.18,
    I_11=0.000080,
    I_22=0.000140,
    I_33=0.000080,
    color={230,230,230})
         annotation (Placement(transformation(extent={{30,50},{50,70}})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(
    animateSphere=false,
    shapeType="107",
    lengthDirection={0,0,-1},
    length=1,
    width=1,
    height=1,
    extra=1,
    r_shape={-0.44429 + 0.1025,-0.068,0.11441},
    r_CM={-0.055,0.0385,0.017},
    m=3,
    I_11=0.0045,
    I_22=0.0052,
    I_33=0.0046,
    color={230,230,230},
    r={-0.065,0.0685 + h_d,0.047})
         annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(n={0,1,0}, animation=false)
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape4(
    animateSphere=false,
    extra=1,
    length=1,
    width=1,
    height=1,
    lengthDirection={1,0,0},
    widthDirection={0,0,1},
    shapeType="108",
    r_shape={-0.05,0.0125,-0.05},
    color={220,220,220},
    r={0,0,0},
    r_CM={0,0,0},
    m=0.116531*7.9,
    I_11=7.9*0.000095,
    I_22=7.9*0.000176,
    I_33=7.9*0.000095)
             annotation (Placement(transformation(extent={{40,-20},{60,0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a axis
    "1-dim. rotational flange that drives the joint"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r={-0.0325,
        0,0.05}, animation=false)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-20})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(
                  animation=false, r={-0.0795,0,0.044})
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-20})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r={-0.0075,
        0,0.044}, animation=false)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-30})));
  Internals.SpringWithStopI springWithStopI(k=k1)
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Internals.SpringWithStopII springWithStopII(k=k2)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r={-0.045,
        0,0}) annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    "Left flange of translational component" annotation (Placement(
        transformation(extent={{-10,90},{10,110}}), iconTransformation(extent={{
            -10,90},{10,110}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(
    shapeType="109",
    length=1,
    width=1,
    height=1,
    extra=1,
    lengthDirection={0,-1,0},
    widthDirection={1,0,0},
    color={100,100,100},
    r_shape={-0.005,0.025,-0.005})
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape1(
    length=1,
    width=1,
    height=1,
    extra=1,
    lengthDirection={0,-1,0},
    widthDirection={1,0,0},
    shapeType="111",
    color={100,100,100},
    r_shape={-0.016,0.0125,-0.016})
    annotation (Placement(transformation(extent={{30,70},{50,90}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(
      animation=false, r={-0.1675,0.0685 + h_f,0.1645})
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  SandTable.Components.Internals.Forces forces(
    r0=r0,
    D_d=D_d,
    D_f=D_f,
    h_d=h_d,
    h_f=h_f,
    mue_d=mue_d,
    phi=phi)
    annotation (Placement(transformation(extent={{20,22},{40,42}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute shaft1(
    n={0,1,0},
    animation=false,
    useAxisFlange=true)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=90,
        origin={40,-40})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape2(
    extra=1,
    lengthDirection={0,-1,0},
    widthDirection={1,0,0},
    color={100,100,100},
    shapeType="cylinder",
    width=0.015,
    height=0.015,
    r_shape={0,0.012,0},
    length=h_f)
    annotation (Placement(transformation(extent={{70,70},{90,90}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape3(
    extra=1,
    lengthDirection={0,-1,0},
    widthDirection={1,0,0},
    color={100,100,100},
    shapeType="cylinder",
    length=0.015 + h_d,
    width=0.01,
    height=0.01,
    r_shape={0,0.013,0})
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation6(r={-0.07,
        -0.0685,-0.05}) if vib_act
    annotation (Placement(transformation(extent={{40,-70},{60,-50}})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(
    animateSphere=false,
    extra=1,
    m=3,
    color={230,230,230},
    shapeType="box",
    widthDirection={1,0,0},
    length=0.04,
    width=0.03,
    height=0.03,
    r_CM={0,-0.02,0},
    lengthDirection={0,-1,0},
    r={0,0,0}) if vib_act
         annotation (Placement(transformation(extent={{70,-70},{90,-50}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true,
      animation=false,
    n={0,1,0}) if         vib_act
    annotation (Placement(transformation(extent={{72,-70},{52,-90}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a vib_axis if                 vib_act
    "vibration_emachine_shaft"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape5(
    extra=1,
    color={230,230,230},
    shapeType="box",
    r_shape={-0.002,0,0},
    lengthDirection={0,1,0},
    widthDirection={1,0,0},
    length=0.005,
    width=0.01,
    height=0.005,
    animateSphere=true,
    r_CM={0.005,0,0},
    sphereDiameter=0.01,
    m=0.005) if             vib_act
         annotation (Placement(transformation(extent={{40,-90},{20,-70}})));
  Modelica.Blocks.Interfaces.RealOutput a_z(unit = "V") if acc_mea
    "Absolute velocity of flange as output signal" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,-60})));
  Modelica.Blocks.Math.Gain gain(k=0.01)
    annotation (Placement(transformation(extent={{72,26},{84,38}})));
equation

  connect(fixed.frame_b, revolute1.frame_a)
                                           annotation (Line(
      points={{-90,-80},{-90,-60},{-80,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation.frame_a, fixed.frame_b) annotation (Line(
      points={{-90,-30},{-90,-80}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revolute1.frame_b, bodyShape.frame_a)
                                               annotation (Line(
      points={{-60,-60},{-48,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(shaft2.frame_b, bodyShape2.frame_a)    annotation (Line(
      points={{10,60},{30,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(bodyShape.frame_b, revolute2.frame_a) annotation (Line(
      points={{-28,-60},{-20,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revolute2.frame_b, bodyShape3.frame_a) annotation (Line(
      points={{0,-60},{10,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation1.frame_a, revolute1.frame_b)
                                                       annotation (Line(
      points={{-60,-30},{-60,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation3.frame_a, revolute2.frame_b) annotation (Line(
      points={{10,-40},{10,-60},{0,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation.frame_b, springWithStopI.frame_a) annotation (Line(
      points={{-90,-10},{-90,10},{-80,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(springWithStopI.frame_b, fixedTranslation1.frame_b) annotation (Line(
      points={{-60,10},{-60,-10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(springWithStopII.frame_a, fixedTranslation3.frame_b) annotation (Line(
      points={{-10,0},{-10,-20},{10,-20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation4.frame_b, springWithStopII.frame_b) annotation (Line(
      points={{10,20},{10,0}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation4.frame_a, fixedTranslation2.frame_b) annotation (
      Line(
      points={{-10,20},{-30,20},{-30,-10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation2.frame_a, bodyShape.frame_a) annotation (Line(
      points={{-30,-30},{-48,-30},{-48,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedShape1.frame_a, bodyShape2.frame_a) annotation (Line(
      points={{30,80},{30,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation5.frame_b, shaft2.frame_a)    annotation (Line(
      points={{-20,60},{-10,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation5.frame_a, bodyShape.frame_a) annotation (Line(
      points={{-40,60},{-48,60},{-48,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(forces.frame_b, bodyShape2.frame_a)      annotation (Line(
      points={{30,42},{30,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(forces.frame_a, bodyShape4.frame_a)      annotation (Line(
      points={{30,22},{30,-10},{40,-10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedShape.frame_a, bodyShape4.frame_a) annotation (Line(
      points={{40,10},{40,-10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(bodyShape3.frame_b, shaft1.frame_a) annotation (Line(
      points={{30,-60},{40,-60},{40,-50}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(shaft1.frame_b, bodyShape4.frame_a) annotation (Line(
      points={{40,-30},{40,-10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flange_a, forces.flange_trans)      annotation (Line(
      points={{0,100},{20,100},{20,32}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(shaft1.axis, axis) annotation (Line(
      points={{50,-40},{92,-40},{92,-100},{0,-100}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(forces.flange_drive_wheel, shaft1.axis) annotation (Line(
      points={{40,26},{92,26},{92,-40},{50,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(shaft2.axis, forces.flange_follow_wheel) annotation (Line(
      points={{0,70},{0,92},{60,92},{60,38},{40,38}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(fixedShape2.frame_a, fixedShape1.frame_a) annotation (Line(
      points={{70,80},{30,80}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedShape3.frame_a, fixedShape.frame_a) annotation (Line(
      points={{60,10},{40,10}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation6.frame_a, bodyShape3.frame_b) annotation (Line(
      points={{40,-60},{30,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixedTranslation6.frame_b, bodyShape1.frame_a) annotation (Line(
      points={{60,-60},{70,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(bodyShape1.frame_b, revolute.frame_a) annotation (Line(
      points={{90,-60},{90,-80},{72,-80}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revolute.axis, vib_axis)                 annotation (Line(
      points={{62,-90},{62,-96},{94,-96},{94,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bodyShape5.frame_a, revolute.frame_b) annotation (Line(
      points={{40,-80},{52,-80}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(forces.a_z, gain.u) annotation (Line(
      points={{40,32},{70.8,32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, a_z) annotation (Line(
      points={{84.6,32},{108,32},{108,-60},{100,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={
        Ellipse(
          extent={{28,10},{90,-52}},
          lineColor={95,95,95},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{32,6},{86,-48}},
          lineColor={95,95,95},
          fillColor={215,215,215},
          fillPattern=FillPattern.Sphere),
        Ellipse(extent={{-64,-36},{-56,-44}}, lineColor={0,0,0}),
        Line(
          points={{-56,-40},{-4,-40}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Ellipse(
          extent={{44,66},{76,34}},
          lineColor={95,95,95},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(extent={{-4,-36},{4,-44}}, lineColor={0,0,0}),
        Line(
          points={{0,-40},{40,-60},{60,-20}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{8,-44},{18,-24}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{16,-28},{18,-32},{20,-24},{22,-32},{24,-24},{26,-32},{28,-24},
              {30,-32},{32,-24},{34,-32},{36,-26}},
          color={255,0,0},
          smooth=Smooth.None),
        Line(
          points={{-36,-20},{-36,-40}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{-72,-18},{-72,-32}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-72,-20},{-70,-28},{-68,-20},{-66,-28},{-64,-20},{-62,-28},{-60,
              -20},{-58,-28},{-56,-20},{-54,-28},{-52,-20},{-50,-28},{-48,-20},{
              -46,-28},{-44,-20},{-42,-28},{-40,-20},{-38,-28},{-36,-20}},
          color={255,0,0},
          smooth=Smooth.None),
        Line(
          points={{-30,-40},{60,50}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Ellipse(
          extent={{58,52},{62,48}},
          lineColor={95,95,95},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{58,-18},{62,-22}},
          lineColor={95,95,95},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-6,-40},{-6,-22},{36,-22},{36,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None),
        Line(
          points={{-62,-44},{-64,-48}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-56,-48},{-58,-44}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-54,-48},{-66,-48}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-64,-48},{-66,-50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-60,-48},{-62,-50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-56,-48},{-58,-50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-72,-28},{-74,-30}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-72,-24},{-74,-26}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-72,-20},{-74,-22}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-72,-24},{-36,-24}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{16,-28},{36,-28}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Text(
          extent={{-60,-54},{-60,-60}},
          lineColor={0,0,255},
          textString="fixed = %r0"),
        Line(
          points={{-6,42},{34,42},{74,22},{34,2},{-6,2}},
          color={0,0,255},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),        Text(
          extent={{-100,100},{-100,60}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          textString="%name")}),   Diagram(graphics={
        Text(
          extent={{-20,26},{18,20}},
          lineColor={255,0,0},
          textString="{-0.05,0,0}??"), Text(
          extent={{50,-20},{50,-26}},
          lineColor={0,0,0},
          textString="animation shape for stl: {-0.05,0.0125,-0.05}")}));
end Mounting;
