
A Docker image for developing PHP app using PHP-FPM and nginx.

Usages
------

Put an `index.php` file under project root directory with:

        <?php
        print phpinfo();

Then

        # put your SSH pubkey at `mykey.pub` if you want SSH access
        $ make build run
        # check http://localhost:8080/

If you use [boot2docker](http://boot2docker.io/) replace `localhost` with the IP reported by `boot2docker ip`.

### SSH access

For developement, use the [insecure key provided by Phusion baseimage](https://github.com/phusion/baseimage-docker#login_ssh).

To enable SSH access in production you should build an image with your own public key.
