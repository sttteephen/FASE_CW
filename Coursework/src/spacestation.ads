package SpaceStation with SPARK_Mode is
   
   type AirLockStatus is (Open, Closed);
   type OrbitHeight is range 0..2000;
   type Module is range 0..3;
   type ModuleRange is range 1..20;
   type ModuleStack is array (ModuleRange) of Module;
   type Move is (Left, Right);
   
   MINIMUM_HEIGHT : constant OrbitHeight := 350;
   MAXIMUM_HEIGHT : constant OrbitHeight := 450;
   
   type MonitoringStation is record
      airLock1 : AirLockStatus := Closed;
      airLock2 : AirLockStatus := Closed;
      height : OrbitHeight := 400;
      modules : ModuleStack;
      modulesCount : ModuleRange := ModuleRange'First;
   end record;
      
   solaris : MonitoringStation;
   
   function AirlockInvariant return Boolean is
     (solaris.airLock1 = Closed or solaris.airLock2 = Closed);
   
   function OrbitHeightInvariant return Boolean is
      (solaris.height >= MINIMUM_HEIGHT and solaris.height <= MAXIMUM_HEIGHT);
   
   
   -- air lock stuff
   procedure openAirLock1 with
     Global => (In_Out => solaris),
     Pre => solaris.airLock2 = Closed 
     and AirlockInvariant
     and OrbitHeightInvariant,
     Post => solaris.airLock1 = Open
     and solaris.airLock2 = Closed
     and AirlockInvariant 
     and OrbitHeightInvariant;
   
   procedure openAirLock2 with
     Global => (In_Out => solaris),
     Pre => solaris.airlock1 = Closed 
     and AirlockInvariant
     and OrbitHeightInvariant,
     Post => solaris.airLock2 = Open
     and solaris.airLock1 = Closed
     and AirlockInvariant 
     and OrbitHeightInvariant;
   
   procedure closeAirLock1 with
     Global => (In_Out => solaris),
     Pre => AirlockInvariant 
     and OrbitHeightInvariant,
     Post => solaris.airLock1 = Closed 
     and AirlockInvariant
     and OrbitHeightInvariant;
  
   procedure closeAirLock2 with
     Global => (In_Out => solaris),
     Pre => AirlockInvariant 
     and OrbitHeightInvariant,
     Post => solaris.airLock2 = Closed 
     and AirlockInvariant
     and OrbitHeightInvariant;
   
   
   -- orbit height stuff
   procedure increaseHeight with
     Global => (In_Out => solaris),
     Pre => solaris.height < MAXIMUM_HEIGHT
     and AirlockInvariant
     and OrbitHeightInvariant,
     Post => solaris.height = solaris.height'Old + 1
     and AirlockInvariant
     and OrbitHeightInvariant;
   
   procedure decreaseHeight with 
     Global => (In_Out => solaris),
     Pre => solaris.height > MINIMUM_HEIGHT
     and AirlockInvariant
     and OrbitHeightInvariant,
     Post => solaris.height = solaris.height'Old - 1
     and AirlockInvariant
     and OrbitHeightInvariant;
   
   
   -- module stuff
   function LastModule return Boolean is (solaris.modulesCount = ModuleRange'First);

   function Full return Boolean is (solaris.modulesCount = ModuleRange'Last);

   procedure pushModule with
     Global => (In_Out => solaris),
     Pre => not Full
     and AirLockInvariant
     and OrbitHeightInvariant,
     Post => solaris.modulesCount = solaris.modulesCount'Old + 1
     and AirLockInvariant
     and OrbitHeightInvariant;

   procedure popModule with
     Global => (In_Out => solaris),
     Pre => not LastModule and solaris.modules(solaris.modulesCount) = 0
     and AirlockInvariant
     and OrbitHeightInvariant,
     Post => solaris.modulesCount = solaris.modulesCount'Old - 1
     and AirlockInvariant
     and OrbitHeightInvariant;
       
   procedure printStation;
   
   -- space walk stuff
   function spaceWalkSafe return Boolean is 
      (solaris.modules(ModuleRange'First) > 0 and solaris.modules(solaris.modulesCount) > 0);
   
   procedure crewMove(moduleIndex : in ModuleRange; moveDir : in Move) with
     Global => (In_Out => solaris),
     Pre => solaris.modules(moduleIndex) > 0 
     and (not (moduleIndex = 0) and moveDir = Left)
     and (not (moduleIndex = 20) and moveDir = Right)
     and AirlockInvariant
     and OrbitHeightInvariant,
     Post => solaris.modules(moduleIndex) = solaris.modules(moduleIndex)'Old - 1
     and ((moveDir = Right and solaris.modules(moduleIndex + 1) = solaris.modules(moduleIndex + 1)'Old + 1)
          or
           (moveDir = Left and solaris.modules(moduleIndex -1) = solaris.modules(moduleIndex -1)'Old + 1))
     and AirlockInvariant
     and OrbitHeightInvariant;
   
   
end SpaceStation;
