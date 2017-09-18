# Prosody 0.10.0 for Docker

This is the Prosody 0.10.0 Docker image building repository. It was only designed to be used on the Prosody build server to do pushing to the [Docker registry](https://registry.hub.docker.com).

For more images please see here: [Prosody on Docker](https://registry.hub.docker.com/u/prosody/prosody/).

## Apendix
__project_path__: The path where you cloned this project.

## Building

Docker images are built off an __ubuntu:16.04__ base. Here we have updated the sources deps to get prosody `0.10.0`.
In addition, we have some tools as `nano`, `expect` to help when we need to access in the container.

To build the image, you need run the following command:
```bash
cd <project_path>
docker build -t prosody-0.10.0:2.0 .
```

### Volumes

Volumes is mounted in `/prosody` directory when the image was building, It contains the following files and directories:

* __/etc/prosody.cfg.lua__:
  * Prosody configuration file(s)
  * It cotains enable modules, mucs, interfaces, and more.
* __/etc/conf.d/__:
  * It can contain new prosody configuration. For example one new __virtual host__, __SSL certificates__.
* __/modules__ (suggested):
  * Location for including additional modules
  * Remeber you should enable each installed module in your prosodody.cfg.lua. see http://prosody.im/doc/installing_modules#paths

## Running

1. Run one image with postgres.
```bash
docker run --name prosody-db -e POSTGRES_PASSWORD=prosody -e POSTGRES_DB=prosody -d postgres
```
2. When the postgres service is ready. run:
```bash
docker run --name prosody-0.10.0 -d -p 5280:5280 -p 5222:5222 -p 5269:5269 --link prosody-db:prosody-db -v <project_path>/prosody:/prosody prosody-0.10.0:2.0
```

### Ports

The image exposes the following ports to the docker host:

* __5222__: c2s port
* __5269__: s2s port
* __5347__: XMPP component port
* __5280__: BOSH / websocket port
* __5281__: Secure BOSH / websocket port
