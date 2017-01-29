dmd.snap
========

This project defines a snap package for DMD, the reference compiler for
the D programming language.  It is an 'external' snap, meaning that it
downloads and builds the source from the official DMD git repo.
For more information on DMD, see: https://github.com/dlang/dmd

The package also includes rdmd, dustmite and ddmangle from among the
core developer tools: https://github.com/dlang/tools

The D programming language is a systems programming language with C-like
syntax and static typing.  It combines efficiency, control and modelling
power with safety and programmer productivity.  For more information on
the D language, see: https://dlang.org/

Snap packages are designed to provide secure, containerized applications
that are appropriately sandboxed away from the rest of the system they
are running on.  For more information on snap packages, see:
http://snapcraft.io/


Building
--------

On Ubuntu 16.04 or higher with snapcraft installed
(`sudo apt install snapcraft`):

    git clone https://github.com/dlang-snaps/dmd.snap.git
    cd dmd.snap
    snapcraft

To ensure a clean build, install LXD (`sudo apt install lxd`), configure
its network settings, and then:

    snapcraft cleanbuild

to build the snap inside an LXD container.


Installing
----------

DMD has been packaged as a `classic` snap, so installing it requires the
`--classic` flag to be used in order to grant the necessary confinement
permissions.  Self-built snaps are unsigned and therefore also require
the `--dangerous` flag in order to install them:

    sudo snap install --classic --dangerous dmd_VERSION_amd64.snap

replacing `VERSION` as appropriate.

For more information on `classic` confinement, see:
https://insights.ubuntu.com/2017/01/09/how-to-snap-introducing-classic-confinement/
