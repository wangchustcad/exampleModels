within SandTable.Components.Internals;
model FrictionForceII_dummy
  parameter Modelica.SIunits.Velocity v_small = 1e-5;
  Modelica.SIunits.Velocity va;
  Modelica.SIunits.Velocity vb;
  Modelica.SIunits.Velocity vd;

  Modelica.SIunits.Force f;

  Modelica.Blocks.Interfaces.RealInput mue "friction coefficient" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,100})));
  Modelica.Blocks.Interfaces.RealInput fn "normal force" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-100})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

equation
  va = der(flange_a.s);
  vb = der(flange_b.s);
  vd = vb - va;

/*  if va - vb > v_small then
    flange_a.f = noEvent(abs(fn * mue));
  else
       if va - vb < -v_small then
    flange_a.f = -noEvent(abs(fn * mue));
  else
    flange_a.f = 0;
    end if;
  end if;*/
/*
  f = noEvent(if va - vb > v_small then fn * mue else if 
    vb - va > v_small then -fn * mue else 0);
*/

  if vb > v_small then
    f =  -noEvent(abs(fn * mue * vd));
  else
       if vb < -v_small then
    f =  noEvent(abs(fn * mue * vd));
  else
    f = 0;
  end if;
          end if;

  flange_a.f = f;

  flange_b.f = -flange_a.f;
  annotation (Diagram(graphics));
end FrictionForceII_dummy;
