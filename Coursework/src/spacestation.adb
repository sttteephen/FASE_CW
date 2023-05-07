with Ada.Text_IO;                       use Ada.Text_IO;

package body SpaceStation with SPARK_Mode is
   
   -- air lock stuff
   procedure openAirLock1 is
   begin
      solaris.airLock1 := Open;
   end openAirLock1;
   
   procedure openAirLock2 is
   begin
      solaris.airLock2 := Open;
   end openAirLock2;
   
   procedure closeAirLock1 is
   begin
      solaris.airLock1 := Closed;
   end closeAirLock1;
   
   procedure closeAirLock2 is 
   begin
      solaris.airLock2 := Closed;
   end closeAirLock2;
   
   
   -- orbit height stuff
   procedure increaseHeight is
   begin
      solaris.height := solaris.height + 1;
   end increaseHeight;
   
   procedure decreaseHeight is
   begin
      solaris.height := solaris.height - 1;
   end decreaseHeight;
   
   
   -- module stuff
   procedure pushModule is
      newModule : Module := 0;
   begin
      solaris.modulesCount := solaris.modulesCount + 1;
      solaris.modules (solaris.modulesCount) := newModule;
   end pushModule;
   
   procedure popModule is
   begin
      solaris.modulesCount := solaris.modulesCount - 1;
   end popModule;
   
   procedure printStation is
   begin
      Ada.Text_IO.Put (AirLockStatus'Image(solaris.airLock1));
      Ada.Text_IO.Put (AirLockStatus'Image(solaris.airLock2));
      Ada.Text_IO.Put (OrbitHeight'Image(solaris.height));
      Ada.Text_IO.Put ("km");
      Ada.Text_IO.Put ("|");
      for I in ModuleRange'First..solaris.modulesCount loop
         Ada.Text_IO.Put (Module'Image(solaris.modules(I)));
      end loop;
      New_Line;
   end printStation;
   
   
   -- space walk stuff
   procedure crewMove(moduleIndex : in ModuleRange; moveDir : in Move) is
      i : Integer := Integer (moduleIndex);
      d : Integer;
   begin
      if moveDir = Left then
         d := -1;
      else
         d := 1;
      end if;
      
      solaris.modules(moduleIndex) := solaris.modules(moduleIndex) - 1;
      solaris.modules(ModuleRange(i + d)) := solaris.modules(ModuleRange(i + d)) + 1;
   end crewMove;
   
end SpaceStation;
