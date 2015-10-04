#Think About Time Reflection
Which time management and productivity ideas did you learn about?
What is "Time Boxing?" How can you use it in Phase 0?
How do you manage your time currently?
Is your current strategy working? If not, why not?
Can/will you employ any of them? If so, how?
What is your overall plan for Phase 0 time management?
I actually read through all the links.  The one I dug into most was Tiny Habits, and I'm actually doing BJ Fogg's one week "course" in Tiny Habits next week.  

Time Boxing is the notion of setting a specific time limit for a task and at the end of it stopping and assessing progress.  This is what we're asked to do by limiting the time we spend on some activities like this one---which I didn't really do because I'm not going to feel any time constraints during Phase0--I have plenty of extra time.

The counterintuitive productivity piece hit a little close to home because I can be an epic procrastinator with things that I don't have enthusiasm for.  Hence my new career path, and my current strategy really is to ruthlessly eliminate having to do so many things that aren't fun/interesting/etc.  

Of the topics here, I'm already trying to put into action the Tiny Habits concept, and I know we'll be doing meditation onsite, though I will try to have some more quiet time before then too.  I take long walks where I'm usually listening to podcasts, but I'll add in some quiet reflective time in them.

My overall plan for time management in Phase 0 is actually to put in lots of "extra credit" time, since I have it available and the curriculum does give us lots of optional material.  For example I'll probably work through the "Ruby the Hard Way" course, though it sure sounds like I won't like it as much as I have RubyMonk, which I think is hilarious and effective.

#The Command Line Reflection

1.  A shell is the direct interface between the user and the underlying operating system.  Shells can be CLIs (Command Line Interfaces) as shown in MS-DOS pre-Windows and BASH in Unix.  A  shell can also be a GUI (Graphical User Interface), like Windows or OSX, though often the accessibility of a GUI reduces the flexibility and power available in a CLI.  BASH is 25+ years old and has become the standard Unix shell, I suspect because it is built into Macs.  It stands for Bourne Again SHell, a pun on the name of the author of the prevailing shell at the time.


2. The hour long video of Steven talking about what was on screen in the CLI was truly painful!  It took me multiple tries to get through.  Although I may be a multi-modal learner, I am pretty sure lectures on programming without any "hands-on-keyboard" are going to be hard for me to get the most out of.

3. I had no problems with the commands, other than I'm a Mac newbie and I know enough from MS-DOS that I have to unlearn some things where BASH is different, such as "dir" rather than "ls"

4.  I'm going to need more time in the CLI to know what's most important.  I'd guess cd is most important since otherwise you're stuck in one place.  Then ls, mkdir, rm, and mv, which together cover most file manipulations.  I'm not sure how useful the test editing or directory stacking commands will be since those functions seem often more suited for the GUI.

5. 

-pwd: print the tree of the current directory

-ls:  list contents of current directory

-mv:  move (and/or rename) file or directory

-cd:  change directory

-../:  go back up directory tree one node

-touch: touch a file to update its access or edit datestamp, or create the file if it doesn't already exist

-mkdir: create a new directory

-less:  print/display contents of a file a page at a time, with more options than "more" (which is counterintuitive indeed).  "grep" can be used together with less (or more, or cat) and piping to limit the results to occurrences of particular strings and to broaden the result to more files.  Similarly, less/more/cat can have more than one file as arguments. 

-rmdir: remove directory

-rm:  remove a file, or with -rf, whole directories including their contents.  Very powerful cleanup tool (which means dangerous too!)

-help:  provides shorter info than "man" on a number of commands/features.  
#Forking and Cloning Relection
If I were writing instructions for a newbie to create/fork/clone a repo I would do it in this order:

1.  Play a video of someone else doing it (like Release 1 above).

2.  Ask the student to try to do it independently.

3.  If the student struggles, provide written instructions. The text portion of Release 0 above would be perfect for the create portion, but leaving out the images, so this:

Navigate to your github.com profile. In the top right navigation bar you should see a "+" next to your avatar. Press the "+" and select "New Repository." This will bring you to a new repository page. On the repository page, do the following:

Enter "phase-0" as the repository name. 
Select "public" for your repository visibility (This will enable others to view your work).
Add an "MIT License" to your repository. 
Click "Create Repository" to complete the form.
I think the prompt may be asking me to actually write the prose instructions, so here they'd be for fork and clone:

A. Click here to go to the DBC-created repo we'd like you to fork from.

B. Click in the top right to fork the repo and choose to fork it into your account.  Congrats....you've forked a repo...that wasn't so bad, was it?

C.  Now copy from the right hand side of the screen the unique url for use in cloning this repo.  You don't even have to remember that Macs require CMD-C rather than CTRL-C, because there's a button that copies it to your clipboard.

D.  Finally go to your CLI, make sure you're in the directory that you want to be the parent of the directory containing your repo, and enter "git clone" followed by a paste of the URL. Some BASH/git magical incantations follow, and then you're done.....the cloned repo is now local on your computer. Soon you'll be deciding whether to commit!

4.  If the student still can't do it, provide the images used above in Release 0.

I'd do it in this order because going straight to the images felt a little like a Navigator in a pair session telling you exactly what to type. There's no opportunity to self-discovery or learning other things by playing with menus.

That being said, I struggled a little bit with deleting repositories because the delete feature is so hidden by being under the settings menu and at the bottom of the page. I think I understand--it's a rarely used feature carefully protected against accidental use. I didn't have any problems this week or last with setting up git because the instructions for computer prep went very smoothly. I actually started my GitHub account a few months back to do the Hack Reactor application. Back then I found it not very intuitive at all. I found it much easier this week with just a little guidance from DBC--so I'm learning!

To answer another question, users would want to fork repos rather than create their own because forking a repo is how you'd get a copy of an existing project to work on. It's much like the rapid development branch of the tree we saw in one of the videos. It's also helpful at this point to be cloning a forked repo because there's something in it! Exploring the cloned version of a newly created repo with cd and ls reveals very little--just the MIT license and the different command line prompt that seems to be a result of being in a git-owned directory.

#Tracking Changes Reflection
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