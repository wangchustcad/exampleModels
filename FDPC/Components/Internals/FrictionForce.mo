within SandTable.Components.Internals;
model FrictionForce
  parameter Real table[:,2] = {{0,1},{1,1}};
  parameter Real tan_a = 0.25;

  parameter Boolean vib_act = false;
  parameter SI.Velocity v_ref = 0.3 "nominal velocity";
  Modelica.SIunits.Velocity va "velocity of flnage_a";
  Modelica.SIunits.Velocity vb "velocity of flnage_a";
  Modelica.SIunits.Velocity vd "relative velocity";

  Modelica.SIunits.Force f1 "friction force";
  Modelica.SIunits.Force f2 "friction force";

  Modelica.Blocks.Interfaces.RealInput mue "friction coefficient" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,60})));
  Modelica.Blocks.Interfaces.RealInput fz "normal force" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-60})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(table=table)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=vd)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Interfaces.IntegerInput thrust_mode "friction coefficient"
                                                                  annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,60})));
  Modelica.Blocks.Interfaces.RealOutput vib = vd/v_ref if vib_act "..."
                                                       annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,-60})));
equation
  va = der(flange_a.s);
  vb = der(flange_b.s);
  vd = vb - va;

  f1 = -noEvent(max(fz, 0) * combiTable1Ds.y[1]) * mue;
  f2 = noEvent(if thrust_mode == 1 then tan_a * fz else
       if thrust_mode == -1 then -tan_a * fz else 0);

  flange_a.f = f1 + f2;
  flange_b.f = -f1;

  connect(realExpression.y, combiTable1Ds.u) annotation (Line(
      points={{21,0},{38,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(graphics={
                                            Text(
          extent={{-80,-60},{-80,-100}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Text(
          extent={{-40,44},{-40,34}},
          lineColor={0,0,255},
          textString="mue",
          textStyle={TextStyle.Italic}),
        Text(
          extent={{0,-32},{0,-42}},
          lineColor={0,0,255},
          textString="fz",
          textStyle={TextStyle.Italic}),
        Polygon(
          points={{-70,30},{-70,10},{-56,10},{-46,0},{-36,10},{-26,0},{-16,10},
              {-6,0},{4,10},{4,30},{-70,30}},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{80,30},{80,10},{64,10},{54,0},{44,10},{34,0},{24,10},{14,0},
              {4,10},{4,30},{80,30}},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{74,20},{54,26},{54,22},{14,22},{14,18},{54,18},{54,14},{74,
              20}},
          smooth=Smooth.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-80,-30},{-80,-10},{-66,-10},{-56,0},{-46,-10},{-36,0},{-26,
              -10},{-16,0},{-6,-10},{-6,-30},{-80,-30}},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{68,-30},{68,-10},{54,-10},{44,0},{34,-10},{24,0},{14,-10},{4,
              0},{-6,-10},{-6,-30},{68,-30}},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-76,-20},{-56,-14},{-56,-18},{-16,-18},{-16,-22},{-56,-22},{
              -56,-26},{-76,-20}},
          smooth=Smooth.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Text(
          extent={{40,44},{40,34}},
          lineColor={255,128,0},
          textStyle={TextStyle.Italic},
          textString="thrust_mode")}));
end FrictionForce;
