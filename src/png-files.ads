private with Ada.Containers.Indefinite_Vectors;
with PNG.Chunks;

package PNG.Files is

   --  PNG Explorer supports processing invalid PNG files. Thus, "Image" is approximate.
   type Image_Type is private;

   --  Reads a PNG image from the indicated file. Raises Bad_Signature if there is no signature.
   procedure Read (Image : out Image_Type; File_Name : String);

   --  Writes a PNG image to the indicated file.
   procedure Write (Image : Image_Type; File_Name : String);

   --  Returns the number of chunks in the image or zero if the image has not been read.
   function Chunk_Count (Image : Image_Type) return Natural;

private
   package Chunk_Vectors is new
     Ada.Containers.Indefinite_Vectors
       (Index_Type   => Positive,
        Element_Type => Chunks.Chunk,
        "="          => Chunks."=");

   type Image_Type is record
      Chunks : Chunk_Vectors.Vector;
   end record;

end PNG.Files;
