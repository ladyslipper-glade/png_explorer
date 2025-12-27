with Ada.Sequential_IO;

package body PNG is

   package Byte_IO is new Ada.Sequential_IO (Element_Type => PNG_Byte);

   --  This procedure checks the PNG signature on the given file. It raises Corrupt_Image if the
   --  signature is invalid. It will raise other exceptions from the library if bytes can't be
   --  read from the file when needed.
   --
   procedure Verify_Signature (File : Byte_IO.File_Type) is
      type Signature_Array is array (0 .. 7) of PNG_Byte;

      Expected_Signature : constant Signature_Array := [137, 80, 78, 71, 13, 10, 26, 10];
      Actual_Signature   :          Signature_Array;
   begin
      for I in Signature_Array'Range loop
         Byte_IO.Read (File, Actual_Signature (I));
      end loop;
      if Actual_Signature /= Expected_Signature then
         raise Corrupt_Image with "Bad signature";
      end if;
   end Verify_Signature;

   function Read_Chunk_Size (File : Byte_IO.File_Type) return Natural is
      Raw_Size : array (0 .. 3) of PNG_Byte;
   begin
      for I in Raw_Size'Range loop
         Byte_IO.Read (File, Raw_Size (I));
      end loop;
      --  TODO: Finish Me!
      return 0;
   end Read_Chunk_Size;

   procedure Read (Image : out PNG_Image; File_Name : String) is
      use Byte_IO;
      File : File_Type;
   begin
      Open (File, In_File, File_Name);
      Verify_Signature (File);
      Close (File);
   exception
      when others =>
         if Byte_IO.Is_Open (File) then
            Close (File);
         end if;
         raise;
   end Read;

   procedure Write (Image : PNG_Image; File_Name : String) is
   begin
      raise Not_Implemented;
   end Write;

   function Chunk_Count (Image : PNG_Image) return Natural is
   begin
      return Natural (Image.Chunks.Length);
   end Chunk_Count;

end PNG;
