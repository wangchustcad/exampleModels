within SandTable.Components.Internals;
function RandomReal
 output Real s;
 external"C" annotation(Include="#include \"RandomReal.c\"");
end RandomReal;
