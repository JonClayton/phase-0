#My Website-1 Reflection

##Paste a link to your [USERNAME].github.io repository.
https://github.com/JonClayton/jonclayton.github.io

##Explain how to create a repository on GitHub and clone the repository to your local computer to a non-technical person.
First you should understand what these terms mean:
	"GitHub"	a website that provide a place to not only store files for you, but also allows multiple users to edit those files simultaneously and maintain version control with the public domain software called "git."
	"repository" is GitHub's term for what you might call a folder of files.
	"clone" in this case means create a duplicate copy of a repository on another computer.
With this in mind, once you have a GitHub account (which I can also help you set up!), you create a repository simply by pressing a button called "+ New Repository." You'll find it on the front page of your account.  You can get there from any other GitHub page by clicking on the OctoCat symbol in the top left corner.
When you click on the button to create a new repository, you get a screen where you have to make a few choices:
	- Name your repository. GitHub will even offer you a (rather bizarre) suggestion. I suggest your first repository be called my-first-repository. I have much less imagination than GitHub.
	- Description is optional and if your name is explanatory, description is unnecessary.
	- you can pick public or private. I suggest public because that's free and then I can help you with it.
	- you should check the box to initialize the repository with a README file. Otherwise there's no contents, which means we'll have nothing to clone.
	- I don't know that .gitignore means. So ignore it. The MIT license basically gives anyone permission to do what they want with your GitHub files, so they won't hassle you by asking permission. As long as you don't have anything you think is valuable here, pick that for "Add a license"
	- then press "Create a repository" and you'll have one.
	- on the page that opens up that is essentially the front page for your repository, press the button on the right edge of the screen that says "copy to clipboard" when you mouse over it.
Next we clone the repository to your laptop, on which I have already helpfully installed the needed software "git".  
	- Go to your command line (on a Mac, use Finder to find and open terminal)
	- use cd to get to a directory in which you'd like a folder holding this repository, if it's not the default (the folder named after you as a user).  
	- Type on the command line the following: git clone
	- then paste from the clipboard the website address you copied from GitHub. Make sure there's a space after the word clone.  Hit return.  
Now you have a cloned version of the repository on your computer.  Use whatever file browser you like to see the new folder and the README and LICENSE files in it.

##Describe what open source means.
Open source is software whose owner allows users to see the source code, change it to suit their purposes, and redistribute it.  Such software is almost always free, though that's not part of the definition. There's a more precise term, Free and Open Source Software (FOSS) that describes most open source software.  Much of the benefit of open source software (in contrast to freeware) is that public access to the code allows users to develop improvements and suggest them to the owner, who can incorporate them in subsequent versions. 

##What do you think about Open Source? Does it make you nervous or protective? Does it feel like utopia?
I'm a believer in the power of a market economy. The ability to make money from protected intellectual property provides an incentive to create things that MIGHT not otherwise exist. But there are other incentives, and they can be very powerful. I think the single greatest contribution of the internet is Wikipedia, which although not "software" is driven by the same collaborative, donated effort that drives most open source software. Lots of open source software has been successful too, starting with Linux.  But I don't think open source is utopia, since I'm quite sure lots of valuable software would not be developed (or at least not nearly as quickly) without a profit motivation. Although I should be careful about this. Open source owners can make money seeking donations, and I am sure they get some (as Wikipedia does).  But I don't think they get very much compared to the value of the effort they and collaborators put in.
The question about "nervous or protective" revolves around why you're writing code. If it is a hobby, open source is great because you can collaborate with others, get help with your project, etc.  But if you're trying to make money for your efforts, I'm not sure how well open source can serve that goal. So it is utopia for hobbyist, but for profit-driven developers the equivalent to open source is countries where intellectual property is not protected and that sure sounds more like Pandemonium than Utopia.

##Assess the importance of using licenses.
Licenses make it clear (well as clear as legal language can be) to users what they can do with the software. There are multiple versions of open source software. In the case of DBC and its suggestion that we use the MIT license, the point of the license is really to make it clear to users who find our code on GitHub that we don't want to be bothered by them asking permission to use it. They can just go ahead and leave us alone.  Other licenses do more to maintain some control over code or at least assure that the original programmer continues to get "credit" for developing it. Like any other legal document, the point of using licenses is to answer questions all at once in advance rather than one at a time after circumstances may have changed in unexpected ways.

##What concepts were solidified in the challenge? Did you have any "aha" moments? What did you struggle with?
There weren't any "uh-oh's" in this challenge, unlike the prior one where I got stalled for a while on the SublimeText2 install not being quite right.  I had an aha moment when I realized that there was a reason for my name appearing twice in the repository name, though my first thought was so that DBC could fork it into their own account and still know whose it was.  It's cool that it generates a short website name.  I didn't struggle with anything.

##Did you find any resources on your own that helped you better understand a topic? If so, please list it.
I think the only resource I looked at other than links provided in the curriculum was Wikipedia on Open Source Software and Free Open Source Software.  I've used Wikipedia a fair amount so far since it tends to pop up first when I research terminology.