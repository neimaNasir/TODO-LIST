
# Cloud Engineering Pathway Assessment
## Full-Stack To-Do List Application Documentation

## Overview
This documentation provides a step-by-step guide to setting up and running a full-stack To-Do List application that has been containerized using Docker and orchestrated with Docker Compose. The application consists of three main components:

- **Frontend**: A React-based user interface.
- **Backend**: A Node.js and Express API for handling CRUD operations.
- **Database**: A MongoDB instance for data storage.

The containerization process ensures the application runs consistently across different environments, simplifying deployment and scalability.

## Features
- **Task Management**: Create, read, and delete tasks.
- **Responsive Design**: Frontend built with React for a seamless user experience.
- **Containerized Architecture**: Dockerized for easy setup and deployment.
- **Scalable Backend**: Powered by Node.js and Express.
- **Persistent Data Storage**: MongoDB for reliable data management.

## Setup Instructions

### Prerequisites
Before proceeding, ensure the following tools are installed on your system:
- **Docker**: For containerization.
- **Docker Compose**: For orchestrating multi-container setups.
- **Git**: For cloning the repository.

### Step 1: Clone the Repository
Clone the repository to your local machine:

```bash
git clone https://github.com/icnoka/fullstack-todo-list.git
cd fullstack-todo-list
```

### Step 2: Build and Run the Application with Docker

#### Build and Start the Containers:
Run the following command to build the Docker images and start the containers:

```bash
docker-compose up --build
```

This command will:
- Build the Docker images for the frontend, backend, and database.
- Start the containers and configure the network for communication between services.

#### Verify Container Status:
Ensure all containers are running by executing:

```bash
docker ps
```

You should see three containers: frontend, backend, and database.

#### Access the Application:
- **Frontend**: Open your browser and navigate to [http://localhost:3000](http://localhost:3000).
- **Backend API**: Access the API at [http://localhost:5000/api/todos](http://localhost:5000/api/todos).
- **Database**: MongoDB is accessible at `mongodb://localhost:27017`.

#### Stop the Containers:
To stop and remove the containers, run:

```bash
docker-compose down
```

## Dockerfiles and Docker Compose Configuration

### Dockerfiles
Each component of the application has its own Dockerfile:

#### Frontend Dockerfile:
- Uses Node.js to install dependencies and start the React development server.
- Exposes port 3000 for the frontend.

#### Backend Dockerfile:
- Uses Node.js to install dependencies and start the Express server.
- Exposes port 5000 for API communication.

#### Database Dockerfile:
- Uses the official MongoDB image.
- Preconfigures environment variables for database setup.

### Docker Compose
The `docker-compose.yml` file orchestrates the setup of the three containers. It defines:
- **Services**: frontend, backend, and database.
- **Volumes**: Persistent storage for the MongoDB database.
- **Environment Variables**: Database credentials and application configuration.

### Network Setup
- The frontend communicates with the backend via HTTP on port 5000.
- The backend communicates with the database on the default MongoDB port (27017).

### Exposed Ports
| Component | Port   |
|-----------|--------|
| Frontend  | 3000   |
| Backend   | 5000   |
| Database  | 27017  |

### Security
- **Environment Variables**: Sensitive data like database credentials are stored in environment variables (mongodb://mongo:27017/todo-db).

## Troubleshooting Guide

### Common Issues and Solutions

#### Containers Not Starting:
**Solution**: Check the logs for errors:

```bash
docker-compose logs
```

#### Port Conflicts:
**Solution**: Identify and stop processes using the conflicting ports:

```bash
sudo lsof -i :<port>
kill -9 <PID>
```

#### Application Not Accessible:
**Solution**: Verify that all containers are running:

```bash
docker ps
```

Restart the containers if necessary:

```bash
docker-compose restart
```

## Container Testing Script
To verify that all services are running correctly, a testing script (`test.sh`) is provided. The script performs the following checks:
- **Container Status**: Ensures all containers are running.
- **Database Connection**: Verifies the database connection.

### Running the Script
Grant execute permissions to the script:

```bash
chmod +x test.sh
```

Execute the script:

```bash
./test.sh
```

## Conclusion
This documentation provides a detailed guide to setting up and running the full-stack To-Do List application using Docker and Docker Compose. By following these instructions, you can ensure a smooth and consistent deployment across various environments. 

