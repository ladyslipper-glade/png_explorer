package PNG is

   --  Raised when a not implemented subprogram is called.
   Not_Implemented : exception;

   --  Raised when the PNG file has an invalid signature.
   Bad_Signature : exception;

   --  A separate type for raw data from the PNG file.
   type Octet is mod 2 ** 8;

   --  An abstract representation of a PNG image.

end PNG;
