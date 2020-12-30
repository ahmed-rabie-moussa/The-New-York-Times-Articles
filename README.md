# NY Times Most Popular Articles
Prerequisites :
* Android Studio or any IDE that support Flutter must be installed.
*	See https://developer.nytimes.com/ for details of APIs exposed by The New York Times.


## General Info
A simple app to hit the NY Times Most Popular Articles API and show a list of articles,
That shows details when items on the list are tapped.
On parsing the response from api, user will be able to get the list of all most viewed articles and user can select any article to view details.


## Technologies
Project is created with:
* Mobile Cross Platform (Flutter)
* Provider pattern: v4
* REST Api (nyt).
* Unit testing
* Mockito testing

## Setup
To run this project, download the code:
* Create a new Flutter project via flutter create some_project
* Replace the ("lib/", "assets/") folders and the pubspec.yaml file with the attached files
* flutter packages get
* flutter run (with a running emulator or real device connected to your machine) to view the app

## Add to pubspec.yaml
```
provider: ^4.3.2+2
http: ^0.12.2
intl: ^0.16.1
mockito: ^4.1.3
```


## Example:
![](https://firebasestorage.googleapis.com/v0/b/newsapp-2c3ef.appspot.com/o/NYTimes.gif?alt=media&token=cb02cdbc-13c1-4314-91a1-eccd006baf1e)

###### Created BY
Ahmed R. Moussa
