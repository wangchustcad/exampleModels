within SandTable.Components.Internals;
model FrictionForceI_dummy "Coulomb friction in support"

//  extends
//    Modelica.Mechanics.Translational.Interfaces.PartialElementaryOneFlangeAndSupport2;

  parameter Real f_pos[:, 2]=[0, 1]
    "[v, f] Positive sliding friction characteristic (v>=0)";
  parameter Real peak(final min=1) = 1
    "peak*f_pos[1,2] = Maximum friction force for v==0";
  extends Modelica.Mechanics.Translational.Interfaces.PartialFriction;

//  SI.Position s;

  SI.Force force "Friction force";

  SI.Force f_mue "Friction force";
  SI.Velocity v "Absolute velocity of flange_a and flange_b";
  SI.Acceleration a "Absolute acceleration of flange_a and flange_b";

  Modelica.SIunits.Length s = flange.s - s_support
    "Distance between flange and support (= flange.s - support.s)";
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange
    "Flange of component"
    annotation (Placement(transformation(extent={{90,-10},{110,10}},
          rotation=0)));
  Modelica.Mechanics.Translational.Interfaces.Support support(s=s_support, f=-flange.f)
    "Support/housing of component"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
protected
  Modelica.SIunits.Length s_support "Absolute position of support flange";

public
  Modelica.Blocks.Interfaces.RealInput mue
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
equation
  // Constant auxiliary variables
  f0 = Modelica.Math.tempInterpol1(0, f_pos, 2);
  f0_max = peak*f0;
  free = false;

//  s = s_a - s_support;
//  s_a = s_b;

// velocity and acceleration of flanges
  v = der(s);
  a = der(v);
  v_relfric = v;
  a_relfric = a;

// Friction force
  flange.f - f_mue = 0;

// Friction force
  force = if locked then sa*unitForce else
     (if startForward then          Modelica.Math.tempInterpol1( v, f_pos, 2) else
      if startBackward then        -Modelica.Math.tempInterpol1(-v, f_pos, 2) else
      if pre(mode) == Forward then  Modelica.Math.tempInterpol1( v, f_pos, 2) else
                                   -Modelica.Math.tempInterpol1(-v, f_pos, 2));
  f_mue = mue * force;

  annotation (
    Documentation(info="<html>
<p>
This element describes <b>Coulomb friction</b> in <b>support</b>,
i.e., a frictional force acting between a flange and the housing.
The positive sliding friction force \"f\" has to be defined
by table \"f_pos\" as function of the absolute velocity \"v\".
E.g.
<p>
<pre>
       v |   f
      ---+-----
       0 |   0
       1 |   2
       2 |   5
       3 |   8
</pre>
<p>
gives the following table:
</p>
<pre>
   f_pos = [0, 0; 1, 2; 2, 5; 3, 8];
</pre>
<p>
Currently, only linear interpolation in the table is supported.
Outside of the table, extrapolation through the last
two table entries is used. It is assumed that the negative
sliding friction force has the same characteristic with negative
values. Friction is modelled in the following way:
</p>
<p>
When the absolute velocity \"v\" is not zero, the friction force
is a function of v and of a constant normal force. This dependency
is defined via table f_pos and can be determined by measurements,
e.g., by driving the gear with constant velocity and measuring the
needed driving force (= friction force).
</p>
<p>
When the absolute velocity becomes zero, the elements
connected by the friction element become stuck, i.e., the absolute
position remains constant. In this phase the friction force is
calculated from a force balance due to the requirement, that
the absolute acceleration shall be zero.  The elements begin
to slide when the friction force exceeds a threshold value,
called the maximum static friction force, computed via:
</p>
<pre>
   maximum_static_friction = <b>peak</b> * sliding_friction(v=0)  (<b>peak</b> >= 1)
</pre>
<p>
This procedure is implemented in a \"clean\" way by state events and
leads to continuous/discrete systems of equations if friction elements
are dynamically coupled which have to be solved by appropriate
numerical methods. The method is described in:
</p>
<dl>
<dt>Otter M., Elmqvist H., and Mattsson S.E. (1999):
<dd><b>Hybrid Modeling in Modelica based on the Synchronous
    Data Flow Principle</b>. CACSD'99, Aug. 22.-26, Hawaii.
</dl>
<p>
More precise friction models take into account the elasticity of the
material when the two elements are \"stuck\", as well as other effects,
like hysteresis. This has the advantage that the friction element can
be completely described by a differential equation without events. The
drawback is that the system becomes stiff (about 10-20 times slower
simulation) and that more material constants have to be supplied which
requires more sophisticated identification. For more details, see the
following references, especially (Armstrong and Canudas de Witt 1996):
</p>
<dl>
<dt>Armstrong B. (1991):
<dd><b>Control of Machines with Friction</b>. Kluwer Academic
    Press, Boston MA.<br><br>
<dt>Armstrong B., and Canudas de Wit C. (1996):
<dd><b>Friction Modeling and Compensation.</b>
    The Control Handbook, edited by W.S.Levine, CRC Press,
    pp. 1369-1382.<br><br>
<dt>Canudas de Wit C., Olsson H., Astroem K.J., and Lischinsky P. (1995):
<dd><b>A new model for control of systems with friction.</b>
    IEEE Transactions on Automatic Control, Vol. 40, No. 3, pp. 419-425.<br><br>
</dl>

</HTML>
"),
Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                    graphics={
        Rectangle(
          extent={{-60,10},{80,-10}},
          lineColor={0,127,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-18,-10},{42,-70}},
          lineColor={95,95,95},
          fillPattern=FillPattern.Sphere,
          fillColor={175,175,175}),
        Text(
          extent={{-150,60},{150,20}},
          textString="%name",
          lineColor={0,0,255})}));
end FrictionForceI_dummy;
