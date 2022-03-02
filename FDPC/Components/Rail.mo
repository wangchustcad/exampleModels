within SandTable.Components;
model Rail

  Visualizers.Shape_X_Position Mount(
    color={155,155,155},
    extra=1,
    lengthDirection={0,0,-1},
    shapeType="101",
    r_shape={0.255,0.02,0.00241})
    annotation (Placement(transformation(extent={{-50,-70},{-30,-50}})));
  Modelica.Blocks.Sources.Constant realExpression(k=0)
    annotation (Placement(transformation(extent={{-100,-70},{-80,-50}})));
  Visualizers.Shape_X_Position support_shape(
    color={100,100,100},
    shapeType="102",
    length=1,
    width=1,
    height=1,
    extra=1,
    lengthDirection={0,0,1},
    r_shape={0.042,0.09845,-0.024})
                annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    "Left flange of translational component"
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Mechanics.Translational.Components.Mass support_mass(m=0.79 + 0.166)
    annotation (Placement(transformation(extent={{0,-30},{20,-10}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{-70,-30},{-50,-10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_fore
    "Right flange of translational component"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_rear
    "Left flange of translational component"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Components.Rod rod(L=2)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Visualizers.Shape_X_Position Mount1(
    color={155,155,155},
    extra=1,
    lengthDirection={0,0,-1},
    r_shape={0,0,0.138},
    animation=false,
    shapeType="100.stl")
    annotation (Placement(transformation(extent={{-50,-96},{-30,-76}})));
  Modelica.Mechanics.Translational.Components.SupportFriction supportFriction(peak=1.1,
      f_pos=[0,4.5; 1,4.5])
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
equation
  connect(realExpression.y, Mount.input_x) annotation (Line(
      points={{-79,-60},{-50,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(positionSensor.s, support_shape.input_x) annotation (Line(
      points={{21,30},{40,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(support_mass.flange_a, flange_a) annotation (Line(
      points={{0,-20},{0,60}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(support_mass.flange_a, positionSensor.flange) annotation (Line(
      points={{0,-20},{0,30}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(flange_rear, rod.flange_a) annotation (Line(
      points={{-100,0},{-60,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rod.flange_a, fixed.flange) annotation (Line(
      points={{-60,0},{-60,-20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rod.flange_b, flange_fore) annotation (Line(
      points={{-40,0},{100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Mount1.input_x, realExpression.y) annotation (Line(
      points={{-50,-86},{-68,-86},{-68,-60},{-79,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(supportFriction.flange_a, support_mass.flange_a) annotation (Line(
      points={{0,-50},{0,-20}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics={Text(
          extent={{20,-22},{104,-30}},
          lineColor={0,0,255},
          textString="V = 100,383.786 mm3"), Text(
          extent={{14,-74},{98,-82}},
          lineColor={0,0,255},
          textString="V2 = 21,342.179 mm3")}),
                                 Icon(graphics={
        Polygon(
          points={{-100,70},{92,-70},{100,-70},{-92,70},{-100,70}},
          lineColor={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-100,70},{-100,66},{92,-74},{92,-70},{92,-74},{100,-74},{100,
              -70}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-100,68},{92,-72}},
          color={0,0,0},
          smooth=Smooth.None),
        Polygon(
          points={{6,-8},{20,-8},{34,-18},{20,-18},{6,-8}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{6,-8},{6,-14},{20,-24},{20,-18},{6,-8}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20,-24},{22,-24},{22,-20},{32,-20},{34,-22},{34,-18},{20,-18},
              {20,-24}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,60},{20,40},{20,-6}},
          color={0,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Text(
          extent={{0,-60},{0,-100}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Line(
          points={{-100,0},{-100,52},{-96,68}},
          color={0,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Line(
          points={{96,-72},{100,-60},{100,-4}},
          color={0,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Text(
          extent={{-80,10},{-80,-10}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="R"),
        Text(
          extent={{80,8},{80,-12}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="F")}));
end Rail;
