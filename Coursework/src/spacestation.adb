package body SpaceStation with SPARK_Mode is
   
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
   
   procedure increaseHeight is
   begin
      solaris.height := solaris.height + 1;
   end increaseHeight;
   
   procedure decreaseHeight is
   begin
      solaris.height := solaris.height - 1;
   end decreaseHeight;
   
   
      
   

end SpaceStation;
