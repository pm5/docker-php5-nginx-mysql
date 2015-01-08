
A Docker image for developing PHP app using PHP-FPM and nginx.

Usages
------

Add a `index.php` file with:

        <?php
        print phpinfo();

Then

        $ make build run
        # check http://localhost:8080/

If you use [boot2docker](http://boot2docker.io/) replace `localhost` with the IP reported by `boot2docker ip`.
