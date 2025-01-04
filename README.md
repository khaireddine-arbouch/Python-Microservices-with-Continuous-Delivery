[![Python application test with Github Actions](https://github.com/khaireddine-arbouch/Python-Microservices-with-Continuous-Delivery/actions/workflows/devops.yml/badge.svg)](https://github.com/khaireddine-arbouch/Python-Microservices-with-Continuous-Delivery/actions/workflows/devops.yml)

# Python-Microservices-with-Continuous-Delivery

## Steps to Build and Deploy a Python Microservice to AWS

### 1. **Project Setup**

*   Create a new GitHub repository.
*   Clone the repository to your local machine.
*   Create a virtual environment: `python3 -m venv ~/.project_name`
*   Activate the virtual environment: `source ~/.project_name/bin/activate`
*   Create the following files:
    *   `README.md`
    *   `Dockerfile`
    *   `Makefile`
    *   `buildspec.yml`
    *   `requirements.txt`
    *   `main.py`
    *   `mylib/__init__.py`
    *   `mylib/logic.py`

### 2. **Develop the Python Microservice**

*   Write the code for your microservice in `main.py`.
*   Use the `mylib` directory for any additional modules or libraries.
*   Install the necessary packages: `pip install -r requirements.txt`

### 3. **Containerize the Microservice**

*   Create a `Dockerfile` to build a Docker image of your microservice.
*   Include instructions to install dependencies, copy files, and expose the necessary ports.

### 4. **Set up AWS CodeBuild**

*   Create a new CodeBuild project in the AWS Management Console.
*   Configure the project to use the GitHub repository as the source.
*   Specify the `buildspec.yml` file to define the build commands.
*   Choose a suitable compute type for the build environment.
*   Select an IAM role that has permissions to access ECR and App Runner.

### 5. **Set up AWS ECR**

*   Create a new ECR repository to store the Docker images.
*   Give the repository a descriptive name.

### 6. **Configure buildspec.yml**

*   Define the build commands in `buildspec.yml` to:
    *   Install dependencies.
    *   Run tests.
    *   Build the Docker image.
    *   Tag the image with the ECR repository URI.
    *   Push the image to ECR.

### 7. **Deploy to AWS App Runner**

*   Create a new App Runner service in the AWS Management Console.
*   Select the ECR repository as the source.
*   Configure the service with the desired settings, such as:
    *   Port number
    *   Environment variables
    *   Auto-scaling options
*   Deploy the service.

### 8. **Continuous Delivery**

*   Enable automatic builds in CodeBuild to trigger builds on every code push to the GitHub repository.
*   App Runner will automatically deploy the new image from ECR whenever it is updated.

## AWS Services Used

*   **ECS (Elastic Container Service)**: Although not directly used, App Runner is built on top of ECS, providing a simplified way to deploy containerized applications.
*   **CodeBuild**: Used to build the Docker image of the microservice and push it to ECR.
   ![Screenshot 2025-01-04 174345](https://github.com/user-attachments/assets/dfcbf0d3-a389-46d1-a3de-630dea49e610)
*   **App Runner**: Used to deploy and run the containerized microservice.
   =![Screenshot 2025-01-04 175636](https://github.com/user-attachments/assets/02ede86f-2033-4d9a-beaf-bb207e4e2856)

*   **ECR (Elastic Container Registry)**: Used to store the Docker images of the microservice.
   ![Screenshot 2025-01-04 175555](https://github.com/user-attachments/assets/944b98c7-18cf-473e-bdeb-bae999ba7f71)

