within SandTable.Components.Internals;
model SpringWithStopII
    parameter SI.TranslationalSpringConstant k(final min=0, start = 3500) = 3500
    "Dpring constant";

  Modelica.Mechanics.MultiBody.Forces.LineForceWithMass lineForceWithMass(
    lineShapeType="spring",
    animateMass=false,
    m=0.003,
    lineShapeColor={155,155,155},
    lineShapeWidth=0.006,
    lineShapeHeight=0.002,
    lineShapeExtra=10)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Mechanics.Translational.Components.Rod rod(L=0.01)
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper(
    c=k,
    s_rel0=0.03,
    d=100)       annotation (Placement(transformation(extent={{-8,30},{12,50}})));
  Modelica.Mechanics.Translational.Components.ElastoGap elastoGapS(c=1e8, d=1e6)
    annotation (Placement(transformation(extent={{-8,60},{12,80}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
    "Coordinate system fixed to the component with one cut-force and cut-torque"
    annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
    "Coordinate system fixed to the component with one cut-force and cut-torque"
    annotation (Placement(transformation(extent={{84,-16},{116,16}})));
  Modelica.Mechanics.Translational.Components.Rod rod1(L=0.017)
    annotation (Placement(transformation(extent={{0,80},{20,100}})));
  Modelica.Mechanics.Translational.Components.ElastoGap elastoGapL(c=1e8, d=1e6)
    annotation (Placement(transformation(extent={{50,10},{70,30}})));
equation
  connect(springDamper.flange_a, lineForceWithMass.flange_a) annotation (Line(
      points={{-8,40},{-12,40},{-12,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(elastoGapS.flange_b, rod.flange_a)
                                            annotation (Line(
      points={{12,70},{20,70}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(elastoGapS.flange_a, lineForceWithMass.flange_a)
                                                          annotation (Line(
      points={{-8,70},{-12,70},{-12,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(frame_a, lineForceWithMass.frame_a) annotation (Line(
      points={{-100,0},{-20,0}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(lineForceWithMass.frame_b, frame_b) annotation (Line(
      points={{20,0},{100,0}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(lineForceWithMass.flange_a, rod1.flange_a) annotation (Line(
      points={{-12,20},{-12,90},{0,90}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(lineForceWithMass.flange_b,elastoGapL. flange_a) annotation (Line(
      points={{12,20},{50,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(elastoGapL.flange_b, rod1.flange_b) annotation (Line(
      points={{70,20},{70,90},{20,90}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rod.flange_b, lineForceWithMass.flange_b) annotation (Line(
      points={{40,70},{40,20},{12,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(springDamper.flange_b, lineForceWithMass.flange_b) annotation (Line(
      points={{12,40},{40,40},{40,20},{12,20}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(graphics={
        Rectangle(
          extent={{-76,4},{20,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{56,4},{60,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{60,6},{68,-6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{60,12},{68,6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{60,-6},{68,-12}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-68,6},{-60,-6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-68,12},{-60,6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-68,-6},{-60,-12}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Line(
          points={{-72,-18},{6,-18}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Ellipse(
          extent={{6,-14},{14,-22}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Line(
          points={{10,-18},{54,-24}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Rectangle(
          extent={{44,4},{50,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{32,4},{38,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{20,4},{26,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Line(
          points={{22,16},{18,-18}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{22,8},{26,-18},{32,20},{38,-20},{44,20},{50,-20},{56,18},{60,
              -10}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Rectangle(
          extent={{50,4},{56,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{38,4},{44,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{26,4},{32,-4}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-60,6},{-52,-6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-60,12},{-52,6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-60,-6},{-52,-12}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-52,6},{-44,-6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-52,12},{-44,6}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-52,-6},{-44,-12}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Line(
          points={{-52,20},{-52,-18}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{60,14},{60,-14}},
          color={0,0,0},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{60,20},{60,40},{80,40},{100,20}},
          color={0,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Line(
          points={{22,18},{10,40},{-80,40},{-100,20}},
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
          points={{16,60},{58,60}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{16,60},{28,66}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{16,60},{28,54}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{58,60},{46,66}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{58,60},{46,54}},
          color={0,0,255},
          smooth=Smooth.None)}));
end SpringWithStopII;
