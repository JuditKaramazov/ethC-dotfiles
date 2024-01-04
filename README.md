# "ethical Codes": dotfiles

<p align="center">
  <img src="./.github/karamaDots.png" width="400" alt="karamaDots original logo.">
</p>
<h1 align="center">
  <i>aka</i> karamaDots
</h1>

<div align="center">
  <img src="https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Shell Script badge" title="Shell Script" />
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white" alt="CSS" title="CSS" />
</div>
<div align="center">
  <img src="https://github.com/JuditKaramazov/ethC-dotfiles/workflows/CI/badge.svg" alt="Build Status" title="Build" />
</div>
<br />
<p align="center">
  <a href="https:/github.com/JuditKaramazov">🐱 /JuditKaramazov</a>
</p>
<p align="center">
  <a href="https://karamazfolio.xyz/">📍 Personal site</a>
</p>
<p align="center">
  <a href="https://www.buymeacoffee.com/JuditKaramazov">☕ Cafelito</a>
</p>

---

Table of Contents
-----------------

* [🔧 Getting Started](#getting-started)
* [🎶 Introduction](#introduction)
* [📘 What are Dotfiles?](#what-are-dotfiles)
  * [❓ Why Dotfiles?](#why-dotfiles)
* [💄 Custom scripts](#custom-scripts)
  * [🔀 Forks](#forks)
* [📑 License](#license)


## Getting Started

Well, well: I bet you're expecting to find a rather complicated list of difficult commands and extremely-technical explanations, am I right? Then, you are _wrong_, my dear hackerman! If there's something I always wanted to achieve, that's a clear and accessible way of understanding technology. However, and before getting started, please **be aware of what follows**:
 
> [!CAUTION]
> **DO NOT** blindly use these settings (not mine, nor others) unless you fully understand what that entails. If you want to give dotfiles a try, make sure to first review the code, and remove things you don't want or need.

Considering this, and only if your boldness needs a fast & furious explanation of how things work here:

1. Clone this repository and execute the install script to symlink respective dotfiles into `~/` (which will run the installation of **Homebrew**, **Ruby** & **npm**):

    ```bash
    git clone https://github.com/JuditKaramazov/ethC-dotfiles.git
    cd ethC-dotfiles

    ./bin/install.sh
    ```

Do not forget that these dotfiles are _extremely_ **macOS-oriented** ([zsh](https://www.zsh.org) and [Homebrew](https://brew.sh) included), and since installation assumes this fact as an unaltered reality, `the process will fail on other systems`. As for the rest, if curiosity is literally killing you and you'd want to see what's going on under the hood, please, refer to the [install.sh](bin/install.sh) script to see what's truly happening.

2. Also, and keeping some **updates** in mind, running:

    ```bash
    git pull
    ./bin/update-dotfiles.sh
    ```

will update the symlinked dotfiles if some new ones have been added. See? That's all! Oh, and right before I forget about it...

## Introduction

`¡Feliz año nuevo!`, you fellow wanderers who found themselves lost in the depths of the interwebz, with its many traps, smoke, mirrors, and random Dinosaurs sharing their `dotfiles` here and there. I know what you are thinking, guys - and yes, indeed:

- There was absolutely no need for a kick-ass illustration this time - but it happened. I swear I didn't want it to happen, but it did. As usual, thank you so, so much for your time and patience, `Auregan Nedelec`. One day, we'll build an "empire" together, [The Game Kitchen](https://thegamekitchen.com/) style.
    - *Note: if you still haven't, I'd highly recommend watching [Landing Blasphemous](https://www.youtube.com/watch?feature=shared&v=lk--if_7J9g), a carefully descriptive documentary exploring the making of the first game, its conception, and how everything began to take shape, difficulties and little victories included.*
- `Why are you even sharing your personal dotfiles if there are tons of accessible ones on the web, Judit?`, but then I asked myself: why _not_? GitHub is all about contributing, sharing, and joining a community of ghostly and yet kind individuals giving each other a hand, right?
- After this unswallowable quantity of awards given (ahem), as well as tons of complaints regarding the video game industry, its negligent state, and the many gems we sadly got to enjoy last year at the cost of multiple layoffs and an immense amount of unacceptable working conditions... `The Code Awards` came to an end...

... and so did the `E3`, just in case you missed out; however, let's simply avoid a tragic state of mind now that we just welcomed a 2024 filled with `ethical Codes` all around the corner. In this case, and as it's tradition in this hellish landscape which happens to be my GitHub account, we farewelled some of the latest Awards we created before Christmas (such as [EVASCode](https://github.com/JuditKaramazov/TCA-EVASCode), [clampculate](https://github.com/JuditKaramazov/TCA-clampculate), and [rogueMazov](https://github.com/JuditKaramazov/TCA-rogueMazov)), and now it's time for us to introduce a new seasonal event inspired by the [Ethical Games Conference](http://ethicalgamesconference.org/), a two-day, single-track online conference aiming to bring together game academics to advance the debate on ethical design, development, and live operation of digital games with the long-term goal of providing concrete recommendations to the game industry and protecting players more efficiently with evidence-based guidelines. If you're new around here, or simply not used to my out-of-point commentaries, allow me to clarify something before proceeding:

1. I do love playing with words in the most absurd way possible; that's how these "events" were initially conceived. First, a more or less creative name; then (and only if we are lucky), some code.
2. When I started building my own, personal projects, the main goal that I had in mind was finding a way to organize the things I was working on in a more or less intuitive way, and I found that using `seasonal events` could help me to mentally schedule and visualize better what I was doing at the moment. Trackers can be exhausting sometimes, but I'm quite an organizational freak myself.
3. Eventually, I considered these events a nice excuse to discuss some of the topics I'm more prone to rather than a mere mental reference allowing me to track down my own progress; that's why you will find tons of mentions, references, and divagations about subjects that always caught my attention. However, this is _still_ part of my personal journey, and as convoluted as every growing path is, there's space for different technologies, tools, and ways of coding and de-coding reality.

That being said... did I ever mention that **dotfiles** can make the coding part way easier?

## What are Dotfiles?

Let's start with a brief introduction: `dotfiles` are configuration files on Unix-like systems that are typically hidden and begin with a dot (e.g., `.zshrc`, `.bash_profile`). These files are used to customize and configure various aspects of your system, applications, and command-line environment. Simple, right?

### Why Dotfiles?

That's actually a great question. Long story short, managing dotfiles provides several benefits:

1. **Customization:** Dotfiles allow you to tailor your development environment to suit your preferences. This includes configuring shell settings, defining aliases, and setting up your preferred text editor.

2. **Portability:** Storing your configuration in dotfiles makes it easier to replicate your development environment across different machines. By version-controlling them, you can quickly set up your environment on a new system.

3. **Consistency:** Dotfiles help maintain a consistent development environment across different machines. This is particularly useful when working on multiple systems or collaborating with others.

4. **Productivity:** Having a well-organized set of dotfiles can enhance your productivity by automating repetitive tasks and providing shortcuts for common operations.

## Custom scripts

In the realm of dotfiles, custom scripts play a crucial role in automating tasks, enhancing functionality, and streamlining the configuration process. For further information about what you'll find here:


| Name                 | Description                                                                                                                                           |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `colors.sh`          | Prints all available colors with their values in the Terminal. This script uses the `tput` command to display a variety of text styling and color options, providing a visual reference for available colors.                             |
| `tor.sh`             | Starts Tor and switches the system-wide proxy settings in macOS. This script configures a SOCKS proxy using Tor, enabling anonymous web browsing. Note: Using Tor does not make all web activities completely anonymous. |
| `updaterepos.sh`     | Recursively updates all git repositories within the given folder. This script automates the process of updating multiple Git repositories, handling changes, rebasing, and stashing local modifications.                    |
| `update-everything.sh`| Updates macOS, Homebrew, Node.js, npm, Ruby, ClamAV, and refreshes GPG keys all in one command. Aliased to `update`, this script simplifies the update process for various tools and dependencies on your system.        |


And that's basically it! As far as I'm concerned, you will find some useful commentaries going deeper into detail throughout the different files, but as mentioned before, don't hesitate to **fork** this repository and readjust each file according to your own, intransferable needs. 

### Forks

If you decide to [fork](https://help.github.com/en/github/getting-started-with-github/fork-a-repo) this project, do not forget to substitute my username and credentials with your own in the [gitconfig](/gitconfig) file.

## License

The code is available under the [MIT License](/LICENSE.txt). Stay **ethical**, stay _noice._ Oh, and remember that you can make the (freshly-landed-in-2024's) Dinosaur extremely happy if you...
<br />

---

<h1 align="center">
  <a href="https://karamazfolio.xyz/"><img src="https://raw.githubusercontent.com/JuditKaramazov/TCA-clampculate/main/public/img/christMazov.gif" width="150" height="150" alt="Original Christmas-Karama logo asset.">
</h1>
<h2 align="center">
  <a href="https://www.buymeacoffee.com/JuditKaramazov" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 207px !important;" ></a>
</h2>
