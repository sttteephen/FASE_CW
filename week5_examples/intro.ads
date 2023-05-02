package intro is

   procedure myProc (myVar : in out Integer);

   function myFunc (myVar : Integer) return Integer;
   
   procedure forLoopProc (myVar : in out Integer);
   
   function caseEg (myVar : Integer) return Integer;
   
   type MyArray is array (1..5) of Integer;
   
   procedure arrayEg (myArr : in out MyArray);
   
   function arrayEg2 (myArr : MyArray) return Integer;

end intro;
