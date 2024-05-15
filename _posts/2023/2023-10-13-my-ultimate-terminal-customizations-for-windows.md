---
layout: post
title: My Ultimate Terminal Customizations for Windows
subtitle: A guide
tags: productivity
description: There is a common belief that top-class software developers can do their job without ever abandoning the terminal. This blog post is a how-to guide for you (and my future self) to configure the terminal in a way so that we will enjoy every command typed on it.
keywords:
  - customize command line,
  - beautiful windows terminal,
  - Oh-my-posh,
  - beautiful prompt
image: ../img/posts/2022/cheers_ascii_cover.jpg
share-img: ../img/posts/2022/cheers_ascii_cover.jpg
show-avatar: false
toc: true
date: 2022/10/13
author: cesarsotovalero
published: false
---

I went back to using Windows lately in my daily job.  
One of the things that I miss the most from my person Mac is my nice [Terminal customizations](../blog/my-ultimate-terminal-customizations-for-macos.html).
To my knowledge, the Windows native terminal is far behind compared to its Unix counterparts.
However, with some tweaks and extra tools is possible to come a long way in terms of customization and functionality. 
In this blog post, I'll my attempt to mirror those terminal customizations on for Windows.  
This includes my customized configs for tools like new Windows Terminal, PowerShell, and third-party tools like Oh My Posh.
I've found that these significantly enhance my command line experience as an user. 
I must say, to me, it's not only about functionalities, cool aesthetic comes hand in had with pleasure and improved productivity!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2022/cheers_ascii.png alt:"ASCII art displayed on my terminal" %}
  <figcaption class="stroke"> 
    &#169; Cheers! ASCII art displayed on my terminal. Try it installing <a href="https://github.com/TheZoraiz/ascii-image-converter">ascii-image-converter</a> and executing the command: <strong>ascii-image-converter -C http://tinyurl.com/3jez5whs</strong>.
  </figcaption>
</figure>

# Windows Terminal

The first step is getting a better terminal app.
I use the Windows Terminal, as a replacement of horrendous 
It can be[ downloaded from the Microsoft Stor](https://aka.ms/terminal)e or directly from the [GitHub repository](https://github.com/microsoft/terminal).

**Installation via Microsoft Store:**

- Open Microsoft Store and search for "Windows Terminal".
- Click "Get" and install.

**Installation via GitHub:**

- Visit the [Windows Terminal GitHub page](https://github.com/microsoft/terminal).
- Download the latest release.
- Follow the installation instructions provided in the repository.

After installing, launch Windows Terminal by searching for it in the Start menu.

# **2. Integrating PowerShell Core**

To make the most of your terminal, install PowerShell Core:

- Go to the [PowerShell GitHub page](https://github.com/PowerShell/PowerShell).
- Download the latest `.msi` file for Windows.
- Run the installer and follow the prompts.

Once installed, you can set PowerShell Core as your default profile in Windows Terminal:

- Open Windows Terminal settings (`Ctrl+,`).
- Under "Startup," change the default profile to PowerShell.

# Oh My Posh

Oh My Posh is a prompt theme engine for PowerShell that allows you to customize your terminal prompt.

**Installation:**

```powershell
Install-Module oh-my-posh -Scope CurrentUser

```

**Setting up a theme:**

- First, you'll need to initialize Oh My Posh in your PowerShell profile:

```powershell
notepad $PROFILE

```

- Add the following line to your profile script:

```powershell
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\\your-theme.omp.json" | Invoke-Expression

```

- Replace `your-theme.omp.json` with the path to your desired theme. You can find themes in the Oh My Posh repository or create your own.

# Fonts and Glyphs

To display certain glyphs and icons correctly, you might need [Nerd Fonts](https://www.nerdfonts.com/).
These fonts are patched to include extra glyphs.

**Installation:**

- Download your preferred Nerd Font from [Nerd Fonts](https://www.nerdfonts.com/).
- Install the font by right-clicking the downloaded file and selecting "Install."
- Set the font in Windows Terminal settings under the profile appearances tab.

# ColorTool

Windows Terminal allows the use of color schemes, which can be defined directly in the settings JSON file or applied using ColorTool.

**Using ColorTool:**

- Download ColorTool from its [GitHub repository](https://github.com/microsoft/terminal/tree/main/src/tools/ColorTool).
- Unzip and navigate to its directory in the terminal.
- Apply a scheme:

```
colortool -b scheme-name
```

- Schemes are located in the `schemes` folder or create your own.

# Terminal-Icons

- **Terminal-Icons:** Displays file and folder icons directly in the terminal.

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
```

- Add to your profile script to auto-load it.
- **z:** A command line tool that allows you to quickly navigate to frequently accessed directories.

```powershell
Install-Module z -Scope CurrentUser
```

# **Conclusion**

Customizing your Windows Terminal not only makes your terminal visually appealing but also enhances your productivity with tools and plugins designed for efficiency. By integrating PowerShell, Oh My Posh, custom fonts, and various plugins, you create a powerful, efficient, and enjoyable workspace directly in your terminal window.

Explore, experiment, and most importantly, tailor your terminal to fit your workflow and style. With these tools, your command line will transform into a robust command center, ready to tackle any task efficiently.

# Footnotes

