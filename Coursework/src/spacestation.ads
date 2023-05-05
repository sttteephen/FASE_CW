package SpaceStation with SPARK_Mode is
   
   type AirLockStatus is (Open, Closed);
   type OrbitHeight is range 300..450;
   
   type MonitoringStation is record
      airLock1 : AirLockStatus := Closed;
      airLock2 : AirLockStatus := Closed;
      height : OrbitHeight := 400;
   end record;
      
   solaris : MonitoringStation;
   
   function AirLockInvariant return Boolean is
     (solaris.airLock1 = Closed or solaris.airLock2 = Closed);
   
   function OrbitHeightInvariant return Boolean is
      (solaris.height >= OrbitHeight'First and solaris.height <= OrbitHeight'Last);
   
   
   -- air lock stuff
   procedure openAirLock1 with
     Global => (In_Out => solaris),
     Pre => solaris.airLock2 = Closed 
     and then AirLockInvariant
     and then OrbitHeightInvariant,
     Post => solaris.airLock1 = Open
     and solaris.airLock2 = Closed
     and AirLockInvariant 
     and OrbitHeightInvariant;
   
   procedure openAirLock2 with
     Global => (In_Out => solaris),
     Pre => solaris.airlock1 = Closed 
     and then AirLockInvariant
     and then OrbitHeightInvariant,
     Post => solaris.airLock2 = Open
     and solaris.airLock1 = Closed
     and AirLockInvariant 
     and OrbitHeightInvariant;
   
   procedure closeAirLock1 with
     Global => (In_Out => solaris),
     Pre => AirLockInvariant 
     and then OrbitHeightInvariant,
     Post => solaris.airLock1 = Closed 
     and then AirLockInvariant 
     and then OrbitHeightInvariant ;
  
   procedure closeAirLock2 with
     Global => (In_Out => solaris),
     Pre => AirLockInvariant 
     and then OrbitHeightInvariant,
     Post => solaris.airLock2 = Closed 
     and then AirLockInvariant 
     and then OrbitHeightInvariant ;
   
   
   -- orbit height stuff
   procedure increaseHeight with
     Global => (In_Out => solaris),
     Pre => solaris.height < OrbitHeight'Last
     and then OrbitHeightInvariant
     and then AirLockInvariant,
     Post => solaris.height <= OrbitHeight'Last
     and then OrbitHeightInvariant 
     and then AirLockInvariant;
   
   procedure decreaseHeight with 
     Global => (In_Out => solaris),
     Pre => solaris.height > OrbitHeight'First
     and then OrbitHeightInvariant
     and then AirLockInvariant,
     Post => solaris.height >= OrbitHeight'First
     and then OrbitHeightInvariant 
     and then AirLockInvariant;
   
      
end SpaceStation;
