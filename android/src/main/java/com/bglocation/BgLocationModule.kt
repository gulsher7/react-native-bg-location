package com.bglocation

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import android.os.Bundle

import android.location.Location



class BgLocationModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

    private var desiredDistance: Float = 10.0f // Change this to your desired distance in meters
    private var totalDistance: Float = 0.0f
    private var lastLocation: Location? = null

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  fun multiply(a: Double, b: Double, promise: Promise) {
    promise.resolve(a * b)
  }

 @ReactMethod
  fun startLocation() {
    println("Hello, startLocation!") 
    
  }

  @ReactMethod
  fun stopLocation() {
    println("Hello, stopLocation!") 
  }


    @ReactMethod
    fun setDesiredDistance(distance: Float, promise: Promise) {
        if (distance >= 0) {
            desiredDistance = distance
            promise.resolve("Successful distance set: $distance")
        } else {
            val errorCode = "INVALID_DISTANCE"
            val errorMessage = "The desired distance must be a valid non-negative number."
            promise.reject(errorCode, errorMessage)
        }
    }

  companion object {
    const val NAME = "BgLocation"
  }
}
