package body increm with SPARK_Mode
is

   function bad_incr (x : Tens) return Tens
   is
   begin
      return x + 1;
   end bad_incr;
   
   procedure bad_proc (x : in out Tens)
   is
   begin
      x := x+1;
   end bad_proc;
   
   

end increm;
