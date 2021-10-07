function Start-Emacs {
    emacs.exe -nw $args
}
New-Alias emacs Start-Emacs

function Remove-Folder-Recursively {
    Remove-Item -Recurse -Force
}
New-Alias rmr Remove-Folder-Recursively

function Git-Branch {
    git.exe branch $args
}
New-Alias gb Git-Branch

function Git-Checkout {
    git.exe checkout $args
}
New-Alias gco Git-Checkout

function Git-Pull {
    git.exe pull $args
}
Set-Alias -Name gl -Value Git-Pull -Force -Option AllScope

function Git-Diff {
    git.exe diff
}
New-Alias gd Git-Diff

function Git-Diff-Cached {
    git.exe diff --cached
}
New-Alias gdc Git-Diff-Cached

function Git-Push {
    git.exe push $args
}
Set-Alias -Name gp -Value Git-Push -Force -Option AllScope

function Git-Push-Force {
    git.exe push --force $args
}
Set-Alias gpf Git-Push-Force

function Git-Log {
    git.exe log --graph --pretty=format:"%C(bold red)%h%Creset -%C(bold yellow)%d%Creset %s %C(bold green)(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit
}
New-Alias glg Git-Log

function Edit-Profile {
    Start-Emacs $PROFILE
}
