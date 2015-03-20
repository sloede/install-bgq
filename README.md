BGCLANG installation
====================

Getting clang
-------------

1.  Go to `https://trac.alcf.anl.gov/projects/llvm-bgq`
2.  Note the full version as `r<revision>-<YYYYMMDD>` (from now on referred to
    as `<version>`)
3.  `mkdir -p $HOME/bgclang/rpms/<version>`
4.  `cd $HOME/bgclang/rpms/<version>`
5.  Download all files for your clang version (including sh and stage 1)


Installing clang
----------------

1.  `cd $HOME/bgclang/bin`
2.  Open `config` and set the `VERSION` variable to `<version>`
3.  Run `./all.sh` (from within the `bin/` directory!) or execute the scripts
    inside it manually
4.  Commit changes to configuration file to git repository (don't forget to set
    the correct author name/email)


Creating a new module file
--------------------------

1.  `cd /bgsys/local/modulefiles/COMPILER/clang`
2.  Copy latest module file to new module file: `<major>.<minor>.r<revision>`
3.  Modify new module file to reflect new paths
4.  Change default module in `.version` to new module (latest = greatest)
5.  Commit new file to git repository (don't forget to set the correct author
    name/email)


Directory structure
-------------------
    bin/    Executables used for setting up clang
    rpm/    RPM database folder
    rpms/   Folder with .rpm files


Maintainers
-----------

The bgclang installation on JUQUEEN is maintained by:

Sandipan Mohanty <s.mohanty@fz-juelich.de> (+49 2461 61-2526)
Michael Schlottke <m.schlottke@fz-juelich.de> (+49 2461 62-2326)
