Usage Guide
===========

Running PNG Explorer
--------------------

.. code-block:: bash

    ./png_explorer /path/to/image.png

PNG Explorer requires exactly one PNG file to explore. If no command line arguments are given, the
program will print a usage message and exit as if the `--help` option had been specified.

The PNG file is first validated to ensure it is a well-formed PNG file. Then entails the following
checks:

- The file signature is verified to confirm that the file is indeed a PNG file.
- The IHDR chunk is parsed to extract critical image information such as width, height, bit depth,
  color type, compression method, filter method, and interlace method.
- The checksum of each chunk is validated.
- The order of the chunks is checked against the PNG specification.

Diagnostic messages are printed to the console if any errors are noted.

Once the file has been read, a `png>` prompt is displayed. The prompt appears even if the file is
invalid, allowing you to explore broken PNG files. PNG Explorer is intended to be a diagnostic tool,
so support for invalid files is a key feature.


Basic Options
-------------

Common options are summarized below. For a complete list, see the :doc:`options` page.

.. code-block:: bash

    # Displays help information
    ./png_explorer --help
    
    # Displays the file signature and IHDR chunk only
    ./png_explorer --summary image.png

    # Displays a summary of all chunks in addition to the signature and IHDR chunk.
    ./png_explorer --summary-full image.png

If any of these options are specified, the prompt is not printed. Instead, PNG Explorer exits at
once with an exit code reflecting the validity of the PNG file.

.. todo:: Should the output be in a format conducive to parsing by other tools?


Basic Commands
--------------

Common commands are summarized below. For a complete list, see the :doc:`commands` page.

``quit``
    Exits PNG Explorer.
