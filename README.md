# Protaly

Mobile application created with Flutter for managing projects and its tasks. It uses local database as main datasource for now. For the it is planned to add remote data source as Firestore or standard REST API and then implement Mediator design pattern for choosing remote or local datasource. 
<br>
<br>
Here is a simplistic overview of the whole application.
![protaly](https://github.com/comsysto/Todo-mobile-flutter-app/assets/47975199/8d82efdb-5771-48bc-8f17-6fd3851e2b75)

## Data layer
The data layer for now has 2 available data sources, Hive and Isar databases. By default, Hive is used as a local database, but if you wish to use Isar, simply go to the `di.dart` file and change dependency injection for repositories from Hive to Isar.

## Domain layer
This one is pretty simple as it should be. It consists of repository definition and implementation of business logic in the form of use cases. Also, here are the entities, the crucial data holders in the application.

## Presentation layer
For state management, Riverpod is used here. It does everything for the presentation logic and controls the screens and widgets as well as reacting to the user actions.

## TODO list:
- Localization
- Dart documentation for some interfaces
- Animations
- Show due date on todo card
- Cancel notification if task done or project deleted
- Android group notifications
- Firestore implementation (Mediator design pattern maybe)
- Authentication
