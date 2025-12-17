Usage Guide
===========

Running PNG Explorer
--------------------

The program is run by specifying the path to the PNG file you wish to inspect. If no options are
given, PNG Explorer will print a summary of all chunks in the file.

.. code-block:: bash

    $ ./png_explorer /path/to/image.png

Basic Options
-------------

Common options are summarized below. For a complete list, see the :doc:`options` page.

.. code-block:: bash

    # Displays help information
    $ ./png_explorer --help
    
    # Shows the file signature and IHDR chunk only
    $ ./png_explorer --summary image.png