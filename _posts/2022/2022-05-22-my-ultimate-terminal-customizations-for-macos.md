---
layout: post
title: My Ultimate Terminal Customizations for macOS
subtitle: A configurations guide 
tags: tools
description: Some people say that developers live in the terminal.
keywords:
  - customize command line,
  - beautiful terminal,
  - Oh-my-zsh,
  - Beautiful prompt,
image: ../img/posts/2022/cheers_ascii_cover.jpg
share-img: ../img/posts/2022/cheers_ascii_cover.jpg
show-avatar: false
toc: true
date: 2022/05/22
author: cesarsotovalero
published: true
---

There is a mystical belief that top-class software developers can do the job without abandoning the terminal.
I think this is true to some extent.
It is impossible to become an **outstanding software developer** without knowing how to get the most out of the terminal.
A good way to go is treating the [Unix shell](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) as a very good friend.[^1]
This about the terminal as the bar where you go with your friend to drink and spend a good time together.
I ~~mostly~~ prefer drinking with civilized friends,[^2] so I try to make the best of it.
This blog post is a how-to guide for you (and my future self) to help them get appropriately dressed when we meet at the bar.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/cheers_ascii.jpg alt:"ASCII art displayed on my terminal" %}
  <figcaption class="stroke"> 
    &#169; Cheers! ASCII art displayed on my terminal. You can get it installing <a href="https://github.com/TheZoraiz/ascii-image-converter">ascii-image-converter</a> and running the command: <code class="language-bash highlighter-rouge">ascii-image-converter -C https://cesarsotovalero.net/img/posts/2022/cheers.jpg</code>.
  </figcaption>
</figure>

# iTerm2

