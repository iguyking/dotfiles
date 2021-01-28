function clean-git {
    git remote prune origin
    git branch -vv | where {$_ -match '\[origin/.*: gone\]'} | foreach {git branch -D ($_.split(" ",[StringSplitOptions]'RemoveEmptyEntries')[0])}
}
