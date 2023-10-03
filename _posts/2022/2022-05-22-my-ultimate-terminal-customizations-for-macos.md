---
layout: post
title: My Ultimate Terminal Customizations for macOS
subtitle: A guide 
tags: productivity
description: There is a common belief that top-class software developers can do their job without ever abandoning the terminal. This blog post is a how-to guide for you (and my future self) to configure the terminal in a way so that we will enjoy every command typed on it.
keywords:
  - customize command line,
  - beautiful terminal,
  - Oh-my-zsh,
  - Beautiful prompt
image: ../img/posts/2022/cheers_ascii_cover.jpg
share-img: ../img/posts/2022/cheers_ascii_cover.jpg
show-avatar: false
toc: true
date: 2022/05/22
author: cesarsotovalero
published: true
---

There is a common belief that top-class software developers can do their job without ever abandoning the terminal.
I think this is true to some extent.
It is ~~almost~~ impossible to become an outstanding software developer without knowing how to get the most out of the terminal.
Personally, I treat my [Unix shell](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) as a very good friend.[^1]
And the terminal for me is the bar where I go with this friend to drink and have a good time.
As it is more enjoyable drinking with civilized friends in civilized places,[^2] I prefer visiting a bar that is cozy and invites me to cheer.
This blog post is a how-to guide for you (and my future self) to configure the terminal in a way so that we will enjoy every ~~drink~~ command typed on it.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/cheers_ascii.png alt:"ASCII art displayed on my terminal" %}
  <figcaption class="stroke"> 
    &#169; Cheers! ASCII art displayed on my terminal. Try it installing <a href="https://github.com/TheZoraiz/ascii-image-converter">ascii-image-converter</a> and executing the command: <strong>ascii-image-converter -C http://tinyurl.com/3jez5whs</strong>.
  </figcaption>
</figure>

# iTerm2

