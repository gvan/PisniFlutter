# Pisni

Application is written with the Flutter framework.

State management and dependency injection are done using the Provider package. Data is stored in a database. The drift package provides access to the database. Data layer consists of data sources and repositories. Data sources provide CRUD access to assets, shared preferences and databases. Repositories merge data from different data sources together.

There are no use cases because of straightforward business logic.

Presentation layer consists of ViewModels and Widgets. ViewModels contain business logic, update states and notify Widgets about state changes using ChangeNotifier technique.

