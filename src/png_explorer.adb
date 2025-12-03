with Ada.Sequential_IO;

procedure Png_Explorer is
   type Byte_Type is mod 2**8;
   package Byte_IO is new Ada.Sequential_IO (Byte_Type);

   File : Byte_IO.File_Type;
   Byte : Byte_Type;
begin
   Byte_IO.Open (File, Byte_IO.In_File, "tardigradum.png");

   while not Byte_IO.End_Of_File (File) loop
      Byte_IO.Read (File, Byte);

      --  Process byte

   end loop;

   Byte_IO.Close (File);
end Png_Explorer;
