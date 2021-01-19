ExecuteThatThing
====

Plugin for turning Vim into a quasi-notebook reminiscent of Jupyter/iPython.

Unlike a "real" notebook, this plugin is stateless: it simply runs the command and returns the result back into the current file, without saving variables/output into memory for later re-use.
(Given the problems people have with Jupyter state, this is perhaps not a bad thing ...)


Installation and Configuration
----

Assuming you have a recent enough Vim, you can just clone this repo into `~/.vim/pack/git-plugins/start`.
No mappings are defined by default, so it won't do anything until you change your vimrc to hook into it.

The available mappings are:

* `<Plug>(ExecuteThatThingNormal)` for normal mode mappings.
* `<Plug>(ExecuteThatThingVisual)` for visual mode mappings.
* `<Plug>(InnerLineMotion)` to execute the entire current line.
* `<Plug>(InnerCommandMotion)` to execute lines which look like `$ cowsay hello world`, that is, prefix your command with a prompt.

The author's vimrc has the following mappings which you may wish to adapt:

```
"Bindings for ExecuteThatThing
nmap X  <Plug>(ExecThatThingNormal)
vmap X  <Plug>(ExecThatThingVisual)
omap il <Plug>(InnerLineMotion)
omap ic <Plug>(InnerCommandMotion)
nmap <Return> Xic
```

With those mappings, I get notebooks which look like this, just by pressing Enter on the line which looks like a command:

```
$ cowsay hello world
 _____________ 
< hello world >
 ------------- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

Notebook Syntax
----

A typical notebook has the following structures:

```
### This is a comment

$ <some shell command>
Some output
```

For working with this kind of format, basic syntax highlighting is offered, to distinguish comments, commands, and output from each other.
Use extension `.wk` instead of `.txt` and the highlighting will be used automatically.
