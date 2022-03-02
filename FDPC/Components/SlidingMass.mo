within SandTable.Components;
model SlidingMass
  parameter SI.Angle phi = 0.005;

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape
                               sliding_shape(
    color={100,100,100},
    extra=1,
    shapeType="105.stl",
    r_shape={-0.342,0.137,-0.015},
    r={positionSensor.s,0,0},
    length=1,
    width=1,
    height=1,
    R=Frames.planarRotation(
        {0,1,0},
        phi,
        0))     annotation (Placement(transformation(extent={{74,34},{94,54}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_to_rail
    "Left flange of translational component" annotation (Placement(
        transformation(extent={{-10,-110},{10,-90}}), iconTransformation(extent=
           {{-10,-110},{10,-90}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(extent={{10,30},{30,50}})));
  Modelica.Mechanics.Translational.Components.Mass sliding_mass(
    s(start=0.35, fixed=true),
    v(start=0, fixed=true),
    m=0.944)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Mechanics.Translational.Components.Rod rod_fore(L=0.35)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Mechanics.Translational.Components.Rod rod_rear(L=0.35)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_fore
    "Right flange of translational component"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_rear
    "Left flange of translational component"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_drive
    "Right flange of translational component"
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Visualizers.Shape_X_Position sliding_shape1(
    color={100,100,100},
    extra=1,
    shapeType="201",
    length=0.0003,
    width=0.0003,
    height=0.0003,
    lengthDirection={0,0,-1},
    widthDirection={0,1,0},
    r_shape={0,0.15,0.05},
    animation=false)
                annotation (Placement(transformation(extent={{50,60},{70,80}})));
  Visualizers.Shape_X_Position sliding_shape2(
    color={100,100,100},
    extra=1,
    shapeType="100",
    widthDirection={0,0,-1},
    length=0.00001,
    width=0.00001,
    height=0.00001,
    r_shape={0,0.22,0})
                annotation (Placement(transformation(extent={{46,10},{66,30}})));
equation
  connect(sliding_mass.flange_a, flange_to_rail) annotation (Line(
      points={{0,0},{0,-100}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(sliding_mass.flange_a, positionSensor.flange) annotation (Line(
      points={{0,0},{0,40},{10,40}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(sliding_mass.flange_a, rod_rear.flange_b) annotation (Line(
      points={{0,0},{-20,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(sliding_mass.flange_b, rod_fore.flange_a) annotation (Line(
      points={{20,0},{40,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rod_fore.flange_b, flange_fore) annotation (Line(
      points={{60,0},{100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rod_rear.flange_a, flange_rear) annotation (Line(
      points={{-40,0},{-100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(flange_drive, sliding_mass.flange_a) annotation (Line(
      points={{0,100},{0,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(positionSensor.s, sliding_shape1.input_x) annotation (Line(
      points={{31,40},{40,40},{40,70},{50,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(positionSensor.s, sliding_shape2.input_x) annotation (Line(
      points={{31,40},{36,40},{36,20},{46,20}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(graphics={Text(
          extent={{6,-18},{90,-26}},
          lineColor={0,0,255},
          textString="V = 132,103.157 mm3")}),
                                 Icon(graphics={
        Line(
          points={{-100,0},{-80,28},{-40,28}},
          color={0,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Polygon(
          points={{-44,34},{-40,28},{70,-52},{76,-54},{72,-48},{-36,30},{-44,34}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-44,34},{-44,28},{-40,22},{-40,28},{-44,34}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-40,22},{70,-58},{70,-52},{-40,28},{-40,22}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{70,-58},{76,-60},{76,-54},{70,-52},{70,-58}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-6,2},{0,-4}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-10,6},{-4,2},{-2,2},{0,0},{0,-2},{12,-10},{14,-10},{18,-12},
              {18,-14},{26,-20},{28,-12},{22,-6},{18,4},{8,10},{0,10},{-6,12},{
              -10,6}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{12,-10},{18,-16}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(
          points={{100,0},{100,-40},{74,-56}},
          color={0,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Line(
          points={{10,-2},{0,-60},{0,-100}},
          color={0,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Text(
          extent={{0,-100},{0,-140}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="%name"),
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
          textString="F")}));
end SlidingMass;
