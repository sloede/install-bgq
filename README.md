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

Run `./download.sh <version>` to download all RPMs. If you would like to
specify a patch release, you can supply it as an additional argument by running
`./download.sh <version> <release>`, where `<release>` defaults to `1`.


Installing bgclang
------------------

Run `./install.sh <version> [<release>]`.

The patch release number `<release>` is optional and defaults to `1`.

Optional: if you need change the location of the GCC 4.7.2 toolchain files, you
need to run `./modify_path_472.sh <version> [<release>]` after the installation.


Cron job
--------

You can automate the installation of the nightly builds by calling `cron.sh`
through a cron job. It will fetch the current nightly version from the bgclang
nightly builds website (see above), check if it needs to be installed, download
all packages and install it. Additionally, it will create a `nightly` symbolic
link that points to the new version. By default, the previous nightly version is
removed after a sucessful installation of the new build, but this can be
disabled in the `config` file.


Contribute
----------

The bgclang install scripts are currenly maintained by:

Michael Schlottke-Lakemper (<m.schlottke-lakemper@fz-juelich.de>)

Feel free to send patches/pull requests to fix broken features or to improve the
overall usability.
