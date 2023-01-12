## sam_utils

A Flutter library for commonly used utility functions.

## Supported platforms

- Android
- iOS 
- Web 
- macOS 
- linux 
- windows

## Getting Started

To use this package, add sam_utils as a dependency in your pubspec.yaml file.

## Usage

Import the library using:

```dart
import 'package:sam_utils/sam_utils.dart';
```

## Documentation

Prints log messages to the console with an optional tag.

```dart
printLog(String strLogMessage, [String? strTag]);
```

Returns true if the app is running on a web platform, false otherwise.

```dart
bool isAppRunningOnWeb = isAppRunningOnWeb();
```

Returns true if the provided email is in a valid format, false otherwise.

```dart

bool isEmailValid = isEmailValid(String ? email);
```

Returns the trimmed text of the provided TextEditingController as a String.

```dart

String text = getTextEditingString(TextEditingController ? controller);
```

Returns true if the TextEditingController is null or its text is empty, false otherwise.

```dart

bool isTextEditingEmpty = isTextEditingEmpty(TextEditingController ? controller);
```

Returns the width of the screen in pixels.

```dart

double screenWidth = getScreenWidth(BuildContext ? buildContext);
```

Converts the provided dynamic value to double.

```dart

double val = parseDynamicToDouble(dynamic value);
```

Returns the name of the platform the app is running on.

```dart

String platformName = getPlatformName();
```

Returns the current date and time in the format 'dd-MM-yyyy HH:mm:ss'

```dart

String currentDateTime = SamUtils().getCurrentDateTime();
```

Returns the current date in the format 'dd-MM-yyyy'

```dart

String currentDate = SamUtils().getCurrentDate();
```

Returns the current time in the format 'HH:mm:ss'

```dart

String currentTime = SamUtils().getCurrentTime();
```

Returns the current timestamp in milliseconds

```dart

String currentTimeStamp = SamUtils().getCurrentTimeStamp();
```

Returns the number of hours in the provided number of milliseconds.

```dart

int hours = SamUtils().millisecondToHours(int milliseconds);
```

## Contributions

Feel free to contribute by creating pull requests.