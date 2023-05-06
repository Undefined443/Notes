# You need download and install git for windows before you execute this script
# https://gitforwindows.org
$Env:http_proxy="http:127.0.0.1:7890";$Env:https_proxy="http:127.0.0.1:7890"

# Maybe you should do this manually
winget install --id Microsoft.Powershell --source winget

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex && `
scoop bucket add extras && `
scoop bucket add java && `
scoop install vim && `
scoop install sudo

winget install JanDeDobbeleer.OhMyPosh -s winget &&`
echo 'oh-my-posh init pwsh | Invoke-Expression' >> ${PROFILE} &&`
sudo oh-my-posh font install  # They suggest Meslo LGM NF
