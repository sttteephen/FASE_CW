package SpaceStation with SPARK_Mode is
   
   type AirLockStatus is (Open, Closed);
   type OrbitHeight is range 280..460;
   
   type MonitoringStation is record
      airLock1 : AirLockStatus := Closed;
      airLock2 : AirLockStatus := Closed;
      height : OrbitHeight := 400;
   end record;
      
   solaris : MonitoringStation;
   
   function AirLockInvariant return Boolean is
     (solaris.airLock1 = Closed or solaris.airLock2 = Closed);
   
   procedure openAirLock1 with
     Global => (In_Out => solaris),
     Pre => solaris.airLock2 = Closed and then AirLockInvariant,
     Post => AirLockInvariant and solaris.airLock1 = Open;
   
   procedure openAirLock2 with
     Global => (In_Out => solaris),
     Pre => solaris.airlock1 = Closed and then AirLockInvariant,
     Post => AirLockInvariant and solaris.airLock2 = Open;
   
   procedure closeAirLock1 with
     Global => (In_Out => solaris),
     Pre => AirLockInvariant,
     Post => AirLockInvariant and solaris.airLock1 = Closed;
  
   procedure closeAirLock2 with
     Global => (In_Out => solaris),
     Pre => AirLockInvariant,
     Post => AirLockInvariant and solaris.airLock2 = Closed;
   
      
end SpaceStation;
