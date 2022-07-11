git-branch-backup
#################

Creates a local backup of your branch. Useful to do
`before git-rebase`_ in case it goes wrong so you do not have to go reflog
diving.

.. _before git-rebase: http://www.headdesk.cz/computers/git/rebase.html

Assuming you are standing on ``master``::

  $ git branch-backup
  Created backup branch 'master.backup1'

  $ git branch-backup
  Created backup branch 'master.backup2'

et cetera.

When you are done, you can delete backups with::

  $ git branch -d master.backup{1..666}

Alias for convenience::

  $ git config --global alias.bb branch-backup

Environment variables
=====================

BACKUP_BRANCH_FMT
  Format string used to construct backup branch name via ``man 3 printf``.

  1st argument is current branch name.

  2nd argument is the new backup branch id.

  Defaults to ``%1$s.backup%2$s`` constructing backups like ``master.backup2`` for ``master``
  branch.

  Example alternative: ``dev/%1$s/%2$s`` constructing backups like ``dev/master/2`` for ``master``.

Dependencies
============

* zsh
* coreutils
* sed
* GNU grep

For tests:

* https://pypi.python.org/pypi/cram

Installation
============

::

  # make install

Tests
=====

::

  $ make check
