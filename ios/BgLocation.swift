//
//  HelloWorld.swift
//  learn_bridge
//
//  Created by Gulsher Khan on 12/09/23.
//

import Foundation
import UIKit
import CoreLocation

@available(iOS 13.0, *)
@objc(BgLocation)

class BgLocation: RCTEventEmitter, ObservableObject, CLLocationManagerDelegate {
  
  private var locationManager = CLLocationManager()
     
   // Add properties to track distance
       private var lastLocation: CLLocation?
       private var totalDistance: CLLocationDistance = 0.0
       private var desiredDistance: CLLocationDistance = 10 // Change this to your desired distance in meters
       


  @objc(setDesiredDistance:withResolver:withRejecter:)
  func setDesiredDistance(distance: Any, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    if let doubleValue = distance as? Double, doubleValue >= 0 {
      desiredDistance = distance as! CLLocationDistance
        resolve("Successful distance set: \(distance)")
    } else {
      let errorCode = "INVALID_DISTANCE"
         let errorMessage = "The desired distance must be a valid non-negative number."
         reject(errorCode, errorMessage, nil)
    }
  }

  
  @objc
  func startLocation() {
       locationManager.delegate = self
       locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
       locationManager.requestWhenInUseAuthorization()
       locationManager.allowsBackgroundLocationUpdates = true
       locationManager.showsBackgroundLocationIndicator = true
       locationManager.startUpdatingLocation()
   }
  
  @objc
   func stopLocation(){
       locationManager.allowsBackgroundLocationUpdates = false
       locationManager.showsBackgroundLocationIndicator = false
       locationManager.stopUpdatingLocation()
   }


  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         if let location = locations.last {
       
             // Calculate distance
                        if let last = lastLocation {
                            let distance = location.distance(from: last)
                            totalDistance += distance
                            
                            // Check if the desired distance is reached
                            if totalDistance >= desiredDistance {
                                // Perform an action here, for example, print a message
                              let latitude = location.coordinate.latitude
                              let longitude = location.coordinate.longitude
           
                                print("You have walked \(desiredDistance) meters!")
                                sendEvent(withName: "LAT_LNG", body: [latitude, longitude])
                                // Reset the total distance and last location
                                totalDistance = 0.0
                                lastLocation = nil
                            }
                        }
                        // Update the last location
                        lastLocation = location
         }
     }

  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }
  
  @objc
  open override func supportedEvents() -> [String] {
       ["LAT_LNG", "onFailure"]
     }
     
  
  @objc
  override static func requiresMainQueueSetup() -> Bool {return true}
  
}
