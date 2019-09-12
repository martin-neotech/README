# GIT COLLABORATION

## Forks

The general idea is to fork the neo4j repositories (for example neo4j) to your own github account.

This can be performed with a simple click from the github interface when logged in.

Then have all development happening in branches in your own forked repository.

One branch per feature or however you decide to structure it.

Unused branches, for example the version branches (2.1-maint, 2.2, 2.3 a.s.o) can be removed from your fork and deleting branches there will not delete them in the upstream neo4j repository.

That way you can have a clean repository with only the branches that you're working on.

**Example:**

Let's say you have cloned the upstream repository.

You can then rename that to upstream and add your own fork, like so:

```
git clone git@github.com:neo4j/neo4j.git
git remote rename origin upstream
git remote add origin git@github.com:your-github-username/neo4j.git
git fetch origin
```

The last fetch is perhaps unnecessary, but generally it's a good thing after you've added a fork to your repository list.


##Branches

When developing new stuff do that in branches, as isolated as possible.
These branches will be used for issuing pull requests later, hence the value of isolating features from each other.

So assuming you'd like to branch off from master:

```
git checkout 2.3
git checkout -b 2.3-my-new-feature
```

will create the branch 2.3-my-new-feature from the 2.3 branch.

The branch is currently only a local branch not pointing to any remote branch. You push it to your fork and initially associate it when you push your first changes.

Assuming you've committed something do:

```
git push -u origin HEAD
```

which will push your changes to a remote branch in your fork with the same name as your current local banch, i.e. 2.3-my-new-feature. Any consecutive pushes can either just be done with git push (for pushing changes to all your local branch to which ever remote branches they are associated with) or git push origin HEAD (for pushing changes from your current branch only).
Keeping your branch in sync with neo4j (upstream)
As your branch lives on it will probably get more commits to it, but at the same time lag behind neo4j upstream branch it was created from, as other features and changes goes in there. Constantly syncing up with upstream is a good practice to avoid a potentially big merge later. If you only have got local commits in your branch you can do a "rebase" to temporarily undo your changes, pull in new commits from upstream and apply all your commits on top of those, keeping commits and messages, essentially moving them to the top of the git log.

```
git fetch upstream
git rebase upstream/2.3
git push -f origin HEAD
```

If you've got already pushed changes, i.e. you have a remote branch that your branch point to and don't want to rewrite its history (for example if you're collaborating with other developers on that branch) you're better off merging instead of rebasing to keep the git history intact:

```
git fetch upstream
git merge upstream/2.3
```

## Pull Requests

When you're considered DONE with your feature or similar and would like to get someone else to do peer review for then finally going into master you issue a pull request for your branch.

This can be done via the github interface by:

going to your repository

then to "branches"

select your branch and then clicking the "Pull Request"

Enter description and which branch you'd like to merge into, default is neo4j:master. The pull request will be visible under https://github.com/neo4j/neo4j/pulls
When someone is reviewing your pull request you get mail notifications on updates, please respond appropriately to keep the peer review and conversation moving forward.

### Reviewing a Pull Request

Here you're responsible for doing peer review of the changes, making sure definition of DONE is met a.s.o.

You can either comment right in the pull request, on a commit, or even on a line in a commit.

For any non-trivial pull request it's a good custom to checkout the feature branch locally and poke around.

If you haven't checked out any branch from this fork before then you need to add it to the list of repositories in your own corresponding repository

(using Jakob as an example):

If you'd like push access and Jake has been kind enough to add you as a collaborator for his fork then do:

```
git remote add jake git@github.com:jakewins/neo4j.git
```

otherwise it's something like:

```
git remote add jake https://github.com/jakewins/neo4j.git
```

then do:

```
git fetch jake
git checkout 2.2-a-nice-feature
```

which will find 2.2-a-nice-feature in jakes fork, create a local branch for it if it doesn't exist and automatically associate it with jakes remote branch. If you've got push access you can now even push to his branch and it will show up in the pull request automatically.

If there's a need for enhancing the pull request, the author or possibly you can make additional commits to the branch and push them just as usual and they will show up in the pull request as part of the conversation, and the discussion moves on from there. When you're happy with the pull request click the green "Merge" button.
If the merge button isn't visible, but instead a greyish bar is visible, this means that merging the pull request would result in conflicts. This is the authors responsibility to keep up to date and resolve, so ping him/her about it. The changes will then be visible in the pull request as part of the conversation and the green "Merge" button should be visible again.



## Useful Git Commands

**Case:** Create a new branch from where you are (the current branch) you're on right now:

```
git checkout -b my-new-branch
```

```
git branch topic/wip     # (1)
git reset --hard HEAD~3  # (2)  NOTE: use $git reset --soft HEAD~3 (explanation below)
git checkout topic/wip   # (3)
```

> Note: due to the "destructive" effect of a `git reset --hard` command (it does resets the index and working tree.
> Any changes to tracked files in the working tree since <commit> are discarded), I would rather go with:

```
git reset --soft HEAD~3  # (2)
```

> This would make sure I'm not losing any private file (not added to the index).
> The `--soft` option won't touch the index file nor the working tree at all (but resets the head to <commit>, just like all modes do).


**Case:** See which commits my branch has that another branch (usually master) doesn't:

```
git cherry -v master
```

**Case:**  See a file as it is in another branch (usually master) (since that file might have modifications in your branch, and you'd like to see the full file instead of the diff for it):

```
git show master:path/to/MyFile.java
```


