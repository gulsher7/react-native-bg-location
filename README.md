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
    
  setDesiredDistance(50).then((res) => {
    console.log(res)
  }).catch((error) => {
    console.log("Error code:", error);
  })

 startLocation() //start location

 stopLocation() //stop location

  LocationEvent.addListener("LAT_LNG", (latlng) => { //register listners
      console.log("data", latlng)
  })

  LocationEvent.removeAllListeners('LAT_LNG') //remove listeners 
  

```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
