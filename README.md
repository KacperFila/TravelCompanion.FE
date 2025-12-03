# About Travel Companion! ⛰️

Travel Companion is an .NET/Angular web application focused on creating, managing and documenting trips with your friends. It allows you to create travel plans which could be edited by your friends which makes managing travels easier! 

## Features:
1. Accounts
2. Plans (could modify, accept or reject suggestions)
3. Travels (could browse, set already visited points, rate)
4. Invitations (users could be invited to participate in a plan)
6. Sharing travel costs with specific users
7. Toast notifications using SignalR

## Technology used:
- ASP .NET Core
- PostgreSQL
- Docker
- Entity Framework
- SignalR

## How to run?
1. Create an empty folder and type: git clone https://github.com/KacperFila/TravelCompanion.FE.git
2. Make sure you're running Docker Desktop
3. Move into directory by typing: `cd TravelCompanion.FE`
4. Type: `docker build -t travelcompanion-angular . && docker run -d -p 4200:4200 --name travelcompanion-angular travelcompanion-angular`
5. Angular app is available under `localhost:4200`
6. Application needs BE part to work properly: https://github.com/KacperFila/TravelCompanion.BE
