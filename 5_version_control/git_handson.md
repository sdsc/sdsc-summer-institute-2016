## Setup ##

`mv ~/.gitconfig ~/.gitconfig~`
`mv ~/.bash_aliases ~/.bash_aliases~`
`PS1="$ "`

## Introduction ##

-   Show the slides

## Setting up Git ##

```
$ git config --global user.name "Your Name"
$ git config --global user.email "your@email.com"
$ git config --global color.ui "auto"
$ git config --global core.editor "nano -w"
```
-   Talk about how git is run with subcommands `git <verb>`

## Creating a repository ##

-   `mkdir guacamole; cd guacamole`
-   `git init`
-   `ls -a`
-   `git status`

## Tracking changes ##

-   `nano instructions.txt`
-   Write a super simple recipe.
    -   Chop avocados, squeeze lime, add salt, and mix well
-   `git status`
    -   One untracked file
-   `git add instruction.txt`
-   Explain the staging area
-   `git status`
-   `git commit`
-   `git status`
-   `git log`

-   `nano instructions.txt`
-   Change one or two of the lines in the recipe
-   `git status`
-   `git diff`
-   Discuss how to read a diff
-   `git add; git commit`
-   `git log`
-   Draw a diagram of the three "areas" of git

-   Socrative Question #1
-   Socrative Question #2

-   Add a new file `ingredients.txt` with all of the ingredients; add and commit
-   Add a new ingredient, onion, to both the instructions and the ingredients;
    add and commit
-   Discuss changes to multiple files

-   `git log`

-   Socrative Question #3 (bio)


## History ##


-   `git diff HEAD~1 instructions.txt`
-   `HEAD` refers to the most recent commit
-   `~1` means "minus one"
-   `git diff <HASH> instructions.txt`

-   If we can see past states, we can also restore them!
-   `nano instructions.txt` Make a bad change
-   `git status`
-   `git checkout HEAD instructions.txt`
-   Notice that reverting a small change is much easier becuase we've split
    our work up into multiple files.

-   Socrative Question #4
-   Socrative Question #5

## `.gitignore` ##

-   `nano a.log; nano b.log`
    What if we include some files that we don't want to track?
-   `git status` could get abnoxious
-   `nano .gitignore`
-   `git status`
-   `git commit -m "Ignore some files." .gitignore`
-   `git status`
-   `git add -f a.log`
-   `nano .gitignore` Exclude some files from ignore pattern.


## Github ##

-   Git is great for collaboration!
-   Direct learners to make a github account and/or log in
-   Make a github repository called 'guacamole'
-   Follow the instructions to add the remote repository and push our
    local repository to it.
    -   Be sure to use HTTPS
-   Explore the repository on github
-   Show students that local changes which are NOT committed don't end up
    on the remote.
-   Ask students to discuss the difference between 'commit' and 'push'.

-   Pair students up into groups of two.
-   Add the other as a collaborator on your repository.
-   `git clone <github-link> guacamole-bjs`
-   Make changes and push back to the collaborator's repository.

-   Back in your original repository:
    -   `git fetch origin`
    -   `git status`
    -   Pull the collaborators changes to your own repository.
    -   Check out the result.

-   Make an arbitrary change to your collaborators `instructions.txt`.
-   Push that change upstream.
-   Make (and commit) a different change to _your_ `instructions.txt` **on the same
    line as your collaborator changed**.
-   `git push origin master`
-   What happened?
-   `git pull origin master`
-   `cat instructions.txt`
-   `git status`
-   `nano instruction.txt`
-   `git add instuctions.txt`
-   `git status`
-   `git commit <...>`
-   `git log`
-   `git push`


## Branching ##


-   Branching is just collaboration with yourself.
-   Reformat your entire thesis without risking your progress.
