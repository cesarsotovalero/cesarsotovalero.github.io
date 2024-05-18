---
layout: post
title: My Ultimate Terminal Customizations for Windows
subtitle: Another guide
tags: productivity
description: This post describes the tools I use to resemble my macOS terminal customizations on Windows.  This includes the fonts that I choose for the Windows Terminal app, an enhanced PowerShell, and the installation of third-party tools like Oh My Posh.  I've found that these small improvements make me a happier Windows user.
keywords:
  - customize command line,
  - beautiful Windows terminal,
  - Oh-my-posh,
  - beautiful prompt
image: ../img/posts/2023/2023-10-13/bill-gates-drinks-faeces-water_cover.png
share-img: ../img/posts/2023/2023-10-13/bill-gates-drinks-faeces-water_cover.png
show-avatar: false
toc: true
date: 2023/10/13
author: cesarsotovalero
published: true
---

I went back to using Windows lately in my current job. 
But let's be honest: Windows is a pain for me as a developer.[^1]
Anyway, I've to deal with it to keep my job.
One of the things that I miss the most from my previous setup is my nice [Terminal customizations](../blog/my-ultimate-terminal-customizations-for-macos.html) available in macOS.
To my knowledge, the Windows native terminal is far behind compared to its Unix counterparts.
However, with some tweaks and extra tools, I manage to tweak the horrendous `C:\WINDOWS\system32\CMD` into something nicer in terms of customization and functionality.
In this blog post, I describe the tools I use to resemble my macOS terminal customizations on Windows.
This includes the fonts that I chose for the Windows Terminal app, an enhanced PowerShell, and the installation of third-party tools like Oh My Posh.
I've found that these small improvements make me significantly ~~less sad~~ happier when using Windows. 
I must say, to me, it's not only about functionalities, good aesthetics and a great user experience go hand in hand with a certain pleasure that boosts my productivity!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-10-13/bill-gates-drinks-faeces-water-ascii-art.png alt: "ASCII art displayed on my Windows' terminal" %}
  <figcaption class="stroke"> 
    &#169; Turning poop into something drinkable <a href="https://www.gatesnotes.com/Omniprocessor-From-Poop-to-Potable">is doable</a>, ask Bill Gates! ASCII art displayed on my Windows' terminal. Try it installing <a href="https://github.com/TheZoraiz/ascii-image-converter">ascii-image-converter</a> and executing the command: <strong>ascii-image-converter --braille --dither https://tinyurl.com/55p7d8vf</strong>.
  </figcaption>
</figure>

# Windows Terminal

