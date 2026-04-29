
package PNG.Chunks is

   type Chunk_Type is (tEXt, zEXt);
   type CRC_Array  is array (0 .. 3) of Octet;
   type Data_Array is array (Natural range <>) of Octet;

   type Chunk (Size : Natural) is
      record
         Kind : Chunk_Type;
         CRC  : CRC_Array;
         Data : Data_Array (1 .. Size);
      end record;

end PNG.Chunks;