The fist step is getting a better terminal app.
I use [iTerm2](https://iterm2.com/), as a replacement of the standard macOS terminal.

You can install iTerm2 via [Homebrew](https://brew.sh/) using the following command:

{% highlight bash linenos %}
brew install --cask iterm2
{% endhighlight %}

These are my favorite iTerm2 features:
- Opening a new terminal tab in the current window.
- Opening the terminal from another window with a hotkey (I use `^ + ⌘ + T`, as by default in Ubuntu).
- Searching with regular expressions.
- Customizing the font (I use [Fira Code](https://github.com/tonsky/FiraCode), 16px).

# Oh My Zsh

The second step is getting a better shell.
I use [Oh My Zsh](https://ohmyz.sh/), as a shell replacement for macOS.
This is an open-source and popular `zsh` configuration manager.
It offers a tons of themes, functions, helpers, plugins, and other handy features.

To install Oh My Zsh, execute the following command in the terminal:

{% highlight bash linenos %}
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
{% endhighlight %}
 
The configuration file is located at `~/.zshrc`.

**Themes**:
In order to enable a theme, set `ZSH_THEME` to the name of the theme in your `~/.zshrc`, before sourcing Oh My Zsh. 
I use `ZSH_THEME=gnzh`.

{% highlight bash linenos %}
# Path to your oh-my-zsh installation.
export ZSH="/Users/cesarsv/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
`ZSH_THEME="gnzh"`

source $ZSH/oh-my-zsh.sh
{% endhighlight %}

The `gnzh` theme is located by default in `~/.oh-my-zsh/themes/gnzh.zsh-theme`.
Here's the full file that I use:

{% highlight bash linenos %}
setopt prompt_subst

() {

GIT_PROMPT='$(git_super_status)'
local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
   PR_USER='%F{green}%n%f'
   PR_USER_OP='%F{green}%#%f'
   PR_PROMPT='%f➤ %f'
else # root
   PR_USER='%F{red}%n%f'
   PR_USER_OP='%F{red}%#%f'
   PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
   PR_HOST='%F{red}%M%f' # SSH
else
   PR_HOST='%F{green}%M%f' # no SSH
fi

local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
local current_dir="%B%F{blue}%~%f%b"

PROMPT="╭─${user_host} ${current_dir} "%F$FG[240]\$(jenv_prompt_info)%f" $GIT_PROMPT
╰─$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_JENV_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_JENV_PROMPT_SUFFIX="›%f"

}
{% endhighlight %}

Note that I add `jenv_prompt_info` in line `#31` to show the Java version that I'm currently using directly in the prompt.
You can show the version of other programming languages as well, here is [the list of available options](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/prompt_info_functions.zsh#L14-L21).

Also note that I customize the colors via `$FG[240]`, see an explanation [here](https://dev.to/yujinyuz/custom-colors-in-oh-my-zsh-themes-4h13).
I use [git-prompt](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git-prompt/README.md) via the global variable `$GIT_PROMPT` to show the status of the current Git repository when applicable.

**Plugins**:
Oh My Zsh has a vast list of awesome [plugins](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins). 
To use a plugin, add the name of the plugin in the `~/.zshrc` file. 

Here's an example:

{% highlight bash linenos %}
# Path to your oh-my-zsh installation.
export ZSH="/Users/cesarsv/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
   git-prompt
   zsh-syntax-highlighting
   zsh-autosuggestions
   aliases
   mvn
   jenv
   sdk
   vscode
)

source $ZSH/oh-my-zsh.sh
{% endhighlight %}

These are my favorite Oh My Zsh plugins:

- [git-prompt](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git-prompt/README.md): Displays information about the current git repository. In particular: the branch name, difference with remote branch, number of files staged or changed, etc.
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): Provides syntax highlighting for the shell zsh.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Suggests commands as you type based on history and completions.
- [aliases](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aliases/README.md): Lists the shortcuts that are currently available based on the plugins you have enabled.
- [mvn](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/mvn/README.md): Provides many useful aliases as well as completion for the Apache Maven command (`mvn`).
- [jenv](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/jenv/README.md): Initializes `jenv` and provides the `jenv_prompt_info` function to add Java version information to prompts.
- [sdk](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sdk/README.md): Plugin for [SDKMAN](https://sdkman.io/), a tool for managing parallel versions of multiple Software Development Kits on most Unix based systems. Provides autocompletion for all known commands.
- [vscode](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/vscode/README.md): Simplifies the interaction between the command line and VS Code or VSCodium editor.

# TLDR

[TLDR](https://github.com/tldr-pages/tldr) is a handy tool for generating a short summary of a Unix command.
It is helpful when you are trying to find out how to use a command, but you don't want to read its long ~~and boring~~ `man` page.
Thus, the TLDR pages are a community effort to simplify the beloved man pages with practical examples.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/tldr_vs_man.png alt:"Screenshot of autocompletion with Fig" %}
  <figcaption class="stroke"> 
    Man (left) vs. TLDR (right) results when displaying the documentation of the <code class="language-bash highlighter-rouge">grep</code> command.
  </figcaption>
</figure>

To install TLDR, execute the following command in the terminal:

{% highlight bash linenos %}
brew install tldr
{% endhighlight %}

# Fig

[Fig](https://fig.io/) adds IDE-style autocomplete to the terminal.
I like it because it makes me feel my terminal more like and IDE.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/fig.png alt:"Screenshot of autocompletion with Fig" %}
  <figcaption class="stroke"> 
    Screenshot of autocompletion with Fig.
  </figcaption>
</figure>

To Install Fig, execute the following command in the terminal:

{% highlight bash linenos %}
brew install fig
{% endhighlight %}

# Vim

[Vim](https://www.vim.org/) is a powerful text editor for Unix. 
It is used by many developers to write code directly in the terminal.
I love Vim, despite its steep learning curve.

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css"/>
<div id="vim.rec" class="asciinema-player-div"></div>
<script src="../../js/asciinema-player.min.js"></script>
<script> 
   AsciinemaPlayer.create('../../asciinema/vim.rec', document.getElementById('vim.rec'), {
      loop: true,
      autoPlay: true,
      rows: 25
   });
</script>

To install Vim, execute the following command in the terminal:

{% highlight bash linenos %}
brew install vim
{% endhighlight %}

It is very easy to apply different customizations to Vim that totally change how it looks and feels.
I use the [amix/vimrc](https://github.com/amix/vimrc) scripts to easily customize my Vim environment.
This includes a lot of great plugins, configurations and color schemes that make Vim a lot better. 

To get and awesome Vim, simply execute the following commands in the terminal:

{% highlight bash linenos %}
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
{% endhighlight %}

These commands install several Vim plugins and customizations.
Among other plugins, it installs [NERDTree](https://github.com/preservim/nerdtree), which is a great tool for file navigation.
To open NERDTree automatically when Vim starts and put the cursor back in the other window, add the following in `~/.vim_runtime/my_configs.vim`:

{% highlight bash linenos %}
autocmd VimEnter * NERDTree | wincmd p
{% endhighlight %}

**Note:** To move the cursor between the NERDTree panel and the edit panel type `ctrl + w` twice.

# SDKMAN!

SDKMAN! is a tool for managing parallel versions of multiple Software Development Kits (SDKs).
It provides a convenient CLI and API for installing, switching, removing and listing SDK candidates.
For example, you can use SDKMAN! to install the latest version of the Android SDK, or the latest version of the iOS SDK.

You can also switch between different Java JDK versions, as follows:

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css"/>
<div id="sdkman.rec" class="asciinema-player-div"></div>
<script src="../../js/asciinema-player.min.js"></script>
<script> 
   AsciinemaPlayer.create('../../asciinema/sdkman.rec', document.getElementById('sdkman.rec'), {
      loop: true,
      autoPlay: true,
      rows: 25
   });
</script>

To install SDKMAN!, execute the following command in the terminal:

{% highlight bash linenos %}
curl -s "https://get.sdkman.io" | bash
{% endhighlight %}

# jENV

[jEnv](https://www.jenv.be/) is a command line tool to help you forget how to set the `JAVA_HOME` environment variable.
For example, you you can change the Java version that you are using by simply typing `jenv global <version>`:

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css"/>
<div id="jenv.rec" class="asciinema-player-div"></div>
<script src="../../js/asciinema-player.min.js"></script>
<script> 
   AsciinemaPlayer.create('../../asciinema/jenv.rec', document.getElementById('jenv.rec'), {
      loop: true,
      autoPlay: true,
      rows: 25
   });
</script>

To install jEnv, execute the following command in the terminal:

{% highlight bash linenos %}
brew install jenv
{% endhighlight %}

# Jq

[Jq](https://stedolan.github.io/jq/) is a powerful command-line JSON processor.
It can be used to filter, transform, and query JSON files in the terminal.
And of course, you can get JSON file pretty-printed by typing `jq '.'`.

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css"/>
<div id="jq.rec" class="asciinema-player-div"></div>
<script src="../../js/asciinema-player.min.js"></script>
<script> 
   AsciinemaPlayer.create('../../asciinema/jq.rec', document.getElementById('jq.rec'), {
      loop: true,
      autoPlay: true,
      rows: 25
   });
</script>

To install jq, execute the following command in the terminal:

{% highlight bash linenos %}
brew install jq
{% endhighlight %}

# Bat

[Bat](https://github.com/sharkdp/bat) is a simple and powerful command-line utility for displaying files and directories.
It is a replacement for the `cat` Unix command, but it is more powerful and more user-friendly.

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css"/>
<div id="bat.rec" class="asciinema-player-div"></div>
<script src="../../js/asciinema-player.min.js"></script>
<script> 
   AsciinemaPlayer.create('../../asciinema/bat.rec', document.getElementById('bat.rec'), {
      loop: true,
      autoPlay: true,
      rows: 25
   });
</script>

To install bat, execute the following command in the terminal:

{% highlight bash linenos %}
brew install bat
{% endhighlight %}

# Trash-CLI

[Trash-cli](https://github.com/sindresorhus/trash-cli) is a substitute for the dangerous `rm` command that permanently deletes files.
In contrast, trash-cli moves files to the trash, which is safer because it is reversible.

To install trash-cli, execute the following command in the terminal:

{% highlight bash linenos %}
brew install trash-cli
{% endhighlight %}

# Exa

[Exa](https://github.com/ogham/exa) is a modern replacement for the `ls` command.

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css"/>
<div id="exa.rec" class="asciinema-player-div"></div>
<script src="../../js/asciinema-player.min.js"></script>
<script> 
   AsciinemaPlayer.create('../../asciinema/exa.rec', document.getElementById('exa.rec'), {
      loop: true,
      autoPlay: true,
      rows: 25
   });
</script>

To install exa, execute the following command in the terminal:

{% highlight bash linenos %}
brew install exa
{% endhighlight %}

# Htop

[Htop](https://github.com/hishamhm/htop) is a terminal-based process viewer.
It is a replacement for the `top` Unix command, more user-friendly and more powerful.

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css"/>
<div id="htop.rec" class="asciinema-player-div"></div>
<script src="../../js/asciinema-player.min.js"></script>
<script> 
   AsciinemaPlayer.create('../../asciinema/htop.rec', document.getElementById('htop.rec'), {
      loop: true,
      autoPlay: true,
      rows: 25
   });
</script>

To install htop, execute the following command in the terminal:

{% highlight bash linenos %}
brew install htop
{% endhighlight %}

# Diff-so-fancy

[Diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) is a terminal-based diff viewer.
It is a replacement for the `diff` Unix command.
It makes your diffs human-readable instead of machine-readable.
This helps improve code quality and helps you spot defects faster.

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css"/>
<div id="diff-so-fancy.rec" class="asciinema-player-div"></div>
<script src="../../js/asciinema-player.min.js"></script>
<script> 
   AsciinemaPlayer.create('../../asciinema/diff-so-fancy.rec', document.getElementById('diff-so-fancy.rec'), {
      loop: true,
      autoPlay: true,
      rows: 25
   });
</script>

To install diff-so-fancy, execute the following command in the terminal:

{% highlight bash linenos %}
brew install diff-so-fancy
{% endhighlight %}

To make it Git use it as the default, execute the following command in the terminal:

{% highlight bash linenos %}
git config --bool --global diff-so-fancy.stripLeadingSymbols false
{% endhighlight %}

# Conclusion

Here we are at the bar, enjoying a tasty after-work beer.
Now I open my laptop and look at my beautiful terminal, fully customized and configured to suit my needs.
It is beautiful!
I close my laptop, and I'm just happy 😄.

# Footnotes

[^1]: I recommend the course “[Unix Tools: Data, Software and Production Engineering](https://www.edx.org/course/unix-tools-data-software-and-production-engineering),” by [Prof. Diomidis Spinellis](https://en.wikipedia.org/wiki/Diomidis_Spinellis).

[^2]: Just kidding.


[//]: # (Also install: chafa, fzf-zsh-plugin)