private with Ada.Containers.Indefinite_Vectors;

package PNG is

   --  Raised when a not implemented subprogram is called.
   Not_Implemented : exception;

   --  Raised when an input image is not a valid PNG image.
   Corrupt_Image : exception;

   --  A separate type for raw data from the PNG file.
   type PNG_Byte is mod 2 ** 8;

   --  An abstract representation of a PNG image.
   type PNG_Image is private;

   --  Reads a PNG image from the indicated file. Raises Corrupt_Image if the format is invalid.
   procedure Read (Image : out PNG_Image; File_Name : String);

   --  Writes a PNG image to the indicated file.
   procedure Write (Image : PNG_Image; File_Name : String);

   --  Returns the number of PNG chunks in the image or zero if the image has not been read.
   function Chunk_Count (Image : PNG_Image) return Natural;

private
   type Chunk_Type is (tEXt, zEXt);
   type CRC_Array  is array (0 .. 3) of PNG_Byte;
   type Data_Array is array (Natural range <>) of PNG_Byte;

   type PNG_Chunk (Size : Natural) is
      record
         Kind : Chunk_Type;
         CRC  : CRC_Array;
         Data : Data_Array (1 .. Size);
      end record;

   package Chunk_Vectors is new Ada.Containers.Indefinite_Vectors
     (Index_Type => Positive, Element_Type => PNG_Chunk);

   type PNG_Image is
      record
         Chunks : Chunk_Vectors.Vector;
      end record;

end PNG;
