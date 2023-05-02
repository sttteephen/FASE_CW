package increm with SPARK_Mode
is
   type Tens is range 1..5;
   
   function bad_incr (x : Tens) return Tens
     with
       Pre => x < Tens'Last - 1,
   Post => bad_incr'Result = x + 1;
   

   procedure bad_proc (x : in out Tens)
     with 
       Pre => x < Tens'Last,
         Post => x = x'Old + 1;
end increm;
