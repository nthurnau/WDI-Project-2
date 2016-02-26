# PetDates

PetDates was created by Nicole Thurnau as her second project for General Assembly's WDI course in Santa Monica.

### Obejective
PetDates is a social networking site for pets and their human companions. The goal is to connect pets so that they may make new friends, gossip about their companions, and sniff each other online and in real-life. Pet companions can use the site too! They can meet other companions who have pets similar to theirs, join and create special interest groups, and most importantly, arrange pet meet-ups with other local pet companions.

### Project Requirements
The guidelines listed below were provided by the project markdown:

- Have at least 2 models (more if they make sense) – one representing someone using your application, and one that represents the main functional idea for your app
- Include sign up/log in functionality, with encrypted passwords & an authorization flow
- Have complete RESTful routes for at least one of your resources with GET, POST, PUT, PATCH, and DELETE
Utilize an ORM to create a database table structure and interact with your relationally-stored data
- Include wireframes that you designed during the planning process
- Have semantically clean HTML and CSS
- Be deployed online and accessible to the public

Necessary Deliverables

- A working full-stack application, built by you, hosted somewhere on the internet
- A link to your hosted working app in the URL section of your Github repo
- A git repository hosted on Github, with a link to your hosted project, and frequent commits dating back to the very beginning of the project. Commit early, commit often.
- A readme.md file with explanations of the technologies used, the approach taken, installation instructions, unsolved problems, etc.
- Wireframes of your app, hosted somewhere & linked in your readme
- A link in your readme.md to the publically-accessible user stories you created


### Wireframes
See my [Trello Board for Project 2](https://trello.com/b/rrfmu7vt/wdi-project-two)'s done column for wireframes.


### Technologies Used
- Ruby
- Rails
- HTML
- CSS with Bootstrap
- JQuery and JavaScript

###Apporach Taken
* 1) First, I drew out my Entity Models for my project.
* 2) Then, I made a planning board and wrote user-stories using [my project Trello board] (https://trello.com/b/rrfmu7vt/wdi-project-two). Follow the link to see my User Stories.
* 3) I created Active Record Models for Users, Profiles, Groups, Microposts (PetSounds), and Relationships.
* 4) Next, I began coding the basic rails components. I made models, controllers, and views that became the backbone of PetDates. I achieved full CRUD using RESTful Routing.
* 5) Finally, after much debugging, I began to style using Bootstrap and CSS.

###Unsolved Problems
* 1) There are still odd bugs surrounding user profiles. For example, after navigating the links on the user page a few times, Chrome loses its ability to route back to the user profile that corresponds to the proper user id and profile id.
* 2) Because I spent a lot of time debugging, I was unable to make the styling look as pristine as I wanted. I am pleased with the functionality though.
* 3) There are links missing in some places, but the nav bar, when it works properly, takes care of most of the navigation issues when a user is logged in.  
