# Garden-App

A [Laravel 8](https://laravel.com/), [Inertia.js](https://inertiajs.com/), and [Vue.js](https://vuejs.org/) based garden planning tool

## Datenarchitektur

Vue in the Front, Laravel in the Back


Inertia.js allows the Vue.js based front-end of Garden-App to be embedded in a MVC back-end structured with and based on Laravel 7. The GUI is 
written using the usual Vue.js structures of Pages and Components.   


Requests are routed to controllers and Actions which then either render the appropriate Vue templates with the needed Data, authenticate the user, or make alterations to data in the database depending on the needed Functionallity for the request.

### Database Architecture

Database architecture can be easily viewed in [the garden_app_db_diagram](./db_dump/garden_app_db_diagram.pdf)

 ### Authentication
 
 Authentication is handled using the [Fortify](https://laravel.com/docs/8.x/fortify) framework from Laravel. Users can either register or login on the start page. Once authenticated, users have access to their app dashboard. Admin users must be created manually in the database ("users"."admin" = 1), they have access to the admin dashboard through the link in the menu on the upper right corner of the dashboard navigation.
 
 ### User Functionality
 
 The controllers for most app functionality altering the databse are built with a CRUD structure. Gardens and Beds can be Created, Read, Updated, and Deleted 
 in the user dashboard. These requests are routed to the Garden- / and BedController. Solely the garden planning tool is routed to the CalculateVegProduction.php action which plans the garden using the available space in the beds and selected varieties and then enters the results in the database.
 
 
 The user account information, passwords, and profile pictures can be viewed, updated, and deleted in the profile dashboard accessed through the menu in the top right corner of the main user dashboard.
 
 ### Admin Functionality
 
 In the admin dashboard all users, their passwords, and profile pictures can be edited.
 
 Additionally the available varieties can be Read, Created, Updated, and Deleted here. Requests for these functions are routed to the VarietyController. This controller alters the database accordingly.
 
 ### Object Oriented Programming
 
 The MVC structure of the app back-end allows for a high level of OOP. Separating concerns and making an easily maintainable and expandable architecture. The same is true for the front-end due to the use of the Vue framework and its Page and Component features. Templating allows HTML and needed functional JavaScript to be written together compartmentalized for the functionality of each Component and/or Page. Styling is handled using the Tailwind class based framework.

## Getting Started

To setup the App on your system firstly install and setup [Laravel Homestead](https://laravel.com/docs/8.x/homestead).

Then download the [project files](https://github.com/cody-jolly/garden-app) into the appropriate directory, then provision and start the vagrant virtual-box.

Once downloaded, import the [SQL dump](./db_dump/garden_app.sql) into a new Database named garden_app.
 
Finally, make needed adjustments to the .env file in the main app directory and open the assigned url in your browser. Register a usser, login, explore, enjoy...

To access the admin dashboard, use SQL to 'UPDATE users SET admin = 1 WHERE email = {"insert your user's email here"}' 


