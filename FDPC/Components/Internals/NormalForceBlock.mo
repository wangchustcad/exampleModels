within SandTable.Components.Internals;
block NormalForceBlock

  parameter SI.Angle phi = 0.005;

  parameter Boolean isDriveWheel = false;
  parameter SI.Radius R = 0.0375 "radius of wheel";
  parameter SI.Length L0 = 0.580 "length of slinding mass";
  parameter SI.Length L1 = 0.060 "length of wedge";
  parameter SI.Length H0 = 0.030 "thickness of slinding mass";
  final parameter SI.Length H1 = H0/2 "half of the thickness of slinding mass";

  parameter Real sin_a = 13.06/53.85;
  parameter Real cos_a = 52.24/53.85;
  parameter Real tan_a = 13.06/52.24;

  parameter Real c(final unit="N/m", final min=0, start=1) = 1e5
    "Spring constant";
  parameter Real d(final unit="N/ (m/s)", final min=0, start=1) = 1e4
    "Damping constant";
  parameter Real n(final min=1) = 1
    "Exponent of spring force ( f_c = -c*|s_rel-s_rel0|^n )";

  final parameter SI.Length L2 = L0 / 2;

  Modelica.Blocks.Interfaces.RealInput position_wheel_x
    annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  Modelica.Blocks.Interfaces.RealInput position_mass
    annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));

  Modelica.Blocks.Interfaces.RealOutput h_min
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

protected
  SI.Position r_rel_abs;
  SI.Position r_rel;
  SI.Length h_offset;

algorithm
  r_rel := position_wheel_x - position_mass;
  r_rel_abs := noEvent(abs(position_wheel_x - position_mass)) - L2;

  h_offset := if r_rel > -L2-L1 and r_rel < L2+L1 then -sin(phi)*r_rel else 0;

  h_min := if r_rel_abs > L1 then R/cos_a else
          if r_rel_abs > R*sin_a then R/cos_a + (L1 - r_rel_abs)/4 else
          if r_rel_abs > 0 then H1 + sqrt(noEvent(abs(R^2 - r_rel_abs^2))) else H1 + R;

  if isDriveWheel then
    h_min :=-h_min;
  end if;

  h_min := smooth(2, h_min + h_offset);

  annotation (Diagram(graphics), Icon(graphics={Rectangle(extent={{-100,62},{
              100,-60}},
                      lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),   Text(
          extent={{0,-100},{0,-140}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Text(
          extent={{-70,46},{-70,36}},
          lineColor={0,0,255},
          textString="w_x"),
        Text(
          extent={{-70,-36},{-70,-46}},
          lineColor={0,0,255},
          textString="flange"),
        Text(
          extent={{72,6},{72,-4}},
          lineColor={0,0,255},
          textString="z",
          textStyle={TextStyle.Italic})}));
end NormalForceBlock;
