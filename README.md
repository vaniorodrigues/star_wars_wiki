# A Star Wars Fan Flutter App

## Features:
This app fetchs the list of movies and caracters from a public API https://swapi.dev/documentation. You can add all your favorite movies and caracters to your favorites list, which will be saved using the SQLite library.
The app also features a button that redirects you directly to the https://www.starwars.com/community website, without needing to leave the app. Powered by the flutter package [InAppWebView](https://pub.dev/packages/flutter_inappwebview).
It also alows you to create and customize your own avatar! Thanks to the flutter package [Fluttermoji](https://pub.dev/packages/fluttermoji).

## How to run on your android device from apk:
Get the apk file located at the [apk folder](./apk/app-release.apk), and upload to your android device.

## How to run on your android emulator from source code:
You first need to clone this repository:
```sh
git clone https://github.com/vaniorodrigues/star_wars_wiki.git
```
Then, change the directory to the root folder of the project:
```sh
cd star_wars_wiki
```
Run the following command to get dependencies of the project
```sh
flutter pub get
```
Run flutter and choose the device by running just:
```sh
flutter run
```