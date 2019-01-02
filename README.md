# gcloud Docker image

gcloud Docker image based on Debian Jessie.

## Usage
1. Clone and build Docker image.
    ```shell
    $ git clone mas9612/gcloud-docker
    $ cd gcloud-docker
    $ docker build -t gcloud .
    ```
1. (Optional) Add alias to your shell config file (.bashrc, .zshrc, ...)
    ```shell
    alias gcloud='docker run -it --rm -v $(pwd):/gcloud -v ~/.config:/root/.config -v ~/.ssh:/root/.ssh gcloud'
    ```

You must mount `/root/.config` , `/root/.ssh` directory to your local machine in order to save auth info.
You can do this by Docker [bind mount](https://docs.docker.com/storage/bind-mounts/) feature.

Also, if you want to use `gcloud compute scp` command and want to send files placed in current working directory, you should add `-v $(pwd):/gcloud` option.
