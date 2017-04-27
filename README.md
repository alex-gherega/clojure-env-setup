# Clojure env setup

## What you get

Configs and dependencies for Emacs to integrate Cider plugin and related Clojure edit utilities such as:

* ElDoc mode
* Clojure mode
* Syntax highlight
* Parenthesis automation - Paredit
* Autocompletion plugin
* Rainbow parenthesis delimiters
* Parenthesis matching

A how-to guide to get you started with a basic Clojure development environment using:
* [Emacs](https://www.gnu.org/software/emacs/)
* [Leiningen](https://leiningen.org/)

## Notations & definitions

Parentheses are used below to denote important steps (and to make you more comfortable with Lisp like sintax)

$NAME denotes a system variable called NAME; I'll refer to your basic home directory (e.g. /home/alex/) by $HOME sys variable.

## System requirements

__You'll need:__

a. UNIX/Linux environment
<dl>
	<dd>(virtual-machine with Ubuntu 14.04 or newer)</dd>
	<dd>(tested with Ubuntu 14.04 & Ubuntu 15.04)</dd>
	<dd>(have your Wi-Fi working on the VM)</dd>
</dl>

b. Java 1.8 installed and visible in your $PATH

c. Emacs 24.4.1 [tested] or higher installed

## Dev env setup: a guide

### Leinigen

The project automation tool

(have the following script downloaded: [lein](https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein))

(place it on your $PATH where your shell cand find it)

(set it to be executable (chmod a+x /path/to/your/lein-download-dir/lein))

(run it `lein` and it will download the self-install package)

&emsp; (after that run `lein upgrade` to get the latest stuff in)

### Emacs

__note:__ for a quick-extremely-basic-hands-on Emacs editting [go here](http://ocean.stanford.edu/research/quick_emacs.html)

__plug'n'play setup (the easy way):__

(clone [this](https://github.com/alex-gherega/clojure-env-setup) git repo `git clone [this](https://github.com/alex-gherega/clojure-env-setup)` into your $HOME/.emacs)

__manual setup (the hadrcore way):__
<dl>
  <dd>a. After installing emacs start it and run: M-x package-refresh-contents</dd>

  <dd>b. Add an init.el file to your $HOME/.emacs/ directory</dd>

  <dd>c. Emacs ElDoc mode:</dd>
  <p>&emsp;&emsp; (install eldoc mode [follow this recipe] (https://www.emacswiki.org/emacs/ElDoc#toc2))</p>

  <dd>d. Clojure plugins [required]
  <dl>
    <dd>(Emacs CIDER plug-in[follow this recipe](https://github.com/clojure-emacs/cider/blob/master/README.md))>/dd>
    <dd>(Clojure REPL plug-in (you're done! comes inside CIDER plug-in))</dd>
    <dd>(Emacs clojure-mode [follow this recipe](https://github.com/clojure-emacs/clojure-mode/blob/master/README.md))</dd>
  </dl></dd>
  
  <dd>e. Clojure plugins [not required but helpful]
    <p>&emsp;&nbsp;&nbsp; (Syntax highlight plug-in (you're done! Comes inside CIDER plug-in + Clojure mode))<p>
    <dl>
		<dd>(Parenthesis automation 
			<br>&emsp;&emsp;&emsp;(install Paredit [follow this recipe]())
			<br>&emsp;&emsp;&emsp;(add the following `(add-hook 'cider-repl-mode-hook #'paredit-mode)` to your init.el file)
		</dd>
		<dd>(Auto-completion plug-in [folow this recipe](http://cider.readthedocs.io/en/latest/code_completion/))</dd>
		<dd>(Close parenthesis delimieters & match:
			<br>&emsp;&emsp;&emsp;([follow this recipe](https://github.com/Fanael/rainbow-delimiters/blob/master/README.md))
			<br>&emsp;&emsp;&emsp;(also add `(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)` and `(add-hook 'cider-mode-hook #'rainbow-delimiters-mode)`to your init.el file)
			<br>&emsp;&emsp;&emsp;(add `(show-paren-mode 1)` to your init.el file)
		</dd>
    </dl>
  </dd>
</dl>
This project is publicly licesened under a creative commons license:

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.

