# Github pages src

Source code for my [github pages website](https://radicalteapot.github.io/).

Built using [Hugo](https://gohugo.io/) with the [hugo whisper theme](https://github.com/zerostaticthemes/hugo-whisper-theme).

## How to build

First time

```powershell
git clone git@github.com:RadicalTeapot/github-pages.git github-pages
cd github-pages
git clone https://github.com/jugglerx/hugo-whisper-theme.git themes/hugo-whisper-theme
git clone git@github.com:RadicalTeapot/radicalteapot.github.io.git github-public
hugo --gc --minify --destination github-public
cd github-public
git add .
git commit -m "Automatic commit after hugo build"
git push -q
```

Subsequent times

```powershell
Remove-Item -Recurse -Force .\github-public\
git clone git@github.com:RadicalTeapot/radicalteapot.github.io.git github-public
hugo --gc --minify --destination github-public
cd github-public
git add .
git commit -m "Automatic commit after hugo build"
git push -q
```
