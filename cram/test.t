setup::

  $ git init ./
  Initialized empty Git repository in /tmp/cramtests-????????/test.t/.git/ (glob)
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
  Switched to a new branch 'master.backup1'
  Switched to branch 'master'
  Switched to a new branch 'master.backup2'
  Switched to branch 'master'
  Switched to a new branch 'master.backup3'
  Switched to branch 'master'
  Switched to a new branch 'master.backup4'
  Switched to branch 'master'
  Switched to a new branch 'master.backup5'
  Switched to branch 'master'
  Switched to a new branch 'master.backup6'
  Switched to branch 'master'
  Switched to a new branch 'master.backup7'
  Switched to branch 'master'
  Switched to a new branch 'master.backup8'
  Switched to branch 'master'
  Switched to a new branch 'master.backup9'
  Switched to branch 'master'
  Switched to a new branch 'master.backup10'
  Switched to branch 'master'
  Switched to a new branch 'master.backup11'
  Switched to branch 'master'
  Switched to a new branch 'master.backup12'
  Switched to branch 'master'

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

  $ git checkout -b master.backup20
  Switched to a new branch 'master.backup20'
  $ git checkout master
  Switched to branch 'master'
  $ git branch-backup
  Switched to a new branch 'master.backup21'
  Switched to branch 'master'

test no branch on HEAD::

  $ git checkout -q HEAD~1
  $ git branch-backup
  There is no branch on HEAD
  [1]

test already on backup branch::

  $ git checkout master.backup11
  Previous HEAD position was ???????... add a (glob)
  Switched to branch 'master.backup11'

  $ git branch-backup
  HEAD is already a backup
  [1]
