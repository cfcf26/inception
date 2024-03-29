# Inception
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

## General guidelines
- This project needs to be done on a Virtual Machine.
- All the files required for the configuration of your project must be placed in a `srcs` folder.
- A `Makefile` is also required and must be located at the root of your directory. It must set up your entire application (i.e., it has to build the Docker images using `docker-compose.yml`).
- Read the documentation related to Docker usage and anything else you find helpful to complete this assignment.

## Mandatory part
Set up a small infrastructure composed of different services under specific rules. The whole project has to be done in a virtual machine using `docker-compose`.

- Each Docker image must have the same name as its corresponding service.
- Each service has to run in a dedicated container.
- The containers must be built either from the penultimate stable version of Alpine or Debian.
- Write your own Dockerfiles, one per service. The Dockerfiles must be called in your `docker-compose.yml` by your `Makefile`.
- Set up:
  - A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
  - A Docker container that contains WordPress + php-fpm only without nginx.
  - A Docker container that contains MariaDB only without nginx. 
  - A volume that contains your WordPress database.
  - A second volume that contains your WordPress website files.
  - A docker-network that establishes the connection between your containers.
- Your containers have to restart in case of a crash.
- In your WordPress database, there must be two users, one being the administrator. The administrator's username can't contain admin/Admin or administrator/Administrator.
- Configure your domain name `login.42.fr` to point to your local IP address.
- Your NGINX container must be the only entrypoint into your infrastructure via the port 443 only, using the TLSv1.2 or TLSv1.3 protocol.

## Bonus part
- Set up redis cache for your WordPress website to properly manage the cache.
- Set up a FTP server container pointing to the volume of your WordPress website.
- Create a simple static website in a language of your choice except PHP.
- Set up Adminer.
- Set up a service of your choice that you think is useful. Justify your choice during the defense.

## Submission and peer-evaluation 
Turn in your assignment in your Git repository. Only the work inside your repository will be evaluated during the defense. Double check the names of your folders and files to ensure they are correct.

<img width="1082" alt="스크린샷 2024-03-29 오전 11 32 20" src="https://github.com/cfcf26/inception/assets/75878816/47f63572-bf74-47cf-9b4d-bf0ec41f3e53">
