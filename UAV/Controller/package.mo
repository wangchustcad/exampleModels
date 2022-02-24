within UAV;
package Controller "控制器"
  extends Modelica.Icons.Package;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})));
  package Components
    extends Modelica.Icons.Package;
    model PID
      parameter Real kp = 1 "比例系数";
      parameter Real ki = 1 "积分系数";
      parameter Real kd = 1 "微分系数";
      Modelica.Blocks.Continuous.Integrator integrator
        annotation (Placement(transformation(origin = {-50.0, 50.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Continuous.Derivative derivative
        annotation (
          Placement(transformation(origin = {-50.0, -50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Math.Gain gain(k = kp)
        annotation (
          Placement(transformation(origin = {-30.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Math.Gain gain_ki(k = ki) annotation (
        Placement(transformation(origin = {10.0, 50.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Math.Gain gain_kd(k = kd) annotation (Placement(transformation(origin = {10.0, -50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Math.Add3 add3_1
        annotation (Placement(transformation(origin = {50.0, 0.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealOutput y "输出接口" 
        annotation (
          Placement(transformation(origin = {110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealInput u "输入接口" 
        annotation (
          Placement(transformation(origin = {-110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      annotation (
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
          fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid, 
          extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {-4.0, -1.0}, 
          extent = {{-66.0, -33.0}, {66.0, 33.0}}, 
          textString = "PID", 
          textStyle = {TextStyle.None}), Text(origin = {120.0, 20.0}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
          textString = "y", 
          textStyle = {TextStyle.None}), Text(origin = {-120.0, 20.0}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
          textString = "u", 
          textStyle = {TextStyle.None}), Text(origin = {0.0, 130.0}, 
          extent = {{-100.0, -30.0}, {100.0, 30.0}}, 
          textString = "%name", 
          textStyle = {TextStyle.None})}));
    equation 
      connect(integrator.y, gain_ki.u)
        annotation (Line(origin = {-21.0, 50.0}, 
          points = {{-18.0, 0.0}, {19.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(gain.y, add3_1.u2)
        annotation (Line(origin = {10.0, 0.0}, 
          points = {{-29.0, 0.0}, {28.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(gain_ki.y, add3_1.u1)
        annotation (Line(origin = {30.0, 29.0}, 
          points = {{-9.0, 21.0}, {0.0, 21.0}, {0.0, -21.0}, {8.0, -21.0}}, 
          color = {0, 0, 127}));
      connect(derivative.y, gain_kd.u)
        annotation (Line(origin = {-21.0, -50.0}, 
          points = {{-18.0, 0.0}, {19.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(gain_kd.y, add3_1.u3)
        annotation (Line(origin = {30.0, -29.0}, 
          points = {{-9.0, -21.0}, {0.0, -21.0}, {0.0, 21.0}, {8.0, 21.0}}, 
          color = {0, 0, 127}));
      connect(add3_1.y, y)
        annotation (
          Line(origin = {81.0, 0.0}, 
            points = {{-20.0, 0.0}, {29.0, 0.0}}, 
            color = {0, 0, 127}));
      connect(integrator.u, u)
        annotation (
          Line(origin = {-81.0, 25.0}, 
            points = {{19.0, 25.0}, {1.0, 25.0}, {1.0, -25.0}, {-29.0, -25.0}}, 
            color = {0, 0, 127}));
      connect(u, gain.u)
        annotation (Line(origin = {-76.0, 0.0}, 
          points = {{-34.0, 0.0}, {34.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(derivative.u, u)
        annotation (Line(origin = {-86.0, -25.0}, 
          points = {{24.0, -25.0}, {6.0, -25.0}, {6.0, 25.0}, {-24.0, 25.0}}, 
          color = {0, 0, 127}));
    end PID;
    model InstructionDispatch "指令分配"
      annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})), 
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
          fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid, 
          extent = {{-100.0, -100.0}, {100.0, 100.0}}), Line(origin = {-50.0, 0.0}, 
          points = {{-50.0, 0.0}, {50.0, 0.0}}, 
          thickness = 1.0), Line(origin = {50.0, 30.0}, 
          points = {{-50.0, -30.0}, {50.0, 30.0}}, 
          thickness = 1.0), Line(origin = {50.0, 10.0}, 
          points = {{-50.0, -10.0}, {50.0, 10.0}}, 
          thickness = 1.0), Line(origin = {50.0, -10.0}, 
          points = {{-50.0, 10.0}, {50.0, -10.0}}, 
          thickness = 1.0), Line(origin = {50.0, -30.0}, 
          points = {{-50.0, 30.0}, {50.0, -30.0}}, 
          thickness = 1.0), Text(origin = {120.0, 80.0}, 
          extent = {{-20.0, -10.0}, {20.0, 10.0}}, 
          textString = "y1", 
          textStyle = {TextStyle.None}), Text(origin = {120.0, 40.0}, 
          extent = {{-20.0, -10.0}, {20.0, 10.0}}, 
          textString = "y2", 
          textStyle = {TextStyle.None}), Text(origin = {120.0, 0.0}, 
          extent = {{-20.0, -10.0}, {20.0, 10.0}}, 
          textString = "y3", 
          textStyle = {TextStyle.None}), Text(origin = {120.0, -40.0}, 
          extent = {{-20.0, -10.0}, {20.0, 10.0}}, 
          textString = "y4", 
          textStyle = {TextStyle.None}), Text(origin = {-80.0, 20.0}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
          textString = "u", 
          textStyle = {TextStyle.None}), Text(origin = {0.0, 130.0}, 
          extent = {{-100.0, -30.0}, {100.0, 30.0}}, 
          textString = "%name", 
          textStyle = {TextStyle.None})}));
      parameter Real k1;
      parameter Real k2;
      parameter Real k3;
      parameter Real k4;
      Modelica.Blocks.Interfaces.RealInput u
        annotation (
          Placement(transformation(origin = {-120.0, 0.0}, 
            extent = {{-20.0, -20.0}, {20.0, 20.0}})));
      Modelica.Blocks.Interfaces.RealOutput y1
        annotation (
          Placement(transformation(origin = {110.0, 60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealOutput y2
        annotation (
          Placement(transformation(origin = {110.0, 20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealOutput y3
        annotation (
          Placement(transformation(origin = {110.0, -20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealOutput y4
        annotation (
          Placement(transformation(origin = {110.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
    equation 
      y1 = u * k1;
      y2 = u * k2;
      y3 = u * k3;
      y4 = u * k4;
    end InstructionDispatch;
    model Limit "限幅"
      annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})), 
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
          fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid, 
          extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {120.0, 20.0}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
          textString = "y", 
          textStyle = {TextStyle.None}), Text(origin = {-120.0, 20.0}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
          textString = "u", 
          textStyle = {TextStyle.None}), Text(origin = {0.0, 130.0}, 
          extent = {{-100.0, -30.0}, {100.0, 30.0}}, 
          textString = "%name", 
          textStyle = {TextStyle.None}), Line(origin = {0.0, 0.0}, 
          points = {{-80.0, 0.0}, {60.0, 0.0}, {80.0, 0.0}}, 
          arrow = {Arrow.None, Arrow.Filled}), Line(origin = {0.0, 0.0}, 
          points = {{0.0, -80.0}, {0.0, 80.0}}, 
          arrow = {Arrow.None, Arrow.Filled}), Line(origin = {0.0, 0.0}, 
          points = {{-80.0, -40.0}, {-40.0, -40.0}, {40.0, 40.0}, {80.0, 40.0}}, 
          color = {0, 0, 255}, 
          thickness = 1.0)}));
      parameter Integer N = 1 "维度";
      parameter Real Limit = 1 "限幅";
      Modelica.Blocks.Interfaces.RealOutput y[N] "输出接口" 
        annotation (
          Placement(transformation(origin = {110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealInput u[N] "输入接口" 
        annotation (
          Placement(transformation(origin = {-110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
    equation 
      for i in 1:N loop 
        if abs(u[i]) >= Limit then 
          if u[i] >= 0 then 
            y[i] = Limit;
          else
            y[i] = -Limit;
          end if;
        else
          y[i] = u[i];
        end if;
      end for;
    end Limit;
    model TransW "角速度转换"
      annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})), 
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
          fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid, 
          extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(origin = {120.0, 20.0}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
          textString = "y", 
          textStyle = {TextStyle.None}), Text(origin = {-120.0, 20.0}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
          textString = "u", 
          textStyle = {TextStyle.None}), Text(origin = {0.0, 130.0}, 
          extent = {{-100.0, -30.0}, {100.0, 30.0}}, 
          textString = "%name", 
          textStyle = {TextStyle.None}), Line(origin = {0.0, 0.0}, 
          points = {{-80.0, -40.0}, {-60.0, -20.0}, {-40.0, -60.0}, {-20.0, 60.0}, {80.0, 60.0}}, 
          color = {0, 0, 128}, 
          thickness = 1.0)}));
      Modelica.Blocks.Interfaces.RealOutput y "输出接口" 
        annotation (
          Placement(transformation(origin = {110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealInput u "输入接口" 
        annotation (
          Placement(transformation(origin = {-110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
    equation 
      if abs(u) > 1e-6 then 
        if u > 0 then 
          y = sqrt(abs(u));
        else
          y = -sqrt(abs(u));
        end if;
      else
        y = 0;
      end if;
    end TransW;
  end Components;
end Controller;