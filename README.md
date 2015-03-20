bgclang installation
====================

This is a collection of scripts to automate the installation of bgclang nightly
builds. The main website for bgclang is

https://trac.alcf.anl.gov/projects/llvm-bgq

while the nightly builds can be found here:

http://www.mcs.anl.gov/~hfinkel/bgclang/


Preparations
------------

Edit `config` to set all configuration variables for your local system.
Typically, you only need to modify the following variables:
* RPMDIR
* RPMDBPATH
* PREFIX\_BASE
* GCC472\_PATH


Getting bgclang
---------------

Find out current nightly bgclang version:
* manually:
  * Go to `http://www.mcs.anl.gov/~hfinkel/bgclang/`.
  * Note the full version as `r<revision>-<YYYYMMDD>`
    (from now on referred to as `<version>`).
* automatically:
  * Run `./version.sh` and note output.

Run `./download.sh <version>` to download all RPMs.


Installing bgclang
------------------

Run `./install.sh <version>`.

Optional: if you need change the location of the GCC 4.7.2 toolchain files, you
need to run `./modify_path_472.sh` after the installation.


Contribute
----------

The bgclang install scripts are currenly maintained by:

Michael Schlottke (<m.schlottke@fz-juelich.de>)

Feel free to send patches/pull requests to fix broken features or to improve the
overall usability.
