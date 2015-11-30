// DOM Manipulation Challenge


// I worked on this challenge with Chris Gomes.


// Add your JavaScript calls to this page:

// Release 0:


document.getElementById("release-0").className = "done";



// Release 1:
document.getElementById("release-1").style.display = "none";


// Release 2:
document.getElementsByTagName("H1")[0].innerHTML = "I completed release 2.";


// Release 3:
document.getElementById("release-3").style.backgroundColor = "#955251";



// Release 4:
var x = document.getElementsByClassName("release-4");
var i;
for (i = 0; i < x.length; i++) {
    x[i].style.fontSize = "2em";
}

// Release 5:

document.body.appendChild(document.getElementById('hidden').content.cloneNode(true));

=begin
###Reflection
####What did you learn about the DOM?
I'd worked with it before. But this was still pretty trial and error. I learned some more about how the javascript access to the DOM uses different syntax than CSS. I think it would seem more natural if we'd done inline styling in HTML but semantic HTML forbids it! We really just guessed about `fontSize` being camelCase and it worked!

####What are some useful methods to use to manipulate the DOM?
The key seems to be these `getElement` or `getElements` functions, though the latter required some additional manipulation.
=end
