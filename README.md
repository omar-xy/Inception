# Inception

## 📌 Project Overview
Inception is a **Web Development & System Administration** project that requires setting up a secure, containerized web hosting infrastructure using **Docker Compose**. The goal is to virtualize multiple services in separate **Docker containers**, ensuring security, scalability, and maintainability.  

## 🏗️ Tech Stack
- **Docker & Docker Compose**  
- **Nginx** (Reverse Proxy with TLSv1.2/1.3)  
- **MariaDB** (Database)  
- **WordPress + PHP-FPM** (CMS)  
- **Volumes & Networks** (Persistent storage and container networking)  
- **Environment Variables & Secrets Management**  

## 🚀 Features
✅ Secure **Nginx** server with **TLSv1.2/1.3** (HTTPS only)  
✅ **WordPress + PHP-FPM** running in an isolated container  
✅ **MariaDB** as the database backend with persistent storage  
✅ Secure user authentication with restricted admin credentials  
✅ All services managed via **Docker Compose**  
✅ Custom **domain name** (e.g., `otaraki.42.fr`)

## 📂 Project Structure

Inception/
│── srcs/
│   ├── docker-compose.yml   # Service definitions
│   ├── .env                 # Environment variables
│   ├── requirements/        # Individual services
│   │   ├── nginx/           # Nginx configuration & Dockerfile
│   │   ├── mariadb/         # MariaDB setup & Dockerfile
│   │   ├── wordpress/       # WordPress setup & Dockerfile
│   │   ├── bonus/           # Optional services (Redis, FTP, etc.)
│   └── secrets/             # Secure credentials (ignored in Git)
│── Makefile                 # Automates setup & cleanup
└── README.md                # Project documentation

## ⚙️ Mandatory Requirements
- Each **service must run in its own container**.  
- Containers must be built from **Alpine** or **Debian** (latest version is prohibited).  
- **NGINX container** must be the only entry point (port **443** only).  
- No passwords must be stored in **Dockerfiles** (use environment variables).  
- The **Docker network** must connect all containers securely.  
- The **WordPress database** must contain at least **two users**, one being an administrator (username cannot contain `admin`/`administrator`).  
- Containers must **restart on failure**.  
- **No infinite loops** (`tail -f`, `sleep infinity`, etc.) inside containers.  

## 🔥 Bonus Features
If the mandatory part is **perfect**, the following bonus features can be implemented:  
✅ **Redis caching** for WordPress  
✅ **FTP server** for managing files  
✅ **Adminer** (Database management tool)  
✅ **Static website** (e.g., portfolio or showcase page)  
✅ **Any other useful service** (justified during evaluation)  

## 🔧 Setup Instructions
1. **Clone the Repository**  
   ```bash
   git clone https://github.com/yourusername/inception.git
   cd inception

## Set Up Environment Variables
Create a `.env` file in the `srcs/` directory and add the following:

DOMAIN_NAME=otaraki.42.fr

# MariaDB Setup
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_DATABASE=wordpress
MYSQL_USER=your_db_user
MYSQL_PASSWORD=your_db_password

# WordPress Setup
WP_ADMIN_USER=your_admin_user
WP_ADMIN_PASSWORD=your_admin_password
WP_ADMIN_EMAIL=your_email@example.com
WP_USER=your_wp_user
WP_USER_PASSWORD=your_wp_user_password
WP_USER_EMAIL=your_wp_user_email@example.com

## Build and Run
  -- make

## Notes
- **Do not store passwords, API keys, or credentials in Git.**  
  Use `.env` files and **Docker secrets** instead.
  
- **Avoid using the following in Docker Compose:**  
  - `network: host`
  - `--link`
  - `links:`
  
- **Ensure containers restart on failure** but do not use infinite loops like:  
  - `tail -f`
  - `sleep infinity`
  - `while true`

- **NGINX must be the only entry point** (exposing port **443** only).

- **Use the penultimate stable version of Alpine or Debian**, as the latest version is prohibited.


