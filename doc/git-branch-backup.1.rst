#################
git-branch-backup
#################

-----------------------------------------
Create a local backup of your HEAD branch
-----------------------------------------

:Author: jan+git-branch-backup@matejka.ninja
:Date: 2022-08-15
:Copyright: Copyright (c) 2022, Jan Matějka (jan+git-branch-backup@matejka.ninja)
:Manual Section: 1
:Manual Group: git-branch-backup
:Homepage: https://github.com/yaccz/git-branch-backup

SYNOPSIS
========

  git branch-backup

DESCRIPTION
===========

git-branch-backup creates a local backup branch of the branch checked out in PWD by creating another
branch named according to the BACKUP_BRANCH_FMT environment variable.

It can be useful to create a branch backup e.g. before using ``man 1 git-rebase`` in case something
goes wrong so you do not have to go reflog diving (``man 1 git-reflog``).

OPTIONS
=======

None.

ENVIRONMENT
===========

BACKUP_BRANCH_FMT
  Format string used to construct backup branch name via zsh builtin printf ( see ``man 1
  zshbuiltins`` and ``man 3 printf`` ).

  1st argument is current branch name.

  2nd argument is the new backup branch id. Backup branch ids are decimal numbers starting from 1.

  Defaults to ``%1$s.backup/%2$s`` constructing backups like ``master.backup/2`` for ``master``
  branch. Note including the ``/`` in the backup branch name is motivated by existence of IDEs and
  other UIs that display branch names as collapsible tree.

  Example alternative: ``dev/%1$s/%2$s`` constructing backups like ``dev/master/2`` for ``master``.

EXAMPLES
========

Creating backup branches
  Assuming you are standing on ``master`` branch in PWD::

    $ git branch-backup
    Created backup branch 'master.backup/1'

    $ git branch-backup
    Created backup branch 'master.backup/2'

Deleting backup branches
  ::

    $ git branch -d master.backup/{1..666}

Alias for convenience
  ::

    $ git config --global alias.bb branch-backup

EXIT STATUS
===========

0
  Success

>0
  Error

BUILDING
========

::

  $ make build

Build Dependencies
------------------

- `gnu make <https://www.gnu.org/software/make/>`_
- `docutils <https://docutils.sourceforge.io/>`_
- posix.1-2017 utilities

  - `mkdir <https://pubs.opengroup.org/onlinepubs/9699919799/utilities/mkdir.html#tag_20_79>`_
- `gnu coreutils <http://gnu.org/software/coreutils>`_

  - install

INSTALLATION
============

Into system::

  # make install


Into user's HOME::

  $ make install-home

Runtime Dependencies
--------------------

- `zsh <https://www.zsh.org/>`_
- `git <https://git-scm.com/>`_
- `GNU sed <https://www.gnu.org/software/sed/>`_
- `GNU grep <https://www.gnu.org/software/grep/>`_
- `GNU coreutils <http://gnu.org/software/coreutils>`_

  - head
  - sort

TESTING
=======

::

  $ make check

Additional Test Runtime Dependencies
------------------------------------

- `dram - literate functional tests for the CLI <https://git.sr.ht/~rne/dram/tree/master>`_

LICENSE
=======

BSD-3. See `<./LICENSE>`_ file.

SEE ALSO
========

- ``man 1 git``
- ``man 1 git-branch``
- ``man 1 git-rebase``
- ``man 1 git-reflog``
- https://www.matejka.ninja/software/handbook/git.html
