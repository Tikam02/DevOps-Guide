# Git Advanced Commands

### Branching & Rebasing & squashing

| Command | Description |
| ------- | ----------- |
| `git checkout [branch name] --orphan` | Creates a new branch without the long repository's history. |
| `git rebase [source branch] [target branch]` | Fetch the current commits timeline from the remote branch and apply the new commits from the local branch on top of it |
| `git rebase -i [commit hash]^` | Interactively rebase starting from the parent commit, where `[commit hash]^` specifies the parent commit |
| `git pull origin [source branch] --rebase` | Pull changes from a remote repository using the `rebase` strategy. Default is `merge`. |
| `git pull origin [source branch] --rebase --autostash` | The same as above but performing automatically stash and pop your uncommitted changes when the branch is in a dirty state. |
| `git cherry-pick [commit hash]` | Apply the changes from any branche's commit to the target branch. |
| `git config branch.[branch name].rebase true` | Set a specific branch to always use the `rebase` strategy. |

### Fixing mistakes & destructive

| Command | Description |
| ------- | ----------- |
| `git reset --hard origin/[target branch]` | Reset the local branch to the origin branch's state. **Caution:** your local changes will be lost. |
| `git reset --soft HEAD~1` | Undo the last local commit. The `--soft` flag keeps the changes, if you don't need to keep them, you can use the `--hard` instead. **Caution**, the latter is a descructive command. |
| `git commit --amend` | Modify the most recent commit. Can be used to edit message or add more files to that commit. **Caution**, this changes the commit hash, so do this only while it was not yet pushed to a shared branch. |
| `git revert HEAD~1` | Create a new commit undoing the last commit's changes. |
| `git reflog` | List all the git actions that were executed before. Useful to find a lost commit, then you can try to recover it. |
| `git bisect start` | Useful to find the buggy commit (that possible introduces some bug). After this, you use `git bisect [good|bad]` indicating when the suggested commit is in a `good` or `bad` state. When the issue is found, use `git bisect reset` to reset back to the original state before using the git bisect command.|
| ```git branch --merged \| egrep -v "(*\|master\|dev)" \| xargs git branch -d``` | Delete already merged branches but `master` and `dev` in this example.
| `git clean -df` | Remove untracked files and directories from the working tree. Add `n` to the flags to list all files that would be removed. |
