package SpaceStation with SPARK_Mode is
   
   type AirLockStatus is (Open, Closed);
   type OrbitHeight is range 350..450;
   type Module is range 0..3;
   type ModuleRange is range 1..20;
   type ModuleStack is array (ModuleRange) of Module;
   type Move is (Left, Right);
   
   type MonitoringStation is record
      airLock1 : AirLockStatus := Closed;
      airLock2 : AirLockStatus := Closed;
      height : OrbitHeight := 400;
      modules : ModuleStack; -- can you initialise the array values?
      modulesCount : ModuleRange := ModuleRange'First;
   end record;
      
   solaris : MonitoringStation;
   
   function AirLockInvariant return Boolean is
     (solaris.airLock1 = Closed or solaris.airLock2 = Closed);
   
   function OrbitHeightInvariant return Boolean is
      (solaris.height >= OrbitHeight'First and solaris.height <= OrbitHeight'Last);
   
   function ModuleStackInvariant return Boolean is
     (solaris.modulesCount >= ModuleRange'First and solaris.modulesCount <= ModuleRange'Last);

   
   -- air lock stuff
   procedure openAirLock1 with
     Global => (In_Out => solaris),
     Pre => solaris.airLock2 = Closed 
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant,
     Post => solaris.airLock1 = Open
     and solaris.airLock2 = Closed
     and AirLockInvariant 
     and OrbitHeightInvariant
     and ModuleStackInvariant;
   
   procedure openAirLock2 with
     Global => (In_Out => solaris),
     Pre => solaris.airlock1 = Closed 
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant,
     Post => solaris.airLock2 = Open
     and solaris.airLock1 = Closed
     and AirLockInvariant 
     and OrbitHeightInvariant
     and ModuleStackInvariant;
   
   procedure closeAirLock1 with
     Global => (In_Out => solaris),
     Pre => AirLockInvariant 
     and OrbitHeightInvariant
     and ModuleStackInvariant,
     Post => solaris.airLock1 = Closed 
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant;
  
   procedure closeAirLock2 with
     Global => (In_Out => solaris),
     Pre => AirLockInvariant 
     and OrbitHeightInvariant
     and ModuleStackInvariant,
     Post => solaris.airLock2 = Closed 
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant;
   
   
   -- orbit height stuff
   procedure increaseHeight with
     Global => (In_Out => solaris),
     Pre => solaris.height < OrbitHeight'Last
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant,
     Post => solaris.height <= OrbitHeight'Last
     and solaris.height = solaris.height'Old + 1
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant;
   
   procedure decreaseHeight with 
     Global => (In_Out => solaris),
     Pre => solaris.height > OrbitHeight'First
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant,
     Post => solaris.height >= OrbitHeight'First
     and solaris.height = solaris.height'Old - 1
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant;
   
   
   -- module stuff
   function Empty return Boolean is (solaris.modulesCount = ModuleRange'First);

   function Full return Boolean is (solaris.modulesCount = ModuleRange'Last);

   procedure pushModule with
     Global => (In_Out => solaris),
     Pre => not Full
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant,
     Post => solaris.modulesCount = solaris.modulesCount'Old + 1
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant;

   procedure popModule with
     Global => (In_Out => solaris),
     Pre => not Empty and solaris.modules(solaris.modulesCount) = 0
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant,
     Post => solaris.modulesCount = solaris.modulesCount'Old - 1
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant;
       
   procedure printStation;
   
   -- space walk stuff
   function spaceWalkSafe return Boolean is 
      (solaris.modules(ModuleRange'First) > 0 and solaris.modules(solaris.modulesCount) > 0);
   
   procedure crewMove(moduleIndex : in ModuleRange; moveDir : in Move) with
     Global => (In_Out => solaris),
     Pre => solaris.modules(moduleIndex) > 0 
     and (not (moduleIndex = 0) and moveDir = Left)
     and (not (moduleIndex = 20) and moveDir = Right)
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant,
     Post => 
       (solaris.modules(moduleIndex + 1) = solaris.modules(moduleIndex + 1)'Old + 1 or
          solaris.modules(moduleIndex -1) = solaris.modules(moduleIndex -1)'Old + 1)
     and AirLockInvariant
     and OrbitHeightInvariant
     and ModuleStackInvariant;
   
   
end SpaceStation;
