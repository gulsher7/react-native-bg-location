//import liraries
import React, { useEffect, useState } from 'react';
import { Button, StyleSheet, Text, View } from 'react-native';
import { LocationEvent, setDesiredDistance, startLocation, stopLocation } from 'react-native-bg-location';

interface LATLNG {
  latitude: number,
  longitude: number
}

const App = () => {

  const [latLng, setLatLng] = useState<LATLNG>({ latitude: 19.435478, longitude: -122.07346522 }) //default lat/lng

useEffect(()=>{
  setDesiredDistance(50).then((res) => {
    console.log(res)
  }).catch((error) => {
    console.log("Error code:", error);
  })
},[])

  const onStart = () => {
    startLocation()
    LocationEvent.addListener("LAT_LNG", (data: any) => {
      console.log("data", data)
      setLatLng({
        latitude: data[0],
        longitude: data[1]
      })
    })
  }

  const onStop = () => {
    stopLocation()
    LocationEvent.removeAllListeners('LAT_LNG')

  }

  return (
    <View style={styles.container}>

        <Text>Latitude: ${latLng.latitude}</Text>

        <Text>Latitude: ${latLng.longitude}</Text>

        <Button title='On Start' onPress={onStart} />
        <Button title='On Stop' onPress={onStop} />

    </View>
  );
};


const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent:'center',
    alignItems:'center'
  },
});

export default App;
