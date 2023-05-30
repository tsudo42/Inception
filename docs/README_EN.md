# Inception

Inception is an assignment from 42Schools, challenging us to create a web server using Docker. This project involves the setup and management of a web server with several key components.

### Key Features

- Simple setup process using the `make` command
- Running interconnected Docker containers with Nginx, Wordpress, and MariaDB
- Additional features include setup and operation of Redis Cache, Adminer, an FTP server, and an IRC server

Access to the website is available via `tsudo.42.fr`. Various configurations can be adjusted in the `srcs/.env` file.

## Table of Contents

- [Setup](#setup)
- [Usage](#usage)
- [Notes](#notes)

## Setup

1. Add the following line to your `/etc/hosts` file. This step allows you to access `localhost` by typing `tsudo.42.fr`.

```
127.0.0.1 tsudo.42.fr
```

2. Run the `make` command in the directory where the `Makefile` is located.

## Usage

Once you've completed the setup process, you can access `tsudo.42.fr` from your web browser.

You'll find a Wordpress post titled "Various Pages", which includes links to several other pages.

## Notes

There are a couple of important notes regarding this project:
- Docker secrets are not used.
- This setup is intended for local execution.

Currently LICENSE is not set for this repository.
