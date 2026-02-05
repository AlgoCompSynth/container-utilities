# container-utilities

Container hosting, terminal setup, and an AI tool container

`container-utilities was developed on
[Bluefin DX](https://projectbluefin.io/), a container-based
Linux using the GNOME desktop. Among other features,
Bluefin DX ships with the Distrobox and `podman` container
hosting packages that many of my container-based projects
depend on as standard equipment. So I broke this out as
a separate project for use as a git submodule for use on
other modern Linux desktops.

The installs are meant to be run in order.
`1-distrobox-hosting` contains scripts to install `podman`,
`distrobox` and other command-line necessities like `git`
and `vim`. `2-terminal-setup` installs the `starship` shell
prompt generator and the Cascaydia Cove "nerd font".
`3-ai-container-setup` creates a Distrobox container based
on Debian `trixie` with `ollama`, `aider`, and scripts to
install a collection of models.
