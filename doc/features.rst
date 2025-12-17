Internal Inspection Features
============================

PNG files are composed of a file signature followed by a series of chunks.

PNG Chunk Structure
-------------------

Every chunk in a PNG file follows a defined format:

1. **Length (4 bytes):** The length of the chunk's data field.
2. **Chunk Type (4 bytes):** A 4-character ASCII name (e.g., ``IHDR``, ``IDAT``).
3. **Chunk Data (Length bytes):** The actual content of the chunk.
4. **CRC (4 bytes):** A cyclic redundancy code used for integrity checking.

Inspecting Critical Chunks
--------------------------

PNG Explorer provides detailed decoding for all critical chunks:

* ``IHDR`` (Image Header): Displays image width, height, and color type.
* ``PLTE`` (Palette): Lists all colors in the palette.
* ``IDAT`` (Image Data): Notes the length and compression status.
