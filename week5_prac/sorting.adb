package body sorting is
   
   procedure arrInsert (from : in Integer; to : in Integer; arr : in out SortArray)
   is
      val : Integer := arr(from);
   begin
      for i in reverse (to + 1)..from loop
         arr(i) := arr(i-1);
      end loop;
      arr(to) := val;
   end arrInsert;
   
   function minInd (arr : SortArray; i : Integer) return Integer
   is
      res : Integer := i;
   begin
      for j in (i+1)..10 loop
         if arr(j) < arr(res) then res := j; end if;
      end loop;
      return res;
   end minInd;
   
   procedure selectSort (arr : in out SortArray)
   is
      nxtMin : Integer := 1;
   begin
      for i in 1..10 loop
         nxtMin := minInd(arr,i);
         arrInsert(nxtMin,i,arr);
      end loop;
   end selectSort;
   
   function getNewInd (arr : SortArray; i : Integer) return Integer
   is
      res : Integer := 1;
   begin
      while res < i loop
         if arr(i) < arr(res) 
            then return res;
            else res := res + 1;
         end if;
      end loop;
      return res;
   end getNewInd;
   
   procedure insertSort (arr : in out SortArray)
   is
      to : Integer := 1;
   begin
      for i in 2..10 loop
         to := getNewInd(arr,i);
         arrInsert(i,to,arr);
      end loop;
   end insertSort;
   
   
            
   
         
   
      
      
      
      
      
      
      
      

end sorting;
