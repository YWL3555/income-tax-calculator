# Income tax calculator

### ***Malaysia tax rate is used in this application***

## Description

The idea of this application is first started as a technical interview question, and I now decided to keep developing and enhancing it as my pet project.

## Instruction
1. Run this command:
```
docker-compose up --build
```

2. Open ***localhost:3000*** on web browser to use the application.

# User Interface
This app implements a simple UI frontend using Tailwind and JQuery.

Users can send a POST API request by submitting the form and get the monthly payslip generated from rails. A table also displayed on the right side, listing out all the tax records from database.

A snapshot showing the frontend page, is attached below:

<img width="1431" alt="Screenshot 2023-02-03 at 12 13 06 PM" src="https://user-images.githubusercontent.com/45376126/216511417-e8b79246-deb4-4619-adfb-dcb329846d7d.png">

## TBD
- Create table for tax brackets
- Create page for updating tax brackets
- Add tax brackets for different countries
