git-branch-backup
#################

Creates a local backup of your branch.

Assuming you are standing on ``master``::

  $ git branch-backup
  Created backup branch 'master.backup1'

  $ git branch-backup
  Created backup branch 'master.backup2'

et cetera.

When you are done, you can delete backups with::

  $ git branch -d master.backup{1..666}

Alias for convenience::

  $ echo -e "[alias]\n    bb = branch-backup" >> ~/.gitconfig

Installation
============

::

  # make install

Tests
=====

::

  $ make check
