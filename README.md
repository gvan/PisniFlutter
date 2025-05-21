# Pisni

Application is written with Flutter framework. 

State management and dependency injection are done using Provider package. Data are stored in database and drift package provides access to the data. Data layer consists of data sources and repositories. Data sources provide CRUD access to assets, shared preferences and database. Repositories merge data from different data sources together. 

There are no use cases because of straighforward business logic. 

Presentation layer consists of ViewModels and Widgets. ViewModels contain business logic, update states and notify Widgets about state changes using ChangeNotifier technic.
