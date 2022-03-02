within SandTable.Demos;
model System_Normal "正常工况"
  extends Modelica.Icons.Example;
  Components.Outputs outputs(
    N_Real=2,
    N_Bool=8,
    output_bool={sensor0.y,sensor1A.y,sensor1B.y,sensor2A.y,sensor2B.y,sensor3A.y,
        sensor3B.y,sensor4.y},
    output_real={mounting2.a_z,slidingMass.positionSensor.s})
    annotation (Placement(transformation(extent={{-200,40},{-180,60}})));
protected
  Components.Rail rail
    annotation (Placement(transformation(extent = {{-170, -100}, {-130, -60}})));
  Components.Sensor sensor0(fixed_x = 0.05)
    annotation (Placement(transformation(extent = {{-80, -60}, {-60, -40}})));
  Components.Sensor sensor1A(fixed_x = 0.46)
    annotation (Placement(transformation(extent = {{-40, -60}, {-20, -40}})));
  Components.Sensor sensor1B(fixed_x = 0.60)
    annotation (Placement(transformation(extent = {{-10, -60}, {10, -40}})));
  Components.Sensor sensor2A(fixed_x = 1.01)
    annotation (Placement(transformation(extent = {{30, -60}, {50, -40}})));
  Components.Sensor sensor2B(fixed_x = 1.15)
    annotation (Placement(transformation(extent = {{60, -60}, {80, -40}})));
  Components.Sensor sensor3A(fixed_x = 1.56)
    annotation (Placement(transformation(extent = {{100, -60}, {120, -40}})));
  Components.Sensor sensor3B(fixed_x = 1.70)
    annotation (Placement(transformation(extent = {{130, -60}, {150, -40}})));
  Components.Sensor sensor4(fixed_x = 1.95)
    annotation (Placement(transformation(extent = {{170, -60}, {190, -40}})));
  Components.SlidingMass slidingMass(phi(displayUnit="deg") = 0.005235987755983)
    annotation (Placement(transformation(extent = {{-170, -20}, {-130, 20}})));
  SandTable.Components.ElastoGapRear elastoGapRear(c = 1e5, d = 1e3)
    annotation (Placement(transformation(extent = {{-200, -10}, {-180, 10}})));
  Components.ElastoGapFore elastoGapFore(d = 1e3)
    annotation (Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
  Components.Mounting mounting1(r0 = {0.699, 0.085, -0.112}, acc_mea = true,
    phi=slidingMass.phi)
    annotation (Placement(transformation(extent = {{-80, 40}, {-20, 100}})));
  Components.Mounting mounting2(r0 = {0.699 + 0.550, 0.085, -0.112}, acc_mea=
    true,
    phi=slidingMass.phi)
    annotation (Placement(transformation(extent = {{20, 40}, {80, 100}})));
  Components.Mounting mounting3(r0 = {0.699 + 1.1, 0.085, -0.112}, acc_mea = true,
    phi=slidingMass.phi)
    annotation (Placement(transformation(extent = {{120, 40}, {180, 100}})));
  Components.EMachine eMachine1(t_max = 5)
    annotation (Placement(transformation(extent = {{-50, 0}, {-10, 40}})));
  Components.EMachine eMachine2(t_max = 5)
    annotation (Placement(transformation(extent = {{50, 0}, {90, 40}})));
  Components.EMachine eMachine3(t_max = 5)
    annotation (Placement(transformation(extent = {{150, 0}, {190, 40}})));
  Components.ControlUnit controlUnit
    annotation (Placement(transformation(extent = {{50, -26}, {70, -6}})));
  inner Modelica.Mechanics.MultiBody.World world(animateWorld = false,
    animateGravity = false)
    annotation (Placement(transformation(extent = {{-200, 80}, {-180, 100}})));

initial equation
  mounting1.forces.position_d.v = 0;
  mounting1.forces.position_f.v = 0;
  mounting1.revolute1.phi = -0.00228565;
  mounting1.revolute1.w = 0;
  mounting1.revolute2.phi = 0.0111815;
  mounting1.revolute2.w = 0;
  mounting1.shaft1.phi = 0;
  mounting1.shaft1.w = 0;
  mounting1.shaft2.phi = 0;
  mounting1.shaft2.w = 0;
  mounting2.forces.position_d.v = 0;
  mounting2.forces.position_f.v = 0;
  mounting2.revolute1.phi = -0.0220835;
  mounting2.revolute1.w = 0;
  mounting2.revolute2.phi = 0.0565085;
  mounting2.revolute2.w = 0;
  mounting2.shaft1.phi = 0;
  mounting2.shaft1.w = 0;
  mounting2.shaft2.phi = 0;
  mounting2.shaft2.w = 0;
  mounting3.forces.position_d.v = 0;
  mounting3.forces.position_f.v = 0;
  mounting3.revolute1.phi = -0.0220835;
  mounting3.revolute1.w = 0;
  mounting3.revolute2.phi = 0.0565085;
  mounting3.revolute2.w = 0;
  mounting3.shaft1.phi = 0;
  mounting3.shaft1.w = 0;
  mounting3.shaft2.phi = 0;
  mounting3.shaft2.w = 0;

equation
  connect(slidingMass.flange_rear, elastoGapRear.flange_b) annotation (Line(
    points = {{-170, 0}, {-180, 0}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(rail.flange_rear, elastoGapRear.flange_a) annotation (Line(
    points = {{-170, -80}, {-200, -80}, {-200, 0}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_rear, sensor0.flange_rear) annotation (Line(
    points = {{-170, 0}, {-170, -58}, {-80, -58}, {-80, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_rear, sensor1A.flange_rear) annotation (Line(
    points = {{-170, 0}, {-170, -58}, {-40, -58}, {-40, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_rear, sensor1B.flange_rear) annotation (Line(
    points = {{-170, 0}, {-170, -58}, {-10, -58}, {-10, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_rear, sensor2A.flange_rear) annotation (Line(
    points = {{-170, 0}, {-170, -58}, {30, -58}, {30, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_rear, sensor2B.flange_rear) annotation (Line(
    points = {{-170, 0}, {-170, -58}, {60, -58}, {60, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_fore, sensor0.flange_fore) annotation (Line(
    points = {{-130, 0}, {-130, -56}, {-60, -56}, {-60, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_fore, sensor1A.flange_fore) annotation (Line(
    points = {{-130, 0}, {-130, -56}, {-20, -56}, {-20, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_fore, sensor1B.flange_fore) annotation (Line(
    points = {{-130, 0}, {-130, -56}, {10, -56}, {10, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_fore, sensor2A.flange_fore) annotation (Line(
    points = {{-130, 0}, {-130, -56}, {50, -56}, {50, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_fore, sensor2B.flange_fore) annotation (Line(
    points = {{-130, 0}, {-130, -56}, {80, -56}, {80, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_fore, elastoGapFore.flange_a) annotation (Line(
    points = {{-130, 0}, {-120, 0}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(elastoGapFore.flange_b, rail.flange_fore) annotation (Line(
    points = {{-100, 0}, {-100, -80}, {-130, -80}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_rear, sensor3A.flange_rear) annotation (Line(
    points = {{-170, 0}, {-170, -58}, {100, -58}, {100, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_rear, sensor3B.flange_rear) annotation (Line(
    points = {{-170, 0}, {-170, -58}, {130, -58}, {130, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_rear, sensor4.flange_rear) annotation (Line(
    points = {{-170, 0}, {-170, -58}, {170, -58}, {170, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_fore, sensor3A.flange_fore) annotation (Line(
    points = {{-130, 0}, {-130, -56}, {120, -56}, {120, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_fore, sensor3B.flange_fore) annotation (Line(
    points = {{-130, 0}, {-130, -56}, {150, -56}, {150, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(slidingMass.flange_fore, sensor4.flange_fore) annotation (Line(
    points = {{-130, 0}, {-130, -56}, {190, -56}, {190, -50}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(rail.flange_a, slidingMass.flange_to_rail) annotation (Line(
    points = {{-150, -68}, {-150, -20}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(mounting1.flange_a, slidingMass.flange_drive)
    annotation (Line(
      points = {{-50, 100}, {-150, 100}, {-150, 20}},
      color = {0, 127, 0},
      smooth = Smooth.None));
  connect(mounting3.flange_a, mounting2.flange_a) annotation (Line(
    points = {{150, 100}, {50, 100}},
    color = {0, 127, 0},
    smooth = Smooth.None));
  connect(mounting2.flange_a, mounting1.flange_a)
    annotation (Line(
      points = {{50, 100}, {-50, 100}},
      color = {0, 127, 0},
      smooth = Smooth.None));
  connect(controlUnit.y[1], eMachine1.mode) annotation (Line(
    points={{60,-6.66667},{-30,-6.66667},{-30,0}},
    color = {255, 127, 0},
    smooth = Smooth.None));
  connect(controlUnit.y[2], eMachine2.mode) annotation (Line(
    points={{60,-6},{60,0},{70,0}},
    color = {255, 127, 0},
    smooth = Smooth.None));
  connect(controlUnit.y[3], eMachine3.mode) annotation (Line(
    points={{60,-5.33333},{170,-5.33333},{170,0}},
    color = {255, 127, 0},
    smooth = Smooth.None));
  connect(sensor0.y, controlUnit.u[1]) annotation (Line(
    points = {{-70, -40}, {-70, -30}, {60, -30}, {60, -26.875}},
    color = {255, 0, 255},
    smooth = Smooth.None));
  connect(sensor1A.y, controlUnit.u[2]) annotation (Line(
    points = {{-30, -40}, {-30, -32}, {60, -32}, {60, -26.625}},
    color = {255, 0, 255},
    smooth = Smooth.None));
  connect(sensor1B.y, controlUnit.u[3]) annotation (Line(
    points = {{0, -40}, {0, -34}, {60, -34}, {60, -26.375}},
    color = {255, 0, 255},
    smooth = Smooth.None));
  connect(sensor2A.y, controlUnit.u[4]) annotation (Line(
    points = {{40, -40}, {40, -36}, {60, -36}, {60, -26.125}},
    color = {255, 0, 255},
    smooth = Smooth.None));
  connect(sensor2B.y, controlUnit.u[5]) annotation (Line(
    points = {{70, -40}, {70, -36}, {60, -36}, {60, -25.875}},
    color = {255, 0, 255},
    smooth = Smooth.None));
  connect(sensor3A.y, controlUnit.u[6]) annotation (Line(
    points = {{110, -40}, {110, -34}, {60, -34}, {60, -25.625}},
    color = {255, 0, 255},
    smooth = Smooth.None));
  connect(sensor3B.y, controlUnit.u[7]) annotation (Line(
    points = {{140, -40}, {140, -32}, {60, -32}, {60, -25.375}},
    color = {255, 0, 255},
    smooth = Smooth.None));
  connect(sensor4.y, controlUnit.u[8]) annotation (Line(
    points = {{180, -40}, {180, -30}, {60, -30}, {60, -25.125}},
    color = {255, 0, 255},
    smooth = Smooth.None));
  connect(mounting2.axis, eMachine2.flange) annotation (Line(
    points = {{50, 40}, {70, 40}},
    color = {0, 0, 0},
    smooth = Smooth.None));
  connect(mounting1.axis, eMachine1.flange) annotation (Line(
    points = {{-50, 40}, {-30, 40}},
    color = {0, 0, 0},
    smooth = Smooth.None));
  connect(mounting3.axis, eMachine3.flange) annotation (Line(
    points = {{150, 40}, {170, 40}},
    color = {0, 0, 0},
    smooth = Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-200,
    -100}, {200, 100}}), graphics), Icon(coordinateSystem(
      preserveAspectRatio = true, extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 30, NumberOfIntervals = 3000, Algorithm = "Dassl", Tolerance = 0.0001, IntegratorStep = 0.01, DoublePrecision = false), __Dymola_experimentSetupOutput);
end System_Normal;
