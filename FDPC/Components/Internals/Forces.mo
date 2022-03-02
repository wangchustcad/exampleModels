within SandTable.Components.Internals;
model Forces
    parameter SI.Position r0[3]={0,0,0}
    "Position vector from world frame to frame_b, resolved in world frame";
    parameter SI.Diameter D_d = 0.1 "diameter of drive wheel";
    parameter SI.Diameter D_f = 0.075 "diameter of follower wheel";
    parameter Real mue_d = 0.6;

    parameter SI.Height h_d = 0 "height of the drive wheel";
    parameter SI.Height h_f = 0 "height of the follower wheel";

    parameter SI.Angle phi = 0.005;

  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
    "Coordinate system fixed to the joint with one cut-force and cut-torque"
    annotation (Placement(transformation(extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,100})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
    "Coordinate system fixed to the joint with one cut-force and cut-torque"
    annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,-100})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_trans
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  NormalForceBlock normalForceBlock_f(R=D_f/2, phi=phi) if
                                                   (h_f < 0.015 and h_f > -0.015)
    annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
  Modelica.Blocks.Sources.RealExpression frame_b_x(y=frame_b.r_0[1])
    annotation (Placement(transformation(extent={{-86,34},{-66,54}})));
  NormalForceBlockVib
                   normalForceBlock_d(isDriveWheel=true, R=D_d/2,
    phi=phi) if                                                      (h_d < 0.015 and h_d > -0.015)
    annotation (Placement(transformation(extent={{-50,-30},{-30,-50}})));
  Modelica.Blocks.Sources.RealExpression frame_a_x(y=frame_a.r_0[1])
    annotation (Placement(transformation(extent={{-90,-54},{-70,-34}})));
  Modelica.Mechanics.Translational.Sources.Position position_f if
                                                                (h_f < 0.015 and h_f > -0.015)
    annotation (Placement(transformation(extent={{-12,34},{0,46}})));
  Modelica.Mechanics.Translational.Components.ElastoGap contact_Follower(       d=
        1e4, c=1e6) if
                (h_f < 0.015 and h_f > -0.015)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={20,80})));
  Modelica.Mechanics.Translational.Components.Mass mass_f(m=1) if
                                                                (h_f < 0.015 and h_f > -0.015)
    annotation (Placement(transformation(extent={{10,30},{30,50}})));
  Modelica.Mechanics.Translational.Sources.Position position_d if
                                                                 (h_d < 0.015 and h_d > -0.015)
    annotation (Placement(transformation(extent={{-20,-46},{-8,-34}})));
  Modelica.Mechanics.Translational.Components.Mass mass_d(m=1) if
                                                                 (h_d < 0.015 and h_d > -0.015)
    annotation (Placement(transformation(extent={{10,-50},{30,-30}})));
  Modelica.Mechanics.Translational.Components.ElastoGap contact_Drive(c=1e6, d=
        1e4) if
       (h_d < 0.015 and h_d > -0.015)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={20,-80})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_drive_wheel
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealGearR2T_d(ratio=2/
        D_d) if (h_d < 0.015 and h_d > -0.015)  annotation (Placement(transformation(extent={{100,-10},{80,-30}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  MueBlock mueBlock_d(mue_table=[-0.40,0; -0.35,0; -0.3,0.4; -0.29,0.4; -0.23,
        0.4; -0.22,0.2; -0.18,0.2; -0.17,0.4; -0.09,0.4; -0.08,0.2; 0.01,0.2;
        0.02,0.4; 0.12,0.4; 0.13,0.2; 0.22,0.2; 0.23,0.4; 0.3,0.4; 0.35,0; 0.40,
        0]) if                                            (h_d < 0.015 and h_d > -0.015)
    annotation (Placement(transformation(extent={{-50,2},{-30,-18}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor_d_1 if   (h_d < 0.015 and h_d > -0.015)
                                                                   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-50})));
  SandTable.Components.Internals.FrictionForce frictionForce_d(vib_act=true,
      table=[-0.1,-0.8; -0.005,-0.8; -0.0025,-1; 0,0; 0.0025,1; 0.005,0.8; 0.1,
        0.8]) if (h_d < 0.015 and h_d > -0.015)
    annotation (Placement(transformation(extent={{40,-30},{60,-10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_follow_wheel
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealGearR2T_f(ratio=-2/
        D_f) if (h_f < 0.015 and h_f > -0.015) annotation (Placement(transformation(extent={{100,10},{80,30}})));
  SandTable.Components.Internals.FrictionForce frictionForce_f(table=[-0.1,-0.5;
        -0.005,-0.5; -0.0025,-1; 0,0; 0.0025,1; 0.005,0.5; 0.1,0.5]) if (h_f <
    0.015 and h_f > -0.015)
    annotation (Placement(transformation(extent={{40,30},{60,10}})));
  MueBlock mueBlock_f if
                        (h_f < 0.015 and h_f > -0.015)
    annotation (Placement(transformation(extent={{-30,0},{-10,20}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor_f_1 if       (h_f < 0.015 and h_f > -0.015)
                                                                   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,54})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed3
    annotation (Placement(transformation(extent={{40,80},{60,100}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed2
    annotation (Placement(transformation(extent={{40,-100},{60,-80}})));
  MaxTorqueExt maxTorqueExt_d if
                               (h_d < 0.015 and h_d > -0.015)
    annotation (Placement(transformation(extent={{80,-90},{60,-70}})));
  MaxTorqueExt maxTorqueExt_f if
                                (h_f < 0.015 and h_f > -0.015)
    annotation (Placement(transformation(extent={{80,90},{60,70}})));
  Modelica.Mechanics.Rotational.Components.Damper damper_f(d=0.0005)
                                                                   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,90})));
  Modelica.Mechanics.Rotational.Components.Damper damper_d(d=0.0005)
                                                                    annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,-90})));
  WheelContactJointII                    wheelContactJoint_f    annotation (Placement(transformation(extent={{-60,60},{-20,100}})));
  WheelContactJointII                    wheelContactJoint_d    annotation (Placement(transformation(extent={{-60,-60},{-20,-100}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor_f_2 if       (h_f < 0.015 and h_f > -0.015)
                                                                   annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-94,20})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor_d_2 if       (h_f < 0.015 and h_f > -0.015)
                                                                   annotation (
      Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-86,-20})));
  Modelica.Blocks.Math.Gain gain(k=-1)
    annotation (Placement(transformation(extent={{-78,76},{-70,84}})));
  Modelica.Blocks.Math.Gain gain1(k=-1)
    annotation (Placement(transformation(extent={{-80,-84},{-72,-76}})));
  Modelica.Blocks.Interfaces.RealOutput a_z
    "Absolute velocity of flange as output signal"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Translational.Sources.Force force
    annotation (Placement(transformation(extent={{-40,-66},{-28,-54}})));
  RandomBlock randomBlock(samplePeriod=0.02,
    r_max=2,
    r_min=-2)
    annotation (Placement(transformation(extent={{-64,-66},{-52,-54}})));
equation
  connect(frame_a_x.y,normalForceBlock_d. position_wheel_x) annotation (Line(
      points={{-69,-44},{-50,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(frame_b_x.y,normalForceBlock_f. position_wheel_x) annotation (Line(
      points={{-65,44},{-50,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalForceBlock_f.h_min, position_f.s_ref)
                                                    annotation (Line(
      points={{-30,40},{-13.2,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(position_f.flange, mass_f.flange_a)
                                          annotation (Line(
      points={{0,40},{10,40}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(position_d.flange, mass_d.flange_a)
                                            annotation (Line(
      points={{-8,-40},{10,-40}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(flange_trans, positionSensor.flange) annotation (Line(
      points={{-100,0},{-90,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(positionSensor.s,normalForceBlock_f. position_mass) annotation (Line(
      points={{-69,0},{-60,0},{-60,36},{-50,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(positionSensor.s,normalForceBlock_d. position_mass) annotation (Line(
      points={{-69,0},{-60,0},{-60,-36},{-50,-36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flange_drive_wheel, idealGearR2T_d.flangeR)
                                                 annotation (Line(
      points={{100,-60},{100,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(positionSensor.s, mueBlock_d.position_mass)
                                                    annotation (Line(
      points={{-69,0},{-60,0},{-60,-4},{-50,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(frame_a_x.y, mueBlock_d.position_wheel_x)
                                                  annotation (Line(
      points={{-69,-44},{-54,-44},{-54,-12},{-50,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(contact_Drive.flange_b, forceSensor_d_1.flange_a)
                                                         annotation (Line(
      points={{30,-80},{40,-80},{40,-60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(forceSensor_d_1.flange_b, mass_d.flange_b)
                                                annotation (Line(
      points={{40,-40},{30,-40}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(frictionForce_d.flange_b, idealGearR2T_d.flangeT)
                                                          annotation (Line(
      points={{60,-20},{80,-20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(idealGearR2T_f.flangeR, flange_follow_wheel)
                                                      annotation (Line(
      points={{100,20},{100,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGearR2T_f.flangeT, frictionForce_f.flange_b)
                                                          annotation (Line(
      points={{80,20},{60,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(positionSensor.s, mueBlock_f.position_mass)
                                                     annotation (Line(
      points={{-69,0},{-60,0},{-60,6},{-30,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(frame_b_x.y, mueBlock_f.position_wheel_x)
                                                   annotation (Line(
      points={{-65,44},{-54,44},{-54,14},{-30,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mueBlock_f.mue, frictionForce_f.mue)
                                             annotation (Line(
      points={{-10,14},{46,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(forceSensor_f_1.flange_b, contact_Follower.flange_a)
                                                             annotation (Line(
      points={{40,64},{40,80},{30,80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(mass_f.flange_b, forceSensor_f_1.flange_a)
                                                annotation (Line(
      points={{30,40},{40,40},{40,44}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(fixed2.flange, maxTorqueExt_d.flange_b)
                                                annotation (Line(
      points={{50,-90},{50,-80},{60,-80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(maxTorqueExt_d.flange_a, flange_drive_wheel)
                                                     annotation (Line(
      points={{80,-80},{100,-80},{100,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(maxTorqueExt_d.fn, forceSensor_d_1.f) annotation (Line(
      points={{70,-70},{70,-58},{51,-58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fixed3.flange, maxTorqueExt_f.flange_b)
                                                 annotation (Line(
      points={{50,90},{60,90},{60,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(maxTorqueExt_f.flange_a, flange_follow_wheel)
                                                       annotation (Line(
      points={{80,80},{100,80},{100,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(forceSensor_f_1.f, maxTorqueExt_f.fn)     annotation (Line(
      points={{51,46},{70,46},{70,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(damper_d.flange_a, flange_drive_wheel)
                                                annotation (Line(
      points={{100,-90},{100,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(damper_d.flange_b, fixed2.flange)
                                           annotation (Line(
      points={{80,-90},{50,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(flange_follow_wheel, damper_f.flange_a)
                                                annotation (Line(
      points={{100,60},{100,90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(damper_f.flange_b, fixed3.flange)
                                          annotation (Line(
      points={{80,90},{50,90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(wheelContactJoint_f.axis_contact, contact_Follower.flange_b)
    annotation (Line(
      points={{-20,80},{10,80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(wheelContactJoint_f.frame_a, frame_b) annotation (Line(
      points={{-40,100},{0,100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(wheelContactJoint_d.frame_a, frame_a) annotation (Line(
      points={{-40,-100},{0,-100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(wheelContactJoint_d.axis_contact, contact_Drive.flange_a) annotation (
     Line(
      points={{-20,-80},{10,-80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(mueBlock_f.thrust_mode, frictionForce_f.thrust_mode) annotation (Line(
      points={{-10,6},{54,6},{54,14}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(mueBlock_d.thrust_mode, frictionForce_d.thrust_mode) annotation (Line(
      points={{-30,-4},{54,-4},{54,-14}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(forceSensor_f_2.flange_a, frictionForce_f.flange_a)
                                                             annotation (Line(
      points={{-88,20},{40,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(forceSensor_f_2.flange_b, flange_trans)
                                                 annotation (Line(
      points={{-100,20},{-100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(forceSensor_d_2.flange_a, frictionForce_d.flange_a)
                                                             annotation (Line(
      points={{-80,-20},{40,-20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(forceSensor_d_2.flange_b, flange_trans)
                                                 annotation (Line(
      points={{-92,-20},{-100,-20},{-100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(gain.y, wheelContactJoint_f.f_x) annotation (Line(
      points={{-69.6,80},{-60,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(forceSensor_f_2.f, gain.u) annotation (Line(
      points={{-89.2,26.6},{-89.2,80},{-78.8,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.y, wheelContactJoint_d.f_x) annotation (Line(
      points={{-71.6,-80},{-60,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(forceSensor_d_2.f, gain1.u) annotation (Line(
      points={{-81.2,-26.6},{-94,-26.6},{-94,-80},{-80.8,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(forceSensor_f_1.f, frictionForce_f.fz) annotation (Line(
      points={{51,46},{54,46},{54,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(forceSensor_d_1.f, frictionForce_d.fz) annotation (Line(
      points={{51,-58},{54,-58},{54,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalForceBlock_d.h_min, position_d.s_ref) annotation (Line(
      points={{-30,-40},{-21.2,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(frictionForce_d.vib, normalForceBlock_d.vib) annotation (Line(
      points={{46,-26},{46,-30},{-40,-30},{-40,-34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(wheelContactJoint_d.a_z, a_z) annotation (Line(
      points={{-40,-76},{-40,-70},{0,-70},{0,0},{100,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(force.flange, wheelContactJoint_d.axis_contact) annotation (Line(
      points={{-28,-60},{-20,-60},{-20,-80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(mueBlock_d.mue, frictionForce_d.mue) annotation (Line(
      points={{-30,-12},{46,-12},{46,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(randomBlock.y, force.f) annotation (Line(
      points={{-52,-60},{-41.2,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(graphics={Polygon(
          points={{-28,20},{32,20},{80,0},{32,-20},{-28,-20},{-80,0},{-28,20}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
                               Polygon(
          points={{0,80},{-10,60},{-2,60},{-2,30},{2,30},{2,60},{10,60},{0,80}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
                               Polygon(
          points={{0,-80},{-10,-60},{-2,-60},{-2,-30},{2,-30},{2,-60},{10,-60},
              {0,-80}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0}),             Text(
          extent={{0,-100},{0,-140}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Text(
          extent={{20,-68},{20,-80}},
          lineColor={0,0,255},
          textString="D"),     Polygon(
          points={{0,25},{10,5},{2,5},{2,-25},{-2,-25},{-2,5},{-10,5},{0,25}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          origin={36,29},
          rotation=-90),       Polygon(
          points={{0,-25},{-10,-5},{-2,-5},{-2,25},{2,25},{2,-5},{10,-5},{0,-25}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0},
          origin={-36,-29},
          rotation=-90)}));
end Forces;
