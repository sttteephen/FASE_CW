package sorting is

   type SortArray is array (1..10) of Integer;

--   function arrIm (x : SortArray) return String;

   procedure arrInsert (from : in Integer; to : in Integer; arr : in out SortArray);

   function minInd (arr : SortArray; i : Integer) return Integer;

   procedure selectSort (arr : in out SortArray);

   function getNewInd (arr : SortArray; i : Integer) return Integer;

   procedure insertSort (arr : in out SortArray);

end sorting;