{% badge /img/badges/Windows-terminal-logo.png 140 https://en.wikipedia.org/wiki/Windows_Terminal %}

The first step is to get a better terminal app.
I use [Windows Terminal](https://en.wikipedia.org/wiki/Windows_Terminal), which offers a lot of nice customization options.
For example, it allows opening customizing the appearance (just like [iTerm](https://iterm2.com/)), and having multiple tabs with different shells opened like PowerShell, Command Prompt, and Windows Subsystem for Linux (WSL).
The app can be [downloaded from the Microsoft Store](https://aka.ms/terminal) or directly installed from its official [GitHub repository](https://github.com/microsoft/terminal).

- To install via Microsoft Store, open [Microsoft Store](https://apps.microsoft.com/home?hl=en-us&gl=US), search for "Windows Terminal" and click "Get" or "Install."

- To install via GitHub repository, download the latest release from [here](https://github.com/microsoft/terminal/releases) and follow the installation instructions provided in the repository.

# PowerShell

{% badge /img/badges/PowerShell_5.0_icon.png 140 https://learn.microsoft.com/en-us/powershell/ %}

To make the most of your terminal, install and use [PowerShell v5](https://learn.microsoft.com/en-us/powershell/) or above instead of the Command Prompt (`CMD`).
PowerShell is very powerful shell (similar to `bash`) but [with a more verbose syntax](https://mathieubuisson.github.io/powershell-linux-bash/). 
Interestingly, PowerShell commands return objects instead of plain text!

Here's how to install PowerShell Core on Windows:

1. Go to the [PowerShell GitHub page](https://github.com/PowerShell/PowerShell).
2. Download the latest `.msi` file for Windows.
3. Run the installer and follow the prompts.

Once installed, you can set PowerShell Core as your default profile in the Windows Terminal settings:

1. Open Windows Terminal settings (`Ctrl+,`).
2. Under "Startup," change the default profile to PowerShell.

Lastly, open PowerShell and set the execution policy to allow running scripts:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Now you can start customizing your PowerShell profile by opening the profile file in notepad: 

```powershell
notepad $PSHOME\Profile.ps1
```

In this file, you can add custom aliases, functions, and settings to enhance the PowerShell experience.
For example, to display command predictions in a list format add the following line:

```powershell
Set-PSReadLineOption -PredictionViewStyle ListView
```

Here are my custom aliases:

{% highlight powershell linenos %}
# Unix aliases
Set-Alias -Name ls -Value Get-ChildItem
Set-Alias -Name cat -Value Get-Content
Set-Alias -Name rm -Value Remove-Item
Set-Alias -Name mv -Value Move-Item
Set-Alias -Name cp -Value Copy-Item

# Directory navigation aliases
Set-Alias -Name docs -Value 'Set-Location C:\Users\YourUsername\Documents'
Set-Alias -Name dl -Value 'Set-Location C:\Users\YourUsername\Downloads'
Set-Alias -Name desktop -Value 'Set-Location C:\Users\YourUsername\Desktop'

# Process management aliases
Set-Alias -Name ps -Value Get-Process
Set-Alias -Name kill -Value Stop-Process

# Custom Git aliases
function gst {
    git status
}
function gpl {
    git pull
}
function gps {
    git push
}
function gco {
    param (
        [string]$branch
    )
    git checkout $branch
}
function gcm {
    param (
        [string]$message
    )
    git commit -m "$message"
}
function gba {
    git branch -a
}
{% endhighlight %}

# WSL

{% badge /img/badges/wsl-img.png 140 https://learn.microsoft.com/en-us/windows/wsl/ %}

The [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/) (WSL) allows running a Linux environment on Windows without the need for a virtual machine or dual-boot setup.
This is great for me because I'm so accustomed to Unix-like environments and tend to use Linux tools and scripts whenever I can.
There are many compatible Linux distributions available in the Microsoft Store (I recommend using Ubuntu or Debian), and it's easy sharing files between Windows and Linux environments.

WSL works by translating Linux system calls into Windows system calls using a compatibility layer.
There are two versions of WSL: WL 1 and WSL 2.
WSL 1 uses a translation layer (similar to [Wine](https://www.winehq.org/) for Linux on Windows).
WSL 2 introduces a real Linux kernel running in a lightweight virtual machine, providing full system call compatibility and improved performance.
WSL distributions are installed in the `%LOCALAPPDATA%\Packages` directory by default. 
You can access the Linux file system from Windows via `\\wsl$\<distro-name>` in the File Explorer.

To enable WSL on Windows [follow the official instructions](https://learn.microsoft.com/en-us/windows/wsl/install-manual):

1. Press `Win + X`, then select "Windows PowerShell Admin)."
2. Enable WSL Feature: running `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
3. Enable Virtual Machine Feature: running `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
4. Set WSL 2 as the default version: `sh wsl --set-default-version 2`
5. Restart Your Computer:

To install a Linux distribution (Ubuntu 20.04 in this case) run the following command in PowerShell:

```powershell
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
```

To verify the installation:

```powershell
wsl --list --verbose
```

# Scoop

[Scoop](https://scoop.sh/) is a command-line package manager for Windows that simplifies the process of installing, updating, and managing software applications.
Think of it as the Windows' version of [homebrew](https://brew.sh/).
Scoop is much better than the default Windows installer/uninstaller.
It downloads and manages packages in a portable way, which means that it's not required to have admin rights to install anything. 
Once installed, Scoop places the applications in `~\scoop`. 

To install Scoop, run the following command in PowerShell:

```powershell
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

Here are the basic Scoop commands that I use: 

```powershell
scoop search [package_name] # To search for a package
scoop install [package_name] # To install a package
scoop update [package_name] # To update a package
scoop list # To list installed packages
```

Here are a few packages that I recommend:

```powershell
scoop install 7zip curl git wget starship sudo touch vim which z gpg grep helm fzf jq nvm python
```

# Oh My Posh

[Oh My Posh](https://ohmyposh.dev/) is a prompt theme engine for PowerShell that allows customizing the terminal prompt.
It is the version for Windows of the super popular [Oh My Zsh](https://ohmyz.sh/) tool used on Unix-based distros.

To install Oh My Posh using Scoop just run the following command in PowerShell:

```powershell
scoop install main/oh-my-posh
```

To set up a theme, you first need to initialize Oh My Posh in your PowerShell profile.
Open this profile in Notepad by running the following command:

```powershell
notepad $PSHOME\Profile.ps1
```

Add the following line to your profile script:

```powershell
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\\your-theme.omp.json" | Invoke-Expression
```

Replace `your-theme.omp.json` with the path to your desired theme (my favorite is `pure.omp.json`). 
You can find themes in the `themes` folder located where the Oh My Posh repository was installed.

# Fonts and Icons

To display certain glyphs and icons correctly, you might need [Nerd Fonts](https://www.nerdfonts.com/).
These fonts are created by developers to be free, look good, and include extra icons.
My current favorite is the "**IosevkaTerm Nerd Font**".
Set the font in Windows Terminal settings under the profile appearances tab as shown below:

<figure class="jb_picture">
  {% responsive_image width: "75%" border: "0px solid #808080" path: img/posts/2023/2023-10-13/windows-terminal-powershell-customizations.png alt: "Customizing the appearance of PowerShell in the Windows Terminal application settings." %}
  <figcaption class="stroke"> 
    &#169; Customizing the appearance of PowerShell in the Windows Terminal application settings by changing the font.
  </figcaption>
</figure>

To display files and folder icons directly in the terminal, add the following line in `$PSHOME\Profile.ps1`:

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
```

After that, you will see nice icons displayed. 
Here's an example of using `ll` on the base directory of the code that runs this website hosted on GitHub:

<figure class="jb_picture">
  {% responsive_image width: "75%" border: "0px solid #808080" path: img/posts/2023/2023-10-13/windows-terminal-icons-customization.png alt: "Example of Windows Terminal output after adding Terminal-Icons." %}
  <figcaption class="stroke"> 
    &#169; Example of Windows Terminal output after adding Terminal-Icons.
  </figcaption>
</figure>

# Conclusion

Customizing the Windows terminal not only makes its visually appealing but also gives a joy that enhances productivity.
In this blog post, I covered how to transform the Windows terminal into a beautiful and efficient workspace.
By integrating PowerShell, Oh My Posh, custom fonts, and various plugins, you create a powerful, efficient, and enjoyable workspace directly in your terminal window.
With these tools, your command line will transform into a robust command center, ready to tackle any task efficiently.
Explore, experiment, and most importantly, tailor your terminal to fit your workflow and style.
Let me know in the comments below if you know about any other tool that you would recommend 😊.

# Footnotes

[^1]: Windows is very popular in non-tech heavy companies. Personally, I think that pro developers don't use it. Instead, the real pros use Unix-based systems like [Arch Linux](https://archlinux.org/), or [macOS](https://en.wikipedia.org/wiki/MacOS) when high-quality hardware is a priority.
