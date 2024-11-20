# Assignment by Vimal Rai

Develop a login screen in a Flutter application. The login screen should authenticate users by 
making a POST request to the Keycloak endpoint provided.

AND

Develop a feature in a Flutter application to display a list of products using a GraphQL API. The 
app should use the token received in the previous step for authentication.

## About App

I have developed an application for state management using BLoC (Business Logic Component). This combination ensures a scalable, reactive, and efficient app architecture.




<table>
  <tr>
   <td><strong>S No.</strong>
   </td>
   <td><strong>Screen Name</strong>
   </td>
   <td><strong>Light Theme</strong>
   </td>
    <td><strong>Dark Theme</strong>
   </td>
  </tr>

 <tr>
   <td>1.
   </td>
   <td>Login Screen
   </td>
   <td>
     <img src="https://github.com/ramkishoreprajapat/assignment_vimal/blob/main/output/login_light.png" width="150"/>
   </td>
   <td>
<img src="https://github.com/ramkishoreprajapat/assignment_vimal/blob/main/output/login_dark.png" width="150"/>
   </td>
  </tr>

   <tr>
   <td>2.
   </td>
   <td>Product List
   </td>
   <td>
     <img src="https://github.com/ramkishoreprajapat/assignment_vimal/blob/main/output/product_list_light.png" width="150"/>
   </td>
   <td>
<img src="https://github.com/ramkishoreprajapat/assignment_vimal/blob/main/output/product_list_dark.png" width="150"/>
   </td>
  </tr>
  
</table>

# Getting Start
## 1. Install Flutter SDK
Ensure you have Flutter installed on your system. If not, follow these steps:

Download the Flutter SDK:

Visit Flutter SDK Installation Guide.
Add Flutter to PATH:

Add the flutter/bin directory to your system PATH.
Run flutter doctor:

Open a terminal and run:

<code>flutter doctor</code>

Resolve any issues displayed in the output (e.g., missing Android SDK, Xcode, or IDE extensions).

## 2. Set Up IDE
Use one of these IDEs:

Visual Studio Code: Install Flutter and Dart extensions.
Android Studio: Install the Flutter and Dart plugins.

## 3. Clone or Copy the App Code
Clone the repository or copy the app’s source code into a local directory.

For GitHub:

<code>git clone <repository_url>
cd <project_directory></code>

Replace <repository_url> with the app's repository URL and <project_directory> with the project folder name.

If the project is a zipped file, extract it and navigate to the project folder.

## 4. Check Flutter Dependencies
Open a terminal in the project directory.
Run:

<code>flutter pub get</code>

This command installs all dependencies listed in the pubspec.yaml file.

## 5. Set Up a Target Device
Flutter apps can run on emulators, simulators, or physical devices.

For Android:
Install and configure the Android SDK via Android Studio.
Create and launch an emulator using AVD Manager.
For iOS (macOS only):
Install Xcode and launch an iOS Simulator:
Open Xcode > Open Developer Tool > Simulator.
For Physical Devices:
Connect an Android or iOS device via USB.
Enable developer mode on the device.
Run:

<code>flutter devices</code>

This lists all available devices.

## 6. Run the App
Run the app in one of the following ways:

Using Terminal:
Navigate to the project directory.
Run:

<code>flutter run</code>

This compiles and launches the app on the connected device or emulator.
Using Visual Studio Code:
Open the project folder in VS Code.
Click Run > Start Debugging or press F5.
Select the desired device from the status bar.
Using Android Studio:
Open the project in Android Studio.
Select a connected device/emulator.
Click the Run/Play button.
