within SandTable.Components;
model EMachine
   parameter Boolean enable = true "=false, the emachine is broken down";
   parameter SI.Velocity v_ref = 0.3 "reference velocity of sliding mass";
   parameter SI.Diameter d_d = 0.1 "diameter of drive wheel";
   parameter SI.Torque t_max = 1 "max load";

   parameter SI.AngularVelocity w_tol = 1e-5 "velocity tolerance";
   final parameter SI.AngularVelocity w_ref = 2 * v_ref / d_d
    "Reference Angular velocity";

  Modelica.Mechanics.Rotational.Sources.Speed speed(f_crit=5)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Flange of shaft"
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Blocks.Interfaces.IntegerInput mode "0:stop; 1:start; -1:reverse"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-100})));
  Modelica.Blocks.Math.IntegerToReal integerToReal
    annotation (Placement(transformation(extent={{-84,-10},{-76,-2}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
  Modelica.Blocks.Sources.RealExpression
                                   const(y=if enable then w_ref else 0)
    annotation (Placement(transformation(extent={{-66,2},{-58,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia rotor(J=0.0001) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,30})));
  Internals.MaxTorque maxTorque(t_max=t_max, w_small=w_tol)
                                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,70})));
equation
  connect(integerToReal.u, mode) annotation (Line(
      points={{-84.8,-6},{-94,-6},{-94,-60},{0,-60},{0,-100}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(product1.y, speed.w_ref) annotation (Line(
      points={{-27,0},{-22,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integerToReal.y, product1.u2) annotation (Line(
      points={{-75.6,-6},{-50,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, product1.u1) annotation (Line(
      points={{-57.6,6},{-50,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rotor.flange_a, speed.flange) annotation (Line(
      points={{-6.12323e-016,20},{0,20},{0,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(rotor.flange_b, maxTorque.flange_a) annotation (Line(
      points={{6.12323e-016,40},{6.12323e-016,50},{-6.12323e-016,50},{
          -6.12323e-016,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(maxTorque.flange_b, flange) annotation (Line(
      points={{6.12323e-016,80},{0,80},{0,100}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics={Text(
          extent={{20,-32},{80,-72}},
          lineColor={0,0,0},
          horizontalAlignment=TextAlignment.Left,
          textString="Instructions:
 0: stop
 1: forward rotation
-1: reverse rotation"), Rectangle(extent={{14,-30},{86,-74}}, lineColor={0,0,0})}),
      Icon(graphics={
        Polygon(
          points={{-46,24},{0,0},{46,22},{0,42},{-46,24}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-26,36},{26,16}},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-40,-50},{-40,-58},{0,-76},{0,-68},{-40,-50}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{40,-48},{40,-56},{0,-76},{0,-68},{40,-48}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-26,32},{26,12}},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-46,24},{-46,-48},{0,-68},{0,0},{-46,24}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,0},{46,22},{46,-46},{0,-68},{0,0}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-38,8},{-38,-42},{-34,-44},{-34,6},{-38,8}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-26,2},{-26,-48},{-22,-50},{-22,0},{-26,2}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-12,-6},{-12,-56},{-8,-58},{-8,-8},{-12,-6}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{12,-6},{12,-56},{8,-58},{8,-8},{12,-6}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{26,2},{26,-48},{22,-50},{22,0},{26,2}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{38,8},{38,-42},{34,-44},{34,6},{38,8}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-26,26},{-26,22}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{26,26},{26,22}},
          color={0,0,0},
          smooth=Smooth.None),
        Ellipse(
          extent={{-18,28},{18,16}},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-8,28},{8,20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-8,52},{8,24}},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135},
          pattern=LinePattern.None),
        Ellipse(
          extent={{-8,56},{8,48}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-8,52},{-8,24}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{8,52},{8,24}},
          color={0,0,0},
          smooth=Smooth.None),
        Polygon(
          points={{8,50},{8,26},{4,24},{4,48},{8,50}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(
          points={{6,28},{6,48}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{6,28},{8,26}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{6,28},{4,26}},
          color={0,0,0},
          smooth=Smooth.None),
        Text(
          extent={{0,20},{0,-20}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="%name",
          origin={-80,0},
          rotation=90)}));
end EMachine;
