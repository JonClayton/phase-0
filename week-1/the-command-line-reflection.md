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
