<a name="readme-top"></a>

<div align="center">

<img height="160" src="st-launcher.ico">

<h1 align="center">SillyTavern Launcher - Pyenv Edition</h1>

<p align="center">
    A fork of <a href="https://github.com/SillyTavern/SillyTavern-Launcher">SillyTavern Launcher</a> that replaces Conda with <strong>pyenv-win + venv</strong> for Python environment management.
</p>

[![GitHub Stars](https://img.shields.io/github/stars/jcd315/SillyTavern-Launcher-Pyenv.svg)](https://github.com/jcd315/SillyTavern-Launcher-Pyenv/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/jcd315/SillyTavern-Launcher-Pyenv.svg)](https://github.com/jcd315/SillyTavern-Launcher-Pyenv/network)
[![GitHub Issues](https://img.shields.io/github/issues/jcd315/SillyTavern-Launcher-Pyenv.svg)](https://github.com/jcd315/SillyTavern-Launcher-Pyenv/issues)
</div>

# Why this fork?

The upstream STL uses **Conda** to manage Python environments. This fork replaces Conda entirely with **pyenv-win** and Python's built-in **venv** module, giving you:

- **Lighter footprint** -- no Conda installation required
- **Faster setup** -- pyenv-win downloads only the Python version you need
- **Isolation** -- a dedicated `.stl-pyenv-3.12.10/` venv keeps dependencies separate
- **Compatibility** -- all upstream STL features still work; a shim neutralizes accidental `conda` calls

# 🔧 Prerequisites

1. **Git** -- install via `winget install -e --id Git.Git` or from [git-scm.com](https://git-scm.com/)
2. **pyenv-win** -- install via the [pyenv-win instructions](https://github.com/pyenv-win/pyenv-win#installation) and then run:
```shell
pyenv install 3.12.10
pyenv global 3.12.10
```

# 🔧 Installation (Windows)

1. Open File Explorer, navigate to the folder where you want to install the launcher, type `cmd` in the address bar, and run:
```shell
git clone https://github.com/jcd315/SillyTavern-Launcher-Pyenv.git && cd SillyTavern-Launcher-Pyenv && start installer_pyenv.bat
```
2. After installation, launch with:
```shell
Launcher_pyenv.bat
```

> **Note:** The standard `installer.bat` and `Launcher.bat` (Conda-based) are still included from upstream if you prefer to use those instead.

# ✨ Features
## **Core Utilities**
Manage essential tools for SillyTavern and other applications.

### **Supported Apps:**
- SillyTavern
- 7-Zip, FFmpeg, Node.js, yq, Visual Studio BuildTools, CUDA Toolkit, Tailscale, w64devkit

### **Functions:**
- Install, uninstall, and configure core utilities
- Edit environment variables and configurations via menu options

## **Text Completion Apps**
Set up and manage text generation platforms.

### **Supported Apps:**
- Text Generation Web UI (oobabooga)
- KoboldCPP
- KoboldCPP Raw
- LlamaCPP
- TabbyAPI
- TabbyAPI with ST Extensions

### **Functions:**
- Install, launch, uninstall, and customize modules through menu selections

## **Image Generation Apps**
Handle image generation platforms.

### **Supported Apps:**
- Stable Diffusion Web UI
- Stable Diffusion Web UI Forge
- ComfyUI
- Fooocus
- Ostris AI Toolkit

### **Functions:**
- Install, launch, uninstall, and tweak settings via the menu system

## **Voice Generation Apps**
Manage voice synthesis and processing tools.

### **Supported Apps:**
- XTTS
- AllTalk
- AllTalk v2 (with diagnostic and fine-tuning modes)
- RVC (Retrieval-based Voice Conversion, including real-time support)

### **Functions:**
- Install, launch, uninstall, and adjust configurations for voice generation tools

## **Additional Features**
- **Backup and Restore:** Create and restore SillyTavern backups.
- **SSL Support:** Generate SSL certificates via a dedicated menu.
- **Troubleshooting:**
  - Detect VPN issues
  - Gather GPU information
  - Check ports
  - Resolve GitHub conflicts
  - Clear caches (Node.js, npm, pip)
  - Export diagnostic data
  - Restart the launcher
  - Discord Servers
- **App Management:** Auto-update, switch branches, manage installations/uninstallations.
- **Logging:** View logs for troubleshooting (`logs/` directory).
- **Custom Settings:** Configure custom shortcuts and modules (`settings/` directory).


# Keeping up with upstream

This fork is periodically synced with the upstream [SillyTavern-Launcher](https://github.com/SillyTavern/SillyTavern-Launcher). If you want to pull the latest upstream changes yourself:

```shell
git remote add upstream https://github.com/SillyTavern/SillyTavern-Launcher.git
git fetch upstream
git merge upstream/main
```

# Questions or suggestions?

| [![][discord-shield-badge]][discord-link] | [Join the SillyTavern Discord community!](https://discord.gg/sillytavern) Get support, share characters and prompts. |
| :---------------------------------------- | :------------------------------------------------------------------------------------------------------------------- |

For issues specific to the pyenv fork, please [open an issue here](https://github.com/jcd315/SillyTavern-Launcher-Pyenv/issues).

<div align="right">

[![][back-to-top]](#readme-top)
    
</div>


<!-- LINK GROUP -->
[back-to-top]: https://img.shields.io/badge/-BACK_TO_TOP-151515?style=flat-square
[discord-link]: https://discord.gg/sillytavern
[discord-shield]: https://img.shields.io/discord/1100685673633153084?color=5865F2&label=discord&labelColor=black&logo=discord&logoColor=white&style=flat-square
[discord-shield-badge]: https://img.shields.io/discord/1100685673633153084?color=5865F2&label=discord&labelColor=black&logo=discord&logoColor=white&style=for-the-badge
