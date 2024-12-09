# sti_flutter_assignment1

Third assignment on my Dart/Flutter course at STI

# 1. Admin

## 1.1 Start

- Dependancies updated with `flutter pub get`.
- Make sure server is running with `dart run` in /dart_server root.
- This application I have started with `flutter run -d "macOS" ` in /parking_admin root.
  (It's been tested in Mac OS Desktop simulator).

## 1.2 Features

# 2. User app

## 2.1 Start

- Dependancies updated with `flutter pub get`.
- Make sure server is running with `dart run` in /dart_server root.
- This application I have started with `flutter run -d "IPhone 16"` in /parking_user root.
  (It's been tested in IPhone 16 simulator.)

## 2.2 Features

- Login (possibility to toggle visible or invisible password) and logout.
- Register new account / create new owner
- Change between dark and light mode
- See the logged in users vehicle (filtered away on client side)
- Add and remove vehicles

# 3. Limits

- There are no checks that username doesn't already exist when creating a new useraccount/owner.
- No validation on admin login. (You can write whatever you want)
- No tests
- Filters and calculations on client side
- Not the best responsive design

# 4. Some nice to haves

- Better styling and design
- More focus-handling on forms
- More validations and hints to user
- Better error feedback to user
