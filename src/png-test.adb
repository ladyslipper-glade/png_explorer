with PNG.Files;

package body PNG.Test is

   procedure Execute_Tests is
      Image : Files.Image_Type;
   begin
      Files.Read (Image, "test-data/tardigradum.png");
   end Execute_Tests;

end PNG.Test;
