function Start-Emacs {
    emacs.exe -nw $args
}
New-Alias emacs Start-Emacs

function Remove-Folder-Recursively {
    Remove-Item -Recurse -Force
}
New-Alias rmr Remove-Folder-Recursively

function Edit-Profile {
    Start-Emacs $PROFILE
}
