with sorting; use sorting;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   x : SortArray := (10,9,8,7,6,5,4,3,2,1);
   y : SortArray := (10,9,8,7,6,5,4,3,2,1);
begin
   Put("Array to be sorted: (");
   for i in 1..10 loop
      Put(Integer'Image(x(i)));
   end loop;
   Put(")");
   Put_Line("");
   selectSort(x);
   Put("After using selectSort: (");
   for i in 1..10 loop
      Put(Integer'Image(x(i)));
   end loop;
   Put(")");
   Put_Line("");
   Put("Array to be sorted: (");
   for i in 1..10 loop
      Put(Integer'Image(y(i)));
   end loop;
   Put(")");
   Put_Line("");
   insertSort(y);
   Put("After using insertSort: (");
   for i in 1..10 loop
      Put(Integer'Image(y(i)));
   end loop;
   Put(")");
   Put_Line("");



end Main;
