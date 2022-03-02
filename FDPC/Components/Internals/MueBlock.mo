within SandTable.Components.Internals;
block MueBlock
  parameter Real mue_table[:,2] = {{-0.35,0},{-0.3,0},{-0.28,0.4},{0.28,0.4},{0.3,0},{0.35,0}};
  Modelica.Blocks.Interfaces.RealInput position_wheel_x
    annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  Modelica.Blocks.Interfaces.RealInput position_mass
    annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
  Modelica.Blocks.Interfaces.RealOutput mue
    annotation (Placement(transformation(extent={{90,30},{110,50}})));
  Modelica.Blocks.Interfaces.IntegerOutput thrust_mode
    annotation (Placement(transformation(extent={{90,-50},{110,-30}})));

protected
  Real r_rel;
algorithm
  r_rel :=position_wheel_x - position_mass;
  mue :=Modelica.Math.tempInterpol1(
    r_rel,
    mue_table,
    2);
  thrust_mode :=if r_rel > -0.35 and r_rel < -0.3 then -1 else if r_rel > 0.3
     and r_rel < 0.35 then 1 else 0;
  annotation (Diagram(graphics), Icon(graphics={
                                            Text(
          extent={{0,-60},{0,-100}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Text(
          extent={{-70,44},{-70,34}},
          lineColor={0,0,255},
          textString="w_x"),
        Text(
          extent={{-68,-36},{-68,-46}},
          lineColor={0,0,255},
          textString="flange"),
        Text(
          extent={{100,20},{100,10}},
          lineColor={0,0,255},
          textString="mue"),
        Polygon(
          points={{-80,0},{-60,8},{60,8},{80,0},{60,-8},{-60,-8},{-80,0}},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(
          points={{0,50},{0,-40}},
          color={0,0,0},
          smooth=Smooth.None),
        Text(
          extent={{12,46},{12,36}},
          lineColor={0,0,0},
          textString="mue",
          fontName="Times New Roman",
          textStyle={TextStyle.Italic}),
        Polygon(
          points={{0,60},{-2,50},{2,50},{0,60}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Line(
          points={{90,0},{-84,0}},
          color={0,0,0},
          smooth=Smooth.None),
        Polygon(
          points={{82,2},{82,-2},{90,0},{82,2}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{80,-2},{80,-12}},
          lineColor={0,0,0},
          textStyle={TextStyle.Italic},
          textString="x",
          fontName="Times New Roman"),
        Polygon(
          points={{-80,0},{-60,30},{60,30},{80,0},{60,-30},{-60,-30},{-80,0}},
          lineColor={0,0,255},
          smooth=Smooth.None)}));
end MueBlock;
