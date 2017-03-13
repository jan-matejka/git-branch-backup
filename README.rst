git-branch-backup
#################

Creates a local backup of your branch.

Assuming you are standing on ``master``::

  $ git branch-backup
  Switched to a new branch 'master.backup1'
  Switched to branch 'master'

  $ git branch-backup
  Switched to a new branch 'master.backup2'
  Switched to branch 'master'

et cetera.

When you are done, you can delete backups with::

  $ git branch -d master.backup{1..666}

Alias for convenience::

  $ echo -e "[alias]\n    bb = branch-backup" >> ~/.gitconfig

Installation
============

::

  # make install
