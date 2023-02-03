# Description

This branch implements a caching pattern into generate payslip function, to optimize the performance of calculating the tax amount.

Github actions is also added into this branch, so that it will triggers the Rspec automated unit test on every push.

Besides that, there are two more files added into the code repo, i.e., **Dockerfile** and **docker-compose.yml**. By using these two files, the project can generate an docker image, and run as container.


To run the application in docker, use this command:
```
docker-compose up --build
```
