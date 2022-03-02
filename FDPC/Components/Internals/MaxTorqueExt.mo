within SandTable.Components.Internals;
model MaxTorqueExt
  parameter SI.Torque t_max = 0.001 "maximum load";
  parameter SI.RotationalDampingConstant d = 0.0005;
  parameter SI.Force Normalized_Force(min = 1e-6) = 20 "Normalized Force";
  final parameter SI.AngularVelocity w_crit = t_max / d;

  Modelica.Mechanics.Rotational.Interfaces.Flange_a
           flange_a "Flange of left shaft"
                    annotation (Placement(transformation(extent={{-110,-8},{-90,
            12}},      rotation=0), iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b
           flange_b "Flange of right shaft"
                    annotation (Placement(transformation(extent={{90,-8},{110,12}},
                      rotation=0), iconTransformation(extent={{90,-10},{110,10}})));

  SI.AngularVelocity w_a;
  SI.AngularVelocity w_b;
  SI.AngularVelocity w_d;
  SI.Torque t;

  Modelica.Blocks.Interfaces.RealInput fn annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,100})));
equation
  w_a =  der(flange_a.phi);
  w_b =  der(flange_b.phi);

  w_d = w_b - w_a;
  t = fn / Normalized_Force * noEvent(if w_d < -w_crit then -t_max else
      if w_d < w_crit then d * w_d else t_max);

  flange_b.tau = t;
  flange_a.tau + flange_b.tau = 0;
  annotation (Icon(graphics={
        Line(
          points={{-100,0},{-48,0}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{48,0},{100,0}},
          color={0,0,0},
          smooth=Smooth.None),
        Rectangle(
          extent={{-40,60},{-32,-60}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{32,60},{40,-60}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{0,-100},{0,-140}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Rectangle(
          extent={{-24,62},{24,-62}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),   Text(
          extent={{0,-60},{0,-100}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}), Diagram(graphics));
end MaxTorqueExt;
