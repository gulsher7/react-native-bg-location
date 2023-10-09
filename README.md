# You can utilize this npm package on iOS right now, and we're in the process of bringing it to Android.

# react-native-bg-location

You can utilize this npm package on iOS right now, and we're in the process of bringing it to Android.

The react-native-bg-location package is a versatile and easy-to-use library for handling background location tracking in React Native applications. It provides a seamless way to access the device's location in the background, making it suitable for various use cases, including tracking user movements, geofencing.


## Installation for ios 

```sh
npm install react-native-bg-location

```bash

cd ios && pod install

```

## Configure Background Capabilities

Open your App in **XCode** and select the root of your project.  Select **Capabilities** tab.  Enable **Background Modes** and enable the following modes:

- [x] Location updates
- [x] Background fetch

<img width="1219" alt="Screenshot 2023-10-09 at 10 32 14 PM" src="https://github.com/gulsher7/react-native-bg-location/assets/56266123/4c98333f-6992-466d-bab2-c66116d49822">

## Configure Usage Strings in `Info.plist`

Edit **`Info.plist`**.  Add the following items (Set **Value** as desired):

| Key | Type | Value |
|-----|-------|-------------|
| *Privacy - Location Always and When in Use Usage Description* | `String` | *CHANGEME: Location required in background* |
| *Privacy - Location When in Use Usage Description* | `String` | *CHANGEME: Location required when app is in use* |
| *Privacy - Motion Usage Description* | `String` | *CHANGEME: Motion permission helps detect when device in in-motion* |

```

## Demo Video

https://github.com/gulsher7/react-native-bg-location/assets/56266123/8569dea4-5a1b-4580-bfc4-62fafb89f72d



## Usage

```js
import { LocationEvent, setDesiredDistance, startLocation, stopLocation } from 'react-native-bg-location';

// ...
    
 1. setDesiredDistance(distance: number)

This function sets the desired distance for location updates. 
It takes a numeric parameter distance (in meters) and returns a Promise. 
It fetches the location after the device moves the specified distance.

   
setDesiredDistance(50).then((res) => {  //example send value in meters
    console.log(res)
  }).catch((error) => {
    console.log("Error code:", error);
  })

2. startLocation()
   use this function to start location tracking. It continuously updates the device's location.
  

3. stopLocation()
   To stop location tracking, call this function.

4. LocationEvent.addListener(eventType: string, callback: (data: any) => void)

    LocationEvent.addListener("LAT_LNG", (latlng) => { //example
    console.log("data", latlng);
    });

5. LocationEvent.removeAllListeners(eventType: string)
   To remove all listeners for a specific event type, you can use this function. 
   
   LocationEvent.removeAllListeners("LAT_LNG"); //example

```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
