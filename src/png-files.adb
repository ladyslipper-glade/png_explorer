with Ada.Sequential_IO;

package body PNG.Files is

   package Octet_IO is new Ada.Sequential_IO (Element_Type => Octet);

   --  This procedure checks the PNG signature on the given file. It raises Bad_Signature if the
   --  signature is invalid. It will raise other exceptions from the library if bytes can't be
   --  read from the file when needed.
   --
   procedure Verify_Signature (File : Octet_IO.File_Type) is
      type Signature_Array is array (0 .. 7) of Octet;

      Expected_Signature : constant Signature_Array :=
        [137, 80, 78, 71, 13, 10, 26, 10];
      Actual_Signature   : Signature_Array;
   begin
      for I in Signature_Array'Range loop
         Octet_IO.Read (File, Actual_Signature (I));
      end loop;
      if Actual_Signature /= Expected_Signature then
         raise Bad_Signature;
      end if;
   end Verify_Signature;

   function Read_Chunk_Size (File : Octet_IO.File_Type) return Natural is
      Raw_Size : array (0 .. 3) of Octet;
   begin
      for I in Raw_Size'Range loop
         Octet_IO.Read (File, Raw_Size (I));
      end loop;
      --  TODO: Finish Me!
      return 0;
   end Read_Chunk_Size;

   procedure Read (Image : out Image_Type; File_Name : String) is
      use Octet_IO;
      File : File_Type;
   begin
      Open (File, In_File, File_Name);
      Verify_Signature (File);
      Close (File);
   exception
      when others =>
         if Octet_IO.Is_Open (File) then
            Close (File);
         end if;
         raise;
   end Read;

   procedure Write (Image : Image_Type; File_Name : String) is
   begin
      raise Not_Implemented;
   end Write;

   function Chunk_Count (Image : Image_Type) return Natural is
   begin
      return Natural (Image.Chunks.Length);
   end Chunk_Count;

end PNG.Files;
