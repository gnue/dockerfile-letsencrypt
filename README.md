# Docker Image for letsencrypt

Run letsencrypt on docker

## Installation

```sh
$ docker pull gnue/letsencrypt
```

## Usage

```sh
$ docker run -t -i --rm -v "$(pwd):/data/etc/letsencrypt:/etc/letsencrypt" gnue/letsencrypt [OPTIONS] -d example.com
```

* file is EPUB file only
* OPTIONS
  * show help `docker run -t -i --rm gnue/letsencrypt -h`
  * can use variables
    * `$file` is file path
    * `$fname` is file name without file exstention

## docker-compose

```sh
$ docker-compose run --rm letsencrypt -d example.com
```

Directory structure:

```
.
├── docker-compose.yml    # docker-compose configuration file
├── data                  #
│   └── ...
└── webroot               # web root
    └── ...
```

docker-compose.yml:

```yaml
letsencrypt:
  image: gnue/letsencrypt
  volumes:
    - "./data/etc/letsencrypt:/etc/letsencrypt"
    - "./data/var/lib/letsencrypt:/var/lib/letsencrypt"
    - "./data/log/lib/letsencrypt:/var/log/letsencrypt"
    - "./webroot:/var/www/html"
```

## License

[MIT](LICENSE.txt)
