##How does tracking and adding changes make developers' lives easier?
By tracking and adding changes we can incorporate the basic journalism questions into what we know about the changes, which is quite useful if that part of the program develops problems or needs updating:
	Who changed it? (shown automatically in git)
	What was the change? (the overall summary in commits and pull request)
	When was it changed? (shown automatically)
	Why was it done? (should be explained in the pull request)
	How was it implemented (the detailed comparison with prior master)
With this information it will be much easier to maintain and improve the code, especially if it was built by multiple people. It may not be THAT hard for one developer to look back at his/her old code and be reminded of what was going on, but it is impossible if it was someone else's code.


##What is a commit?
A commit is a set of one or more changes that are aggregated together and saved into the next version of the file or collection of files. It is the basic building block of the git tracking of changes.

##What are the best practices for commit messages?
(credit to Tim Cook)
	~<50 character summary, capitalized first word
	[a line separation between the summary and next text]
	Summary text in paragraph form, 72 characters wide. It should also follow the following style rules
	[blank lines between paragraphs too]
	- Use imperative. Not passive, not -ing, not past tense.
	[blank lines even in bullet lists, hard for me to remember]
	- bullets are in this format with a dash

	* or this format with asterisk, but not both

	- and should have a hanging indent like this set.

##What does the HEAD^ argument mean?
HEAD is the git term for the top of the stack of commits, meaning the current working version.  To refer to a commit [n] generations earlier in the stack use HEAD~[n]. HEAD^ is shorthand for HEAD~1, meaning the immediate parent of the current commit. We saw this used to explain how to "undo" and commit, since we want to return to the previous version.

##What are the 3 stages of a git change and how do you move a file from one stage to the other? I believe what's referred to here are these statuses:
	- working/untracked (files not yet "watched" by ordering 'git add')
	- staged/changed (files that git knows have been changed)
	- committed (captured as a new version with 'git commit'), with a comment either from CLI via -m [comment] or via the text editor that pops up if -m is not used.

There's another three step process worth noting:
	- create branch ('git checkout -b [branchName]')
	- make commits, using 'git push origin [branchName]' to store remotely
	- issue pull request on GitHub to get owner to main trunk to accept the work done on the branch (and then prune branch at GitHub and locally)

##Write a handy cheatsheet of the commands you need to commit your changes?
I covered this above a bit:
	- git branch [branch-name]
	- touch new-file-name.ext
	- subl new-file-name.ext (or other name to edit existing file)
	- Command-S to save from subl
	- git add . (or git add new-file-name.ext if not all files wanted)
	- git commit to commit all tracked changes (could use git commit -m)
I believe it is better going to be best not to use 'git commit -m' to create the commit message straight from the CLI. If you're in that much of a hurry, you may be doing the commits too frequently. Having the commit text file pop open encourages some thought in the comment title and perhaps some text under it.  

##What is a pull request and how do you create and merge one?
A pull request is a request to the owner of the main project (or at least a more central branch version) to incorporate the branch version that you've been working on. It is performed on GitHub but includes a series of steps locally first to synch up your branch with any changes to the remote master:
	- git checkout master
	- git pull origin master
	- git checkout [branch]
	- git merge master
	- git push origin [branch]
Once all this is done we should have on GitHub a version of our branch that matches the current remote master except for the changes we've made through the stack of commits associated with this branch. We need an approved pull request to merge these changes into the remote master [or more central branch]. GitHub makes the pull request very easy by noting that our branch is different from the master and providing a "Pull request" button.  
	- Press the "pull request" button and see a summary of changes (perhaps having to do the URL hack to get to our fork of the master branch), 
	- Put in a comment to help the master owner evaluate the request. 
	- Press the "Create pull request" button. This sends the request to the owner(s) of the master
When a pull request is received, 
	- Make sure the changes from the branch are desirable
	- Hit the "merge pull request" button to accept the changes
	- Delete the branch
Once the pull request has resulted in the branch being merged into the master and deleted from GitHub, it appears that the original git user has to indepenedently delete the branch from his/her machine, which seems like a flaw to me.

##Why are pull requests preferred when working with teams?
The alternative to a pull request is a direct push of the change into the master.  On a team this is a bad idea because:
	- it is useful to have a second set of eyes look at the changed product to make sure it works and that the changes are well documented
	- the pull request process is a great way for the project manager to understand what different parts of the team have been doing
	-  when the underlying master is the actual product being used, multiple layers of review are needed to make sure it doesn't crash due to flaws in a revision.
