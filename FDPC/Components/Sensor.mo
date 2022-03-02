within SandTable.Components;
model Sensor
  parameter Modelica.SIunits.Position fixed_x = 0;
  parameter Modelica.SIunits.Position fixed_y = 0;

  parameter Boolean ext_mode = false;
  parameter Boolean y_out = false;

  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_fore
    "Right flange of translational component" annotation (Placement(
        transformation(extent={{92,-10},{112,10}}), iconTransformation(extent={{90,-10},
            {110,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_rear
    "Left flange of translational component" annotation (Placement(
        transformation(extent={{-112,-10},{-92,10}}), iconTransformation(extent={{-110,
            -10},{-90,10}})));

  Modelica.Blocks.Interfaces.BooleanOutput y
    annotation (Placement(transformation(extent={{-10,90},{10,110}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,100})));
  Visualizers.Shape_X_Position shape_X_Position(
    shapeType="cylinder",
    lengthDirection={0,0,1},
    widthDirection={1,0,0},
    length=0.05,
    color={0,0,255},
    width=0.02,
    height=0.02,
    r_shape={0,0.1535 + fixed_y,0.04})
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Blocks.Sources.Constant const(k=fixed_x)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
equation
  flange_fore.f = 0;
  flange_rear.f = 0;
  y = if ext_mode then y_out else (fixed_x>(flange_rear.s+0.05)
                   and fixed_x<(flange_fore.s-0.05) and fixed_y<0.015 and fixed_y>-0.015);
  connect(const.y, shape_X_Position.input_x) annotation (Line(
      points={{-39,-10},{0,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={
        Ellipse(
          extent={{-4,38},{36,-2}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={175,175,175}),
        Ellipse(
          extent={{-8,34},{32,-6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={175,175,175}),
        Ellipse(
          extent={{-12,30},{28,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={175,175,175}),
        Ellipse(
          extent={{-16,26},{24,-14}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={175,175,175}),
        Polygon(
          points={{-42,-14},{-10,20},{18,-8},{-12,-40},{-42,-14}},
          smooth=Smooth.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-48,-8},{-8,-48}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),
        Polygon(
          points={{-54,-26},{-42,-14},{-38,-22},{-54,-26}},
          smooth=Smooth.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-30,-58},{-16,-44},{-20,-34},{-30,-58}},
          smooth=Smooth.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-60,-20},{-20,-60}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-54,-26},{-2,28}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-26,-54},{24,-2}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{32,30},{48,38},{44,66},{32,44},{34,84},{38,90},{40,82},{28,
              56},{22,52},{20.1367,61.316},{20,84},{22,92},{26,84},{14,60},{8,
              56},{6,64},{6,84},{0,98}},
          smooth=Smooth.Bezier,
          color={0,0,0}),
        Text(
          extent={{0,-100},{0,-140}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Text(
          extent={{0,-140},{0,-180}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="fixed = %fixed_x"),
        Text(
          extent={{-80,10},{-80,-10}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="R"),
        Text(
          extent={{80,10},{80,-10}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="F")}), Diagram(graphics));
end Sensor;
