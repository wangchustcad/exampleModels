within SandTable.Components.Internals;
function InitRand
 input Integer seed;
 external"C" annotation(Include="#include \"InitRand.c\"");
end InitRand;
