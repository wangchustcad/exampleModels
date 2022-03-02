within SandTable.Components.Internals;
model SpringWithStopI
    parameter SI.TranslationalSpringConstant k(final min=0, start = 613)
    "Dpring constant";

  Modelica.Mechanics.MultiBody.Forces.LineForceWithMass lineForceWithMass(
    lineShapeType="spring",
    m=0.005,
    lineShapeExtra=20,
    animateMass=false,
    lineShapeColor={155,155,155},
    lineShapeWidth=0.006,
    lineShapeHeight=0.002)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
    "Coordinate system fixed to the component with one cut-force and cut-torque"
    annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
    "Coordinate system fixed to the component with one cut-force and cut-torque"
    annotation (Placement(transformation(extent={{84,-16},{116,16}})));
  Modelica.Mechanics.Translational.Components.Rod rod(L=0.0666)
    annotation (Placement(transformation(extent={{-10,70},{10,90}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper(
    s_rel0=0.094,
    c=k,
    d=100)
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Modelica.Mechanics.Translational.Components.ElastoGap elastoGap1(c=1e8, d=1e6)
    annotation (Placement(transformation(extent={{40,10},{60,30}})));
equation
  connect(lineForceWithMass.frame_a, frame_a) annotation (Line(
      points={{-20,0},{-100,0}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(lineForceWithMass.frame_b, frame_b) annotation (Line(
      points={{20,0},{100,0}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(rod.flange_a, lineForceWithMass.flange_a) annotation (Line(
      points={{-10,80},{-60,80},{-60,20},{-12,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(lineForceWithMass.flange_a, springDamper.flange_a) annotation (Line(
      points={{-12,20},{-12,50},{-10,50}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(lineForceWithMass.flange_b, springDamper.flange_b) annotation (Line(
      points={{12,20},{12,50},{10,50}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(elastoGap1.flange_b, rod.flange_b) annotation (Line(
      points={{60,20},{60,80},{10,80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(springDamper.flange_b, elastoGap1.flange_a) annotation (Line(
      points={{10,50},{12,50},{12,20},{40,20}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics={Text(
          extent={{6,74},{40,68}},
          lineColor={0,0,255},
          textString="0.0655")}),Icon(graphics={
        Rectangle(
          extent={{32,4},{42,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{12,4},{22,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-8,4},{2,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-28,4},{-18,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-48,4},{-38,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-84,4},{-58,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Line(
          points={{-68,-12},{-58,20},{-48,-20},{-38,20},{-28,-20},{-18,20},{-8,
              -20},{2,20},{12,-20},{22,20},{32,-20},{42,20},{52,-14}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Rectangle(
          extent={{-58,4},{-48,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-38,4},{-28,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-18,4},{-8,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{2,4},{12,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{22,4},{32,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{42,4},{60,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Line(
          points={{52,20},{52,-20}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Rectangle(
          extent={{58,6},{66,-6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{58,12},{66,6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{58,-6},{66,-12}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-76,6},{-68,-6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-76,12},{-68,6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-76,-6},{-68,-12}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Line(
          points={{-68,20},{-68,-32}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{-82,-32},{-12,-32}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Ellipse(
          extent={{-16,-28},{-8,-36}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-12,-32},{80,-14}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Text(
          extent={{0,-60},{0,-100}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Line(
          points={{-68,50},{48,50}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-68,50},{-56,56}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-68,50},{-56,44}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{48,50},{36,56}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{48,50},{36,44}},
          color={0,0,255},
          smooth=Smooth.None)}));
end SpringWithStopI;
