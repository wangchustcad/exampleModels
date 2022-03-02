within SandTable;
package Demos "仿真示例"




annotation (Icon(graphics={
      Ellipse(
        extent={{-68,92},{92,-68}},
        lineColor={95,95,95},
        fillColor={135,135,135},
        fillPattern=FillPattern.Sphere),
      Ellipse(
        extent={{-74,86},{86,-74}},
        lineColor={95,95,95},
        fillColor={135,135,135},
        fillPattern=FillPattern.Sphere),
      Ellipse(
        extent={{-80,80},{80,-80}},
        lineColor={95,95,95},
        fillColor={135,135,135},
        fillPattern=FillPattern.Sphere),
      Polygon(
        points={{-28,48},{-28,-52},{52,-2},{-28,48}},
        lineColor={128,255,0},
        fillPattern=FillPattern.Sphere,
        smooth=Smooth.None,
        fillColor={213,255,170})}));
end Demos;
