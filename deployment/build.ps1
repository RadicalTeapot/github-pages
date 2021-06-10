Remove-Item -Recurse -Force .\github-public\
git clone git@github.com:RadicalTeapot/radicalteapot.github.io.git github-public
hugo --gc --minify --destination github-public
cd github-public
git add .
git commit -m "Automatic commit after hugo build"
git push -q
