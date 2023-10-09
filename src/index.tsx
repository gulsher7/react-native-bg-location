import { NativeModules, Platform,NativeEventEmitter } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-bg-location' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const BgLocation = NativeModules.BgLocation
  ? NativeModules.BgLocation
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

    export const  LocationEvent = new NativeEventEmitter(BgLocation)

    export function startLocation() {
      return BgLocation.startLocation();
    }
    
    export function stopLocation() {
      return BgLocation.stopLocation();
    }
    
    export function setDesiredDistance(distance: number): Promise<any> {
      return BgLocation.setDesiredDistance(distance);
    }