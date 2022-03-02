within SandTable.Visualizers;
model Shape_X_Position
  "Visualizing an elementary shape with dynamically varying shape attributes (has one frame connector)"

  import SI = Modelica.SIunits;
  import Modelica.Mechanics.MultiBody.Types;
//  extends Modelica.Mechanics.MultiBody.Interfaces.PartialVisualizer;

  parameter Boolean animation=true "= true, if animation shall be enabled";
  parameter Types.ShapeType shapeType="box" "Type of shape"
    annotation (Dialog(group="if animation = true", enable=animation));
  input SI.Position r_shape[3]={0,0,0}
    "Vector from frame_a to shape origin, resolved in frame_a"
    annotation (Dialog(group="if animation = true", enable=animation));
  input Types.Axis lengthDirection={1,0,0}
    "Vector in length direction of shape, resolved in frame_a"
    annotation (Evaluate=true, Dialog(group="if animation = true", enable=animation));
  input Types.Axis widthDirection={0,1,0}
    "Vector in width direction of shape, resolved in frame_a"
    annotation (Evaluate=true, Dialog(group="if animation = true", enable=animation));
  input SI.Distance length(start=1)=1 "Length of shape"
    annotation (Dialog(group="if animation = true", enable=animation));
  input SI.Distance width(start=1)=1 "Width of shape"
    annotation (Dialog(group="if animation = true", enable=animation));
  input SI.Distance height(start=1)=1 "Height of shape"
    annotation (Dialog(group="if animation = true", enable=animation));
  input Modelica.Mechanics.MultiBody.Types.Color color={0,128,255}
    "Color of shape"
    annotation (Dialog(__Dymola_colorSelector=true, group="if animation = true", enable=animation));
  input Types.ShapeExtra extra=0.0
    "Additional data for cylinder, cone, pipe, gearwheel and spring"
    annotation (Dialog(group="if animation = true", enable=animation));
  input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
    "Reflection of ambient light (= 0: light is completely absorbed)"
    annotation (Dialog(group="if animation = true", enable=animation));

protected
  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape vis(
    shapeType=shapeType,
    r_shape=r_shape,
    lengthDirection=lengthDirection,
    widthDirection=widthDirection,
    length=length,
    width=width,
    height=height,
    color=color,
    extra=extra,
    specularCoefficient=specularCoefficient,
    r={input_x,0,0},
    R=Modelica.Mechanics.MultiBody.Frames.nullRotation()) if world.enableAnimation and animation;

protected
  outer Modelica.Mechanics.MultiBody.World world;
public
  Modelica.Blocks.Interfaces.RealInput input_x annotation (Placement(
        transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
           {{-110,-10},{-90,10}})));
equation

  annotation (
    Documentation(info="<HTML>
<p>
Model <b>FixedShape</b> defines a visual shape that is
shown at the location of its frame_a.
All describing data such as size and color can vary dynamically by
providing appropriate expressions in the input fields of the
parameter menu. The only exception is parameter shapeType
that cannot be changed during simulation.
The following shapes are currently supported via
parameter <b>shapeType</b> (e.g., shapeType=\"box\"):<br>&nbsp;
</p>
<IMG src=\"modelica://Modelica/Resources/Images/MultiBody/Shape.png\" ALT=\"model Visualizers.FixedShape\">
<p>&nbsp;<br>
The dark blue arrows in the figure above are directed along
variable <b>lengthDirection</b>. The light blue arrows are directed
along variable <b>widthDirection</b>. The <b>coordinate systems</b>
in the figure represent frame_a of the FixedShape component.
</p>
<p>
Additionally external shapes are specified as DXF-files
(only 3-dim.Face is supported). External shapes must be named \"1\", \"2\"
etc.. The corresponding definitions should be in files \"1.dxf\",
\"2.dxf\" etc.Since the DXF-files contain color and dimensions for
the individual faces, the corresponding information in the model
is currently ignored. The DXF-files must be found in the current directory.
If supported by the tool, DXF-files can also be accessed via <b>URIs</b> such as:
\"modelica://Modelica/Resources/Data/CAD/RobotR3/1.dxf\".
</p>
<p>
The sizes of any of the above components are specified by the
<b>length</b>, <b>width</b> and <b>height</b> variables.
Via variable <b>extra</b> additional data can be defined:
</p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>shapeType</b></th><th>Meaning of parameter <b>extra</b></th></tr>
<tr>
  <td valign=\"top\">\"cylinder\"</td>
  <td valign=\"top\">if extra &gt; 0, a black line is included in the
      cylinder to show the rotation of it.</td>
</tr>
<tr>
  <td valign=\"top\">\"cone\"</td>
  <td valign=\"top\">extra = diameter-left-side / diameter-right-side, i.e.,<br>
      extra = 1: cylinder<br>
      extra = 0: \"real\" cone.</td>
</tr>
<tr>
  <td valign=\"top\">\"pipe\"</td>
  <td valign=\"top\">extra = outer-diameter / inner-diameter, i.e, <br>
      extra = 1: cylinder that is completely hollow<br>
      extra = 0: cylinder without a hole.</td>
</tr>
<tr>
  <td valign=\"top\">\"gearwheel\"</td>
  <td valign=\"top\">extra is the number of teeth of the (external) gear.
If extra &lt; 0, an internal gear is visualized with |extra| teeth.
The axis of the gearwheel is along \"lengthDirection\", and usually:
width = height = 2*radiusOfGearWheel.</td>
</tr>
<tr>
  <td valign=\"top\">\"spring\"</td>
  <td valign=\"top\">extra is the number of windings of the spring.
      Additionally, \"height\" is <b>not</b> the \"height\" but
      2*coil-width.</td>
</tr>
</table>
<p>
Parameter <b>color</b> is a vector with 3 elements,
{r, g, b}, and specifies the color of the shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given as Integer[3] in the ranges 0 .. 255,
respectively. The predefined type
<b>MultiBody.Types.Color</b> contains a temporary menu
definition of the colors used in the MultiBody library
(this will be replaced by a color editor).
</p>
</HTML>
"), Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Polygon(
          points={{-82,33},{-82,-61},{8,-41},{68,-61},{68,33},{8,11},{-82,33}},
          lineColor={0,127,255},
          fillColor={0,127,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-80,34},{-46,46},{18,30},{92,56},{68,32},{8,12},{-80,34}},
          lineColor={255,255,255},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{90,54},{68,32},{68,-60},{90,-32},{90,54}},
          lineColor={255,255,255},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,-65},{150,-95}},
          lineColor={0,0,0},
          textString="%shapeType"),
        Text(
          extent={{-150,100},{150,60}},
          textString="%name",
          lineColor={0,0,255}),
        Text(
          extent={{-100,-10},{-100,-20}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="input x")}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics));
end Shape_X_Position;
