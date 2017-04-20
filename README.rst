git-branch-backup
#################

Creates a local backup of your branch. Usefull to do
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

  $ echo -e "[alias]\n    bb = branch-backup" >> ~/.gitconfig

Dependencies
============

* /bin/sh
* coreutils
* sed

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
