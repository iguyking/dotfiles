function set-sshkeys-filevine {
    copy ~/.ssh/id_rsa.filevine ~/.ssh/id_rsa -force
    copy ~/.ssh/id_rsa.pub.filevine ~/.ssh/id_rsa.pub -force
}

function set-sshkeys-iguyking {
    copy ~/.ssh/id_rsa.iguyking ~/.ssh/id_rsa -force
    copy ~/.ssh/id_rsa.pub.iguyking ~/.ssh/id_rsa.pub -force
}
