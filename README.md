# PNG Explorer

A tool to display PNG file internals.

This is my first attempt at using Ada. If it's a mess, that would be why.

Anne

## Setup

NOTE: This repository makes use of Git LFS. Be sure you have Git LFS installed before you clone
this repository. If the command `git lfs version` returns an error about how `lfs` is an unknown
Git command, then you do *not* have Git LFS installed, and you will need to address that. For
example, on Ubuntu Linux:

```bash
sudo apt install git-lfs
git lfs install
```

The first command installs the necessary software system-wide. The second command adds the Git
LFS filters to your global `.gitconfig` file. You can then clone and work with this repository
normally. If you accidentally cloned this repository without having Git LFS installed, you can
fix your clone using `git lfs pull`. This will resolve the pointers to the large files with
their contents.

This project uses [Alire](https://alire.ada.dev/) as its build and packaging tool. After
installing Alire, use `alr toolchain --select` to select an Ada toolchain appropriate for your
system. In general, you will want the latest version of the "native" toolchain. This command
will download and install the necessary toolchain if you don't already have it installed. You do
not need to install an Ada compiler manually.

I use Linux as my primary development platform for this project, but it should be possible to do
development on any platform supported by Alire.

PNG Explorer can be built using:

```bash
alr build
```

The executable can be run via Alire using:

```bash
alr run
```

Note that all `alr` commands should be run from the root of the project repository.

The executable, `png_explorer`, is also placed in the `bin` folder by the build process. It can
be run directly from there.

There are no tests at this time, but I hope to address that issue in the near future.

## Editor Setup

For a good editing experience, you will want to install the [Ada Language
Server](https://github.com/AdaCore/ada_language_server) from AdaCore somewhere in your `PATH`.
Any editor that supports the Language Server Protocol (LSP) should be able to pick up the
language server and use it to provide Ada-aware editing intelligence. I use two editors,
depending on my mood: [Visual Studio Code](https://code.visualstudio.com/) and
[Helix](https://helix-editor.com/).

### Visual Studio Code

To use VS Code effectively, it should be launched from Alire. This gives Alire the chance to set
the environment so the Ada toolchain will be found in the `PATH` by VS Code. If you start VS
Code in some other way, it won't know where the Ada compiler is located, giving you an inferior
editing experience. Start by doing:

```bash
alr edit --select-editor
```

Be sure VS Code is selected as your primary editor. Then, launch VS Code by doing:

```bash
alr edit
```

This will open VS Code on the project folder as desired. Recommended extensions will then be
installed (with confirmation) if they are not already.

### Visual Studio Code in WSL

If you are using WSL on a Windows system for development, using Visual Studio Code is
straightforward. Be sure you have the WSL extension installed. Then, inside WSL, launch Visual
Studio Code exactly as described above. Note that certain extensions will need to be
(re)installed in WSL so they can access the project's files. Visual Studio Code maintains a
distinction between "local" extensions installed in the enclosing Windows environment, and "WSL"
extensions installed in the WSL environment.

### Helix

First, install the [Ada Language Server](https://github.com/AdaCore/ada_language_server)
somewhere on your `PATH`. Next, tell Alire that you are using Helix as your editor by doing:

```bash
alr edit --select-editor
```

Select the "Other" editor option, and provide the command line `hx ${CRATE_ROOT}`. You can then
start Helix with the right environment using `alr edit` as before. Helix will immediately jump
into the file picker starting at the root of the repository.

## AI Assistants

I am interested in learning how to use AI coding assistants. This repository contains a
`WARP.md` file which provides context for [Warp Terminal](https://www.warp.dev/). The initial
version of this file was created by Warp itself, but can be edited freely to improve the context
information known to the agent. I may experiment with other agents in the future (Gemini CLI or
Claude Code), but I don't know which of them would be best for use with Ada.

## Documentation

The documentation is in reStructuredText (RST) format in the `doc` folder. It can be compiled
into HTML (and potentially other formats) using the Sphinx tool. To install Sphinx, you will
first need to configure a Python virtual environment in the root of the project:

```bash
python -m venv .venv
```

Next, activate that environment using:

```bash
source .venv/bin/activate
```

You can use the `deactivate` command to return to the global Python environment when you are
ready to do so. On Windows, with PowerShell, activate the environment using the command
`.venv\Scripts\Activate.ps1`.

Finally, install the packages defined in `requirements.txt` using:

```bash
pip install -r requirements.txt
```

Now you are ready to compile the documentation. Go into the `doc` folder and do:

```bash
make html
```

The HTML documentation is put into `doc/_build/html`.

## License

This project is licensed under the **MIT License** or the **Apache License, Version 2.0**, and
with the LLVM exception. See the file `LICENSE` for the full text of the Apache version 2.0
license.
