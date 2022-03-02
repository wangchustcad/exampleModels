within SandTable.Components.Internals;
model MaxTorque
  parameter SI.Torque t_max = 1 "maximum load";
  parameter SI.AngularVelocity w_small = 1e-5;
  final parameter SI.RotationalDampingConstant d = t_max/w_small;
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

equation
  w_a =  der(flange_a.phi);
  w_b =  der(flange_b.phi);
  w_d = w_b - w_a;
  t = noEvent(if w_d < -w_small then -t_max else
      if w_d < w_small then d * w_d else t_max);

  flange_b.tau = t;
  flange_a.tau + flange_b.tau = 0;
  annotation (Icon(graphics={
        Line(
          points={{-100,0},{-48,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{48,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Rectangle(
          extent={{-40,66},{-32,-64}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{32,64},{40,-64}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-70,-48},{-12,56},{10,-40},{76,60}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=1),
        Text(
          extent={{0,-100},{0,-140}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          textString="%name")}));
end MaxTorque;
