
A Docker image for developing PHP app using PHP-FPM and nginx.

This image is built for development, not deployment, so it does not contain the app directory `public`.  Changes to the content of `public` are reflected immediately in the container.

Usages
------

Add a `public/index.php` file with:

        <?php
        print phpinfo();

Then

        $ make build run
        # check http://localhost:8080/

If you use [boot2docker](http://boot2docker.io/) replace `localhost` with the IP reported by `boot2docker ip`.
