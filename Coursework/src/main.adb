with SpaceStation; use SpaceStation;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main with SPARK_Mode is

begin
   solaris.modules(ModuleRange'First) := 3;
   --Ada.Text_IO.Put (Module'Image(solaris.modules(ModuleRange'First)));

   printStation;
   for I in 1..4 loop
      pushModule;
   end loop;
   printStation;

   crewMove(1, Right);
   crewMove(1, Right);
   crewMove(1, Right);
   crewMove(1, Right);


   null;
end Main;
