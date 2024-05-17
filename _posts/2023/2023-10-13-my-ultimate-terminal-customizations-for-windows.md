---
layout: post
title: My Ultimate Terminal Customizations for Windows
subtitle: Another guide
tags: productivity
description: This post describes the tools I use to resemble my macOS terminal customizations on Windows.  This includes the fonts that I choose for the Windows Terminal app, an enhanced PowerShell, and the installation of third-party tools like Oh My Posh.  I've found that these small improvements make me a happier Windows user.
keywords:
  - customize command line,
  - beautiful windows terminal,
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
One of the things that I miss the most from my previous Mac setup is my nice [Terminal customizations](../blog/my-ultimate-terminal-customizations-for-macos.html).
To my knowledge, the Windows native terminal is far behind compared to its Unix counterparts.
However, with some tweaks and extra tools, I manage to tweak the horrendous `C:\WINDOWS\system32\CMD` into something nicer in terms of customization and functionality.
In this blog post, I describe the tools I use to resemble my macOS terminal customizations on Windows.
This includes the fonts that I choose for the Windows Terminal app, an enhanced PowerShell, and the installation of third-party tools like Oh My Posh.
I've found that these small improvements make me significantly ~~less sad~~ happy when using Windows. 
I must say, to me, it's not only about functionalities, good aesthetic and great user experience comes hand in hand with a certain pleasure that boosts my productivity!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-10-13/bill-gates-drinks-faeces-water-ascii-art.png alt: "ASCII art displayed on my Windows' terminal" %}
  <figcaption class="stroke"> 
    &#169; Let's make turn poop into something drinkable! ASCII art displayed on my Windows' terminal. Try it installing <a href="https://github.com/TheZoraiz/ascii-image-converter">ascii-image-converter</a> and executing the command: <strong>ascii-image-converter --braille --dither http://tinyurl.com/3jez5whs</strong>.
  </figcaption>
</figure>

# Windows Terminal

{% badge /img/badges/Windows-terminal-logo.png 140 https://en.wikipedia.org/wiki/Windows_Terminal %}

The first step to is getting a better terminal app.
I use the Windows Terminal, which is a really great 
It can be [downloaded from the Microsoft Store](https://aka.ms/terminal) or directly installed from its official [GitHub repository](https://github.com/microsoft/terminal).

To install via Microsoft Store:

1. Open [Microsoft Store](https://apps.microsoft.com/home?hl=en-us&gl=US) and search for "Windows Terminal."
2. Then click "Get" or "Install."

To installation via GitHub:

1. Visit the latest release from [here](https://github.com/microsoft/terminal/releases).
2. Follow the installation instructions provided in the repository.

After installed, launch it by searching for it in the Start menu.
Go to the Settings you will see a bunch of configuration options as shown in the image below. 

# PowerShell

{% badge /img/badges/PowerShell_5.0_icon.png 140 https://learn.microsoft.com/en-us/powershell/ %}

To make the most of your terminal, install and use P[owerShell v5](https://learn.microsoft.com/en-us/powershell/) or above instead of the Command Prompt (cmd).

Here's how:

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

Now you can start customizing your PowerShell profile by opening the file in notepad: 

```powershell
notepad $PSHOME\Profile.ps1
```

To display command predictions in a list format add the following line:

```powershell
Set-PSReadLineOption -PredictionViewStyle ListView
```

Here are my custom aliases in PowerShell:

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

# Scoop

[Scoop](https://scoop.sh/) is a command-line installer for Windows that simplifies the process of installing, updating, and managing software.
It's the Windows' version of [homebrew](https://brew.sh/).

Scoop is much better than the default Windows installer/uninstaller.
Scoop downloads and manages packages in a portable way, which means that it's not required to have admin rights to install anything. 
Once installed, Scoop places the applications in `~\scoop`. 

Run the following to install Scoop:

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

# Oh My Posh

[Oh My Posh](https://ohmyposh.dev/) is a prompt theme engine for PowerShell that allows you to customize your terminal prompt.
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
My current favorite is the "IosevkaTerm Nerd Font".
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

Customizing your Windows Terminal not only makes your terminal visually appealing but also enhances your productivity with tools and plugins designed for efficiency. By integrating PowerShell, Oh My Posh, custom fonts, and various plugins, you create a powerful, efficient, and enjoyable workspace directly in your terminal window.

Explore, experiment, and most importantly, tailor your terminal to fit your workflow and style. With these tools, your command line will transform into a robust command center, ready to tackle any task efficiently.

# Footnotes

[^1]: Windows is very popular in non-tech heavy companies. Personally, I think that pro developers don't use it. Instead, the real pros use Unix-based systems like [Arch Linux](https://archlinux.org/), or [macOS](https://en.wikipedia.org/wiki/MacOS) when high-quality hardware is a priority.
