# You can utilize this npm package on iOS right now, and we're in the process of bringing it to Android.

You can utilize this npm package on iOS right now, and we're in the process of bringing it to Android.
The react-native-bg-location package is a versatile and easy-to-use library for handling background location tracking in React Native applications. It provides a seamless way to access the device's location in the background, making it suitable for various use cases, including tracking user movements, geofencing.

## Table of Contents

1. [Installation](#installation)
2. [Required permission](#permissions)
3. [Video demo](#videodemo)
4. [Usage API](#api)
    - [1. setDesiredDistance(distance: number)](#1-setDesiredDistance)
    - [2. startLocation()](#2-startLocation)
    - [3. stopLocation()](#3-stopLocation)
    - [4. LocationEvent.addListener(eventType: string, callback: (data: any) => void)](#4-LocationEvent.addListener)
    - [5. LocationEvent.removeAllListeners(eventType: string)](#5-LocationEvent.removeAllListeners)
6. [License](#license)
   

## 1. Installation for ios 

```sh
npm install react-native-bg-location

```bash

cd ios && pod install

```

## 2. Required permission

Open your App in **XCode** and select the root of your project.  Select **Capabilities** tab.  Enable **Background Modes** and enable the following modes:

- [x] Location updates
- [x] Background fetch

<img width="1219" alt="Screenshot 2023-10-09 at 10 32 14 PM" src="https://github.com/gulsher7/react-native-bg-location/assets/56266123/4c98333f-6992-466d-bab2-c66116d49822">

### Configure Usage Strings in `Info.plist`

Edit **`Info.plist`**.  Add the following items (Set **Value** as desired):

| Key | Type | Value |
|-----|-------|-------------|
| *Privacy - Location Always and When in Use Usage Description* | `String` | *CHANGEME: Location required in background* |
| *Privacy - Location When in Use Usage Description* | `String` | *CHANGEME: Location required when app is in use* |
| *Privacy - Motion Usage Description* | `String` | *CHANGEME: Motion permission helps detect when device in in-motion* |


## 3. Demo video 

https://github.com/gulsher7/react-native-bg-location/assets/56266123/1ddc7db2-d07c-49d2-8bb4-b07d1b669847

## 4. Usage Api 

Import the necessary functions and components from the library:

```jsx
import { LocationEvent, setDesiredDistance, startLocation, stopLocation } from 'react-native-bg-location';
```

### setDesiredDistance

Set the desired distance for location updates. It takes a numeric parameter distance (in meters) and returns a Promise.

Example: 
```jsx
setDesiredDistance(50).then((res) => {
  console.log(res);
}).catch((error) => {
  console.log("Error code:", error);
});
```

### startLocation

Call startLocation function to start location tracking.

Example: 
```jsx
startLocation()
```

### stopLocation

Call stopLocation function to stop tracking.

Example: 
```jsx
stopLocation()
```

### LocationEvent.addListener(eventType: string, callback: (data: any) => void)

```jsx

Add a listener for a specific get lat lng. The callback function will be called whenever the location changed.

Example: 
```jsx
LocationEvent.addListener("LAT_LNG", (latlng) => {
  console.log("Location data:", latlng);
});
```

### remove listner

remove listner to stop getting the lat lng.

Example: 
```jsx
LocationEvent.removeAllListeners("LAT_LNG");
```


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
