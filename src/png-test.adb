
package body PNG.Test is

   procedure Execute_Tests is
      Image : PNG_Image;
   begin
      Read (Image, "test-data/tardigradum.png");
   end Execute_Tests;

end PNG.Test;
