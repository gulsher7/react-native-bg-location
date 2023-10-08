package com.bglocation

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import com.facebook.react.modules.core.DeviceEventManagerModule
import com.facebook.react.uimanager.IllegalViewOperationException
import android.os.Bundle
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat

class BgLocationModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

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
  fun setDesiredDistance() {
    println("Hello, setDesiredDistance!") 

     sendEvent("LAT_LNG", Arguments.createArray().apply {
                        pushDouble(90.98787)
                        pushDouble(789.8787)
      })
  }

   private fun sendEvent(eventName: String, params: WritableArray) {
        try {
            reactApplicationContext
                .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter::class.java)
                .emit(eventName, params)
        } catch (e: IllegalViewOperationException) {
            e.printStackTrace()
        }
    }

  companion object {
    const val NAME = "BgLocation"
  }
}
