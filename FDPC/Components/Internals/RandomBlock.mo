within SandTable.Components.Internals;
block RandomBlock
  extends Modelica.Blocks.Interfaces.DiscreteBlock;
  parameter Real r_max = 1;
  parameter Real r_min = 0;

  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

protected
  Real r_rand;
initial equation
  SandTable.Components.Internals.InitRand(100);
equation
  when {sampleTrigger, initial()} then
    r_rand = SandTable.Components.Internals.RandomReal();
  end when;
    y = r_min + (r_max - r_min) * r_rand;

  annotation (Icon(graphics={Line(
          points={{-84,-52},{-68,-52},{-68,36},{-50,36},{-50,-38},{-38,-38},{
              -38,50},{-22,50},{-22,-56},{-2,-56},{-2,24},{16,24},{16,-36},{32,
              -36},{32,40},{48,40},{48,-48},{64,-48},{64,-2},{74,-2}},
          color={0,0,255},
          smooth=Smooth.None)}));
end RandomBlock;
