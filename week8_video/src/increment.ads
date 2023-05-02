package increment with SPARK_Mode
is
   
   type Tens is range 1..10;
   
   function bad_incr (x : Tens) return Tens
     with
       Pre => x < Tens'Last - 1,
   Post => bad_incr'Result = x + 1;
   

   procedure bad_proc ( x: in out Tens)
     with
       Pre => x < Tens'Last,
       Post => x = x'Old + 1;
   
   
   type FlipBit is range 0..1;
   function flip (x: FlipBit) return FlipBit
     with
       Post => flip'Result /= x;
   
   type ZeroTen is range 0..10;
   function decrement (x : ZeroTen) return ZeroTen
     with 
       Pre => x > ZeroTen'First,
       Post => decrement'Result + 1 = x;
   
   
   
end increment;
