setup::

  $ git init ./
  Initialized empty Git repository in /tmp/cramtests-*/test.t/.git/ (glob)
  $ touch a
  $ git add a
  $ git commit -m "add a" a
  [master (root-commit) ???????] add a (glob)
   1 file changed, 0 insertions(+), 0 deletions(-)
   create mode 100644 a
  $ touch b
  $ git add b
  $ git commit -m "add b" b
  [master ???????] add b (glob)
   1 file changed, 0 insertions(+), 0 deletions(-)
   create mode 100644 b

test backup::

  $ for i in {1..12} ; do git branch-backup; done
  Created backup branch 'master.backup1'
  Created backup branch 'master.backup2'
  Created backup branch 'master.backup3'
  Created backup branch 'master.backup4'
  Created backup branch 'master.backup5'
  Created backup branch 'master.backup6'
  Created backup branch 'master.backup7'
  Created backup branch 'master.backup8'
  Created backup branch 'master.backup9'
  Created backup branch 'master.backup10'
  Created backup branch 'master.backup11'
  Created backup branch 'master.backup12'

  $ git branch
  * master
    master.backup1
    master.backup10
    master.backup11
    master.backup12
    master.backup2
    master.backup3
    master.backup4
    master.backup5
    master.backup6
    master.backup7
    master.backup8
    master.backup9

test hole::

  $ git branch master.backup20
  $ git branch-backup
  Created backup branch 'master.backup21'

test no branch on HEAD::

  $ git checkout -q HEAD~1
  $ git branch-backup
  There is no branch on HEAD
  [1]

test already on backup branch::

  $ git checkout master.backup11
  Previous HEAD position was ???????* add a (glob)
  Switched to branch 'master.backup11'

  $ git branch-backup
  HEAD is already a backup
  [1]

slash in branch name

  $ git checkout -b foo/bar
  Switched to a new branch 'foo/bar'
  $ git branch-backup
  Created backup branch 'foo/bar.backup1'

BACKUP_BRANCH_FMT::

  $ export BACKUP_BRANCH_FMT='dev/%1$s/%2$s'
  $ git branch-backup
  Created backup branch 'dev/foo/bar/1'
  $ git branch-backup
  Created backup branch 'dev/foo/bar/2'
