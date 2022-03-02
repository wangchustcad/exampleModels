within SandTable.Components;
block ControlUnit

  Modelica.Blocks.Interfaces.BooleanInput u[8]
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-100})));
  Modelica.Blocks.Interfaces.IntegerOutput y[3]
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,100})));

protected
  Integer mode_1(start = 0) "state of e-machine 1";
  Integer mode_2(start = 0) "state of e-machine 2";
  Integer mode_3(start = 0) "state of e-machine 3";

  Boolean reverse_mode(start = false);
algorithm
  if u[1] then
    reverse_mode :=false;
  end if;
  if u[8] then
    reverse_mode :=true;
  end if;

  if not reverse_mode then
    // e-machine 1:
    if not u[3] then
                     mode_1 :=0;
                                 end if;
    if u[2] then
                 mode_1 :=1;
                             end if;

    // e-machine 2:
    if not u[5] then
                     mode_2 :=0;
                                 end if;
    if u[4] then
                 mode_2 :=1;
                             end if;

    // e-machine 3:
    if not u[7] then
                     mode_3 :=0;
                                 end if;
    if u[6] then
                 mode_3 :=1;
                             end if;
  else
    // e-machine 1:
    if not u[2] then
                     mode_1 :=0;
                                 end if;
    if u[3] then
                 mode_1 :=-1;
                              end if;

    // e-machine 2:
    if not u[4] then
                     mode_2 :=0;
                                 end if;
    if u[5] then
                 mode_2 :=-1;
                              end if;

    // e-machine 3:
    if not u[6] then
                     mode_3 :=0;
                                 end if;
    if u[7] then
                 mode_3 :=-1;
                              end if;
  end if;

  y :={mode_1,mode_2,mode_3};
  annotation (Icon(graphics={
        Polygon(
          points={{-80,8},{-80,40},{20,-20},{20,-50},{-80,8}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-80,40},{-68,42},{20,-10},{20,-20},{-80,40}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-80,40},{-68,42},{-16,76},{-20,80},{-80,40}},
          lineColor={0,0,0},
          smooth=Smooth.None),
        Polygon(
          points={{-84,20},{-74,26},{-68,22},{-78,16},{-82,12},{-88,16},{-84,20}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-78,16},{-68,22},{-68,18},{-78,12},{-82,8},{-82,12},{-78,16}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Line(
          points={{-82,-10},{-82,12}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-84,20},{-78,16}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{-78,14},{-78,-8},{-82,-10},{-82,10},{-78,14}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-88,-6},{-88,16},{-82,12},{-82,-10},{-88,-6}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-82,-10},{-78,-8}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-78,-8},{-78,12}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{-60,4},{-50,10},{-44,6},{-54,0},{-58,-4},{-64,0},{-60,4}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-54,0},{-44,6},{-44,2},{-54,-4},{-58,-8},{-58,-4},{-54,0}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Line(
          points={{-58,-26},{-58,-4}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-60,4},{-54,0}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{-54,-2},{-54,-24},{-58,-26},{-58,-6},{-54,-2}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-64,-22},{-64,0},{-58,-4},{-58,-26},{-64,-22}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-58,-26},{-54,-24}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-54,-24},{-54,-4}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{-34,-10},{-24,-4},{-18,-8},{-28,-14},{-32,-18},{-38,-14},{-34,
              -10}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-28,-14},{-18,-8},{-18,-12},{-28,-18},{-32,-22},{-32,-18},{-28,
              -14}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Line(
          points={{-32,-40},{-32,-18}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-34,-10},{-28,-14}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{-28,-16},{-28,-38},{-32,-40},{-32,-20},{-28,-16}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-38,-36},{-38,-14},{-32,-18},{-32,-40},{-38,-36}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-32,-40},{-28,-38}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-28,-38},{-28,-18}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{-6,-26},{4,-20},{10,-24},{0,-30},{-4,-34},{-10,-30},{-6,-26}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,-30},{10,-24},{10,-28},{0,-34},{-4,-38},{-4,-34},{0,-30}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Line(
          points={{-4,-56},{-4,-34}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-6,-26},{0,-30}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{0,-32},{0,-54},{-4,-56},{-4,-36},{0,-32}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-10,-52},{-10,-30},{-4,-34},{-4,-56},{-10,-52}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-4,-56},{0,-54}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{0,-54},{0,-34}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{4,72},{-2,68},{-2,64},{4,68},{4,72}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{8,70},{4,72},{4,64},{8,60},{8,70}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-2,76},{2,74},{8,70},{4,72},{-2,68},{-8,72},{-2,76}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-2,76},{4,72}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{-2,64},{4,68}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{4,68},{4,60}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{8,70},{8,58}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{28,58},{22,54},{22,50},{28,54},{28,58}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{32,56},{28,58},{28,50},{32,46},{32,56}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{22,62},{26,60},{32,56},{28,58},{22,54},{16,58},{22,62}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{22,62},{28,58}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{22,50},{28,54}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{28,54},{28,46}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{32,56},{32,44}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{50,44},{44,40},{44,36},{50,40},{50,44}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{54,42},{50,44},{50,36},{54,32},{54,42}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{44,48},{48,46},{54,42},{50,44},{44,40},{38,44},{44,48}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{44,48},{50,44}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{44,36},{50,40}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{50,40},{50,32}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{54,42},{54,30}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{74,30},{68,26},{68,22},{74,26},{74,30}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{78,28},{74,30},{74,22},{78,18},{78,28}},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{68,34},{72,32},{78,28},{74,30},{68,26},{62,30},{68,34}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{68,34},{74,30}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{68,22},{74,26}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{74,26},{74,18}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Line(
          points={{78,28},{78,16}},
          pattern=LinePattern.None,
          smooth=Smooth.None),
        Polygon(
          points={{-68,42},{20,-10},{72,24},{-16,76},{-68,42}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-34.1302,-13.6383},{34.1302,13.6383}},
          pattern=LinePattern.None,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          textString="%name",
          lineColor={215,215,215},
          origin={9.623,39.254},
          rotation=-30),
        Polygon(
          points={{-16,76},{72,24},{80,20},{-20,80},{-16,76}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{80,-10},{80,20},{20,-20},{20,-50},{80,-10}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={95,95,95}),
        Polygon(
          points={{20,-20},{20,-10},{72,24},{80,20},{20,-20}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),
        Text(
          extent={{160,20},{160,0}},
          lineColor={0,0,255},
          textString="%name")}),      Diagram(graphics));
end ControlUnit;
