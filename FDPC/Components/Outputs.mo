within SandTable.Components;
model Outputs
  parameter Integer N_Real = 0;
  parameter Integer N_Int = 0;
  parameter Integer N_Bool = 0;

  output Real output_real[N_Real] = zeros(N_Real) annotation(Dialog);
  output Integer output_int[N_Int] = zeros(N_Int) annotation(Dialog);
  output Boolean output_bool[N_Bool] = fill(false, N_Bool) annotation(Dialog);
  annotation (Icon(graphics={
        Polygon(
          points={{-80,-18},{-80,-48},{-50,-48},{50,-48},{80,-48},{80,-18},{80,42},
              {80,72},{50,72},{-50,72},{-80,72},{-80,42},{-80,-18}},
          lineColor={0,0,0},
          smooth=Smooth.Bezier),
        Line(
          points={{-64,-16},{-26,58},{22,-34},{62,32}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Rectangle(extent={{-92,84},{92,-80}}, lineColor={0,0,0}),
        Ellipse(extent={{-62,-54},{-42,-74}}, lineColor={0,0,0}),
        Ellipse(extent={{-10,-56},{10,-76}},  lineColor={0,0,0}),
        Ellipse(extent={{40,-56},{60,-76}},   lineColor={0,0,0})}));
end Outputs;
