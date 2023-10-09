# You can utilize this npm package on iOS right now, and we're in the process of bringing it to Android.

# react-native-bg-location


The react-native-bg-location package is a versatile and easy-to-use library for handling background location tracking in React Native applications. It provides a seamless way to access the device's location in the background, making it suitable for various use cases, including tracking user movements, geofencing.

## Installation

```sh
npm install react-native-bg-location
```

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
