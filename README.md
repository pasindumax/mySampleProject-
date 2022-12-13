## TAXI APP

# Flutter Flavoration
https://www.youtube.com/watch?v=4Y7WaeU3P60


# Routes Auto Generate
flutter packages pub run build_runner watch
flutter packages pub run build_runner build
flutter packages pub run build_runner build --delete-conflicting-outputs

# Generate app icons
https://pub.dev/packages/flutter_launcher_icons
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*

# Generate or Regenerate firebase options
flutterfire configure -a com.finap.taxidriver.dev -i com.finap.taxidriver.dev -o lib/config/firebase_options/firebase_options_dev.dart