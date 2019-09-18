# Installation :

```shell
git clone git@gitlab.com:vmingam/dot_vim_files.git ~/.vim
```

# Install plugins as submodules

With pathogen installed, it’s now possible to keep the files for each plugin together, which means that every plugin can be kept in its own git repository. The best way to do this is to use git submodules, which are designed especially for the purpose of keeping git repositories within a git repository.

To install the fugitive plugin as a git submodule, take the following steps:

```shell
cd ~/.vim
mkdir ~/.vim/bundle
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

# Installing your Vim environment on another machine

Once your vim configuration is under version control, it’s quite straightforward to import your settings to any machine that has git installed. If you followed the instructions above to put your vimrc and plugins in a dotvim directory, then you can follow these steps to synchronise them to another machine:


```shell
cd ~
git clone http://github.com/username/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update
```

As Marcin Kulik points out in the comments below, the last two git commands can be rolled in to one:

```shell
git submodule update --init.
```

# Upgrading a plugin bundle

At some point in the future, the fugitive plugin might be updated. To fetch the latest changes, go into the fugitive repository, and pull the latest version:

```shell
cd ~/.vim/bundle/fugitive
git pull origin master
```


# Upgrading all bundled plugins

You can use the foreach command to execute any shell script in from the root of all submodule directories. To update to the latest version of each plugin bundle, run the following:

```shell
git submodule foreach git pull origin master
```


# Further reading

[github](http://github.com/) - free git hosting for open source projects

[GitCasts screencast on git submodules](http://blip.tv/file/4218925)

[Pathogen.vim](http://www.vim.org/scripts/script.php?script_id=2332) - allows Vim plugins to be installed as bundles

[Fugitive.vim](https://github.com/tpope/vim-fugitive) - a git wrapper for Vim

[git-submodule(1) Manual Page](http://www.kernel.org/pub/software/scm/git/docs/v1.7.5.4/git-submodule.html)

# Updates

Matt noted in the comments that when you follow this method, generating helptags dirties the submodule’s git repository tree. Several other people chimed in with suggestions on how to fix this. Nils Haldenwang has written a blog post describing a simple fix, which just involves adding the line ignore = dirty to the .gitmodules file for each submodule that reports a dirty tree when you run git status. Go and read Nils’s blog post, which goes into a bit more detail.t
