# php-deployer
Dockerfile for php deployer

[Official Website](https://deployer.org/)

### Volumes
`/tmp/ssh` : share `~/.ssh folder`  
`/usr/src/app` : share app code folder  

### Env
`SSH_AUTH_SOCK` : To share your ssh agent socket with the container : default `/tmp/ssh-auth-sock`  
`SSH_PRIV_KEY` : ssh private key filename : default `id_rsa`  
`SSH_CONFIG_FILE` :  ssh config filename : default `config`  


### Run
sharing ssh agent socket from host  
`docker run -it --rm -v $SSH_AUTH_SOCK:/tmp/ssh-auth-sock -v /appworkspace:/usr/src/app --env SSH_AUTH_SOCK=/tmp/ssh-auth-sock plopoyop/php-deployer dep --help`

sharing ssh key from host  
`docker run -it --rm -v ~/.ssh:/tmp/ssh/ -v /appworkspace:/usr/src/app plopoyop/php-deployer dep --help`
