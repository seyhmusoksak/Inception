# Inception

## About the Project

Inception aims to set up a basic server infrastructure using Docker and container technology. The project runs Nginx, WordPress, and MariaDB services in isolated containers and enables communication between them.

## Technologies Used

- Docker
- Docker Compose
- Bash
- Nginx
- WordPress
- MariaDB

## Important Note

The project uses data volumes for persistent storage. To ensure proper operation, please create the following directories in your home folder:

```bash
mkdir -p ~/data/wordpress
mkdir -p ~/data/mariadb
```

## Installation

1. **Requirements:**
   - Docker must be installed on your system.
   - Docker Compose must be installed.

2. **Clone the Project:**
   ```bash
   git clone https://github.com/seyhmusoksak/Inception.git
   cd Inception
   ```

3. **Create Volume Directories:**
   ```bash
   mkdir -p ~/data/wordpress
   mkdir -p ~/data/mariadb
   ```

4. **Start the Services:**
   ```bash
   make up
   ```
   or
   ```bash
   docker compose up -d
   ```

5. **Stop the Services:**
   ```bash
   make down
   ```
   or
   ```bash
   docker compose down
   ```

## Directory Structure

- `srcs/` : Contains Dockerfiles and configuration files for the services.
- `Makefile` : Provides convenient commands for starting and stopping the project.

## Usage

After starting the project, you can access WordPress via Nginx and interact with the MariaDB database. You can customize configuration files and environment variables as needed.

## Contributing

If you have suggestions, bug reports, or feature requests, please use GitHub Issues.

## License

This project is developed for educational and personal use.
