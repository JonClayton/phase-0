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
