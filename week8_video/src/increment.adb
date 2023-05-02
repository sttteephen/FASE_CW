package body increment with SPARK_Mode
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
   
   function flip (x : FlipBit) return FlipBit
   is
   begin
      if (x = 0)
      then return 1;
      else return 0;
      end if;
   end flip;
   
   function decrement (x : ZeroTen) return ZeroTen
   is
   begin
      return x - 1;
   end decrement;
   
end increment;
