package body intro is

   procedure myProc (myVar : in out Integer)
   is
   begin
      myVar := myVar + 1;
      if (myVar > 3)
        then myVar := myVar + 2;
        else myVar := myVar - 1;
      end if;
   end myProc;
   
   function myFunc (myVar : Integer) return Integer
   is
      res : Integer := myVar;
   begin
      while res > 0 loop
         res := res - 10;
      end loop;
      return res;
   end myFunc;
   
   procedure forLoopProc (myVar : in out Integer)
   is
   begin
      for i in 1..10 loop
         myVar := myVar + i;
      end loop;
   end forLoopProc;
   
   function caseEg (myVar : Integer) return Integer
   is
   begin
      case myVar is
         when 0 => return 1;
         when 1 => return 0;
         when 2 => return 4;
         when others => return -1;
      end case;
   end caseEg;
   
--   type MyArray is array (1..5) of Integer;
   
   procedure arrayEg (myArr : in out MyArray)
   is
   begin
      for i in 1..5 loop
         myArr(i) := myArr(i) + 1;
      end loop;
   end arrayEg;
   
   function arrayEg2 (myArr : MyArray) return Integer
   is
      res : Integer := 0;
      pos : Integer := myArr'First;
   begin
      while pos < myArr'Last loop
         res := res + myArr(pos);
         pos := pos + 1;
      end loop;
      res := res + myArr(myArr'Last);
      return res;
   end arrayEg2;
   
   
   
   
   
   
   
   
   
   
      

end intro;