The fist step is getting a better terminal app.
I use [iTerm2](https://iterm2.com/), as a replacement of the standard macOS terminal.

You can install iTerm2 via [Homebrew](https://brew.sh/) using the following command:

```bash
brew install --cask iterm2
````

These are my favorite iTerm2 features:
- Opening a new terminal tab in the current window.
- Opening the terminal from another window with a hotkey (I use `^ + ⌘ + T`, as by default in Ubuntu).
- Searching with regular expressions.
- Customizing the font (I use [Fira Code](https://github.com/tonsky/FiraCode), 16px).

# Oh My Zsh

The second step is getting a better shell.
I use [Oh My Zsh](https://ohmyz.sh/), as a shell replacement for macOS.
This is an open-source, popular `zsh` configuration manager, offering tons of themes, functions, helpers, plugins, and other handy features for command line users.
While `zsh` is now the default shell in Terminal app for modern macOS releases, Oh My Zsh is separate, and therefore must be installed and configured separately.

To install Oh My Zsh, execute the following command in the terminal:

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
 
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

The `gnzh` theme is located in `~/.oh-my-zsh/themes/gnzh.zsh-theme`.
Here's the full file:

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

Note that I use `jenv_prompt_info` in line `#31` to show the Java version that I'm currently using directly in the prompt.
You can show the version of other programming languages as well, here is [the list of available options](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/prompt_info_functions.zsh#L14-L21).
You can also customize the colors via `$FG[240]`, see an explanation [here](https://dev.to/yujinyuz/custom-colors-in-oh-my-zsh-themes-4h13).
I also use [git-prompt](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git-prompt/README.md) via the global variable `$GIT_PROMPT` to show the status of the current Git repository when applicable.

**Plugins**:
Oh My Zsh have a vast list of awesome [plugins](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins). 
To use a plugin, add the name of the plugin in the `~/.zshrc` file: 

{% highlight bash linenos %}
# Path to your oh-my-zsh installation.
export ZSH="/Users/cesarsv/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
   git
   zsh-syntax-highlighting
   zsh-autosuggestions
   aliases
   docker
   git-prompt
   gradle
   jenv
   sdk
   mvn
)

source $ZSH/oh-my-zsh.sh
{% endhighlight %}

These are my favorite Oh My Zsh plugins:

- [git-prompt](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git-prompt/README.md): Displays information about the current git repository. In particular: the branch name, difference with remote branch, number of files staged or changed, etc.
- [aliases](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aliases/README.md): List the shortcuts that are currently available based on the plugins you have enabled.
- [mvn](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/mvn/README.md): Provides many useful aliases as well as completion for the Apache Maven command (`mvn`).
- [sdk](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sdk/README.md): Plugin for [SDKMAN](https://sdkman.io/), a tool for managing parallel versions of multiple Software Development Kits on most Unix based systems. Provides autocompletion for all known commands.
- [vscode](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/vscode/README.md): Simplify the interaction between the command line and VS Code or VSCodium editor.

# TLDR

[TLDR](https://github.com/tldr-pages/tldr) is a handy tool for generating a short summary of a Unix command.
It is helpful when you are trying to find out how to use a command, but you don't want to read its long ~~and boring~~ `man` page.
Thus, the TLDR pages are a community effort to simplify the beloved man pages with practical examples.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/tldr_vs_man.png alt:"Screenshot of autocompletion with Fig" %}
  <figcaption class="stroke"> 
    tldr vs. man result when searching the <code class="language-bash highlighter-rouge">grep</code> command.
  </figcaption>
</figure>

To install TLDR, execute the following command in the terminal:

```bash
brew install tldr
```

# Fig

[Fig](https://fig.io/) adds IDE-style autocomplete to the terminal.
I like it because it makes me feel that my terminal more like and IDE.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/fig.png alt:"Screenshot of autocompletion with Fig" %}
  <figcaption class="stroke"> 
    Screenshot of autocompletion with Fig.
  </figcaption>
</figure>

To Install Fig, execute the following command in the terminal:

```bash
brew install fig
````

# SDKMAN!

SDKMAN! is a tool for managing parallel versions of multiple Software Development Kits (SDKs).
It provides a convenient CLI and API for installing, switching, removing and listing SDK candidates.
For example, you can use SDKMAN! to install the latest version of the Android SDK, or the latest version of the iOS SDK.

You can also switch between different Java JDK versions, as follows:

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css"/>
<script src="../../js/asciinema-player.js"></script>
<asciinema-player src="../asciinema/sdkman.rec" poster="npt:00:1" start-at="3"></asciinema-player>

To install SDKMAN!, execute the following command in the terminal:

```bash
curl -s "https://get.sdkman.io" | bash
```

# jENV

[jEnv](https://www.jenv.be/) is a command line tool to help you forget how to set the `JAVA_HOME` environment variable.
For example, you you can change the Java version that you are using by simply typing `jenv global <version>`:

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css" />
<script src="../../js/asciinema-player.js"></script>
<asciinema-player src="../asciinema/jenv.rec" poster="npt:00:1" start-at="3" rows="24"></asciinema-player>




To install jEnv, execute the following command in the terminal:

```bash
brew install jenv
```

# Jq

[jq](https://stedolan.github.io/jq/) is a powerful command-line JSON processor.
It can be used to filter, transform, and query JSON files in the terminal.
And of course, you can get JSON file pretty-printed by typing `jq '.'`.

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css" />
<script src="../../js/asciinema-player.js"></script>
<asciinema-player src="../asciinema/jq.rec" poster="npt:00:12" start-at="3"></asciinema-player>


To install jq, execute the following command in the terminal:

```bash
brew install jq
```

# Bat

[bat](https://github.com/sharkdp/bat) is a simple and powerful command-line utility for displaying files and directories.
It is a replacement for the `cat` Unix command, but it is more powerful and more user-friendly.

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css" />
<script src="../../js/asciinema-player.js"></script>
<asciinema-player src="../../asciinema/bat.rec" poster="npt:00:12" start-at="3"></asciinema-player>


To install bat, execute the following command in the terminal:


```bash
brew install bat
```

# Trash-CLI

[trash-cli](https://github.com/sindresorhus/trash-cli) is a substitute for the dangerous `rm` command that permanently deletes files.
In contrast, trash-cli moves files to the trash, which is much safer and reversible

To install trash-cli, execute the following command in the terminal:

```bash
brew install trash-cli
```

# EXA

[exa](https://github.com/ogham/exa) is a modern replacement for the `ls` command.

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css" />
<script src="../../js/asciinema-player.js"></script>
<asciinema-player src="../../asciinema/exa.rec" poster="npt:00:12" start-at="3"></asciinema-player>

To install exa, execute the following command in the terminal:

```bash
brew install exa
```

# Htop

[htop](https://github.com/hishamhm/htop) is a terminal-based process viewer.
It is a replacement for the `top` Unix command, more user-friendly and more powerful.

<link rel="stylesheet" type="text/css" href="../../css/asciinema-player.css" />
<script src="../../js/asciinema-player.js"></script>
<asciinema-player src="../../asciinema/exa.rec" poster="npt:00:12" start-at="3"></asciinema-player>


To install htop, execute the following command in the terminal:

```bash
brew install htop
```

# Diff-so-fancy

[diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) is a terminal-based diff viewer.
It is a replacement for the `diff` Unix command.
It makes your diffs human-readable instead of machine-readable.
This helps improve code quality and helps you spot defects faster.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/git_diff_vs_diff-so-fancy.png alt:"Vanilla git diff vs git and diff-so-fancy." %}
  <figcaption class="stroke"> 
    Vanilla git diff vs git and diff-so-fancy.
  </figcaption>
</figure>

I use it with the following option: `git config --bool --global diff-so-fancy.stripLeadingSymbols false`

To install diff-so-fancy, execute the following command in the terminal:

```bash
brew install diff-so-fancy
```
# Conclusion

Here we are at the bar, enjoying a tasty afterwork's beer.
I open my laptop, look at my beautiful terminal, fully customized and configured to suit my needs.
It is beautiful!
I close my laptop, and I'm just happy 😄.

# Footnotes

[^1]: I recommend the course “[Unix Tools: Data, Software and Production Engineering](https://www.edx.org/course/unix-tools-data-software-and-production-engineering),” by professor Prof. Diomidis Spinellis.

[^2]: Just kidding.