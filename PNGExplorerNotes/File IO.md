# Comments on File Handling

PNG Explorer needs to reliably read and write PNG files according to the PNG specification. The approach I've adopted is to introduce a type `Octet` to represent one byte of data from the file, and then use `Sequential_IO` to read and write PNG files one octet at a time. This puts the burden on me to do all the decoding and interpretation of every field in the file.

This might sound tedious, but it feels more honest than trying to representation clauses or `Stream_IO`. Keep in mind that PNG Explorer is intended to function even when given a corrupted PNG file; one of its main use cases is diagnostic. It is therefor important to be extremely defensive when reading data from the file and make no assumptions about its validity or sensibility.

By manually parsing every field, I can include explicit error handling at the point where the data is read to ensure validity before assigning the data to more abstract types.

This decision can be revisited in the future, of course.