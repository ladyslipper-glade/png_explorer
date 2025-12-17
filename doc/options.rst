Command Line Options
====================

.. program:: PNG Explorer

This section details all available command line options.

.. option:: -s, --summary

   Displays only the PNG file signature and the mandatory IHDR chunk. This is a quick way to
   verify the file is a valid PNG and inspect its dimensions and color depth.

.. option:: -c <CHUNK_NAME>, --chunk <CHUNK_NAME>

   Displays the full hexadecimal and parsed data for a single specified chunk. This option is
   useful for deep inspection.
   
   Example:
   
   .. code-block:: bash
      
      $ ./png_explorer --chunk tEXt my_image.png

.. option:: --edit

   Enables experimental editing mode. **Warning:** This will modify the target file.
   
   .. seealso:: The :ref:`Editing Features` section for details on commands available in edit mode.