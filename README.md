# Rick and Morty App

App that lists all Characters [The Rick and Morty API](https://rickandmortyapi.com/ "The Rick and Morty API"). This app is built with Flutter, focused on Android design.

For this poject Clean Architecture was choosen.  Beacause keep the code clean and tested are the two most important development practices. Even state management patterns like BLoC are not sufficient in themselves to allow for easily extendable codebase. If you want to learn more about this, you can read my article [here](https://medium.com/@alvaro.armijoss/improve-your-flutter-development-with-clean-architecture-and-tdd-4c13e6af4f18 "here").

For this we should all strive to separate code into independent layers and depend on abstractions instead of concrete implementations.

Every "feature" of the app, like home, is divided into 3 layers - presentation, domain and data. This app  have only one feature.

The presentation layer contain Pages, Widgets and Bloc. The presentation layer contain Entities, Repositories and Usecases. It should be totally independent of every other layer. The data layer consists of a Repository implementation and data sources - this is usually for getting remote (API) data.

<p>
    <img src="https://res.cloudinary.com/dzgd10ssq/image/upload/v1661148358/nfyprbhop0zmsofls90n.png" width="200"/ hspace="5"> 
</p>

# Starting 🚀

These instructions will allow you to obtain a copy of the application for testing.

## Getting Started
To build and run this project:

1. Get Flutter [here](https://flutter.dev) if you don't already have it
2. Clone this repository `git clone https://github.com/alvaroarmijos/rick_and_morty_app.git`
3. `cd` into the repo folder `cd rick_and_morty_app`
4. `flutter pub get`
5. run `flutter run -android` to run the app.

Just to ensure that the app works perfectly, add the following permission in ```AndroidManifest.xml``` file:

```
<uses-permission android:name="android.permission.INTERNET" />
```

You also need **compile for Android** for proper operation.

## Running the example code

This sample requires Flutter 3.0.1.

## Requirements 📋
You need these packages for the application to work
- [get_it](https://pub.dev/packages/get_it "get_it")
- [flutter_bloc ](https://pub.dev/packages/flutter_bloc "flutter_bloc ")
- [equatable](https://pub.dev/packages/equatable "equatable")
- [dartz](https://pub.dev/packages/dartz "dartz")
- [connectivity](https://pub.dev/packages/connectivity "connectivity")
- [http](https://pub.dev/packages/http#-installing-tab- "http")
- [data_connection_checker_tv](https://pub.dev/packages/data_connection_checker_tv "data_connection_checker_tv")
- [mocktail ](https://pub.dev/packages/mocktail "mocktail ")


# Built with 🛠️
  - [Flutter](https://flutter.dev/ "flutter")
  - [The Rick and Morty API](https://rickandmortyapi.com/ "The Rick and Morty API")
