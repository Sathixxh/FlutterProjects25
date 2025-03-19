package com.example.srp
import android.hardware.display.DisplayManager
import android.os.Build
import android.view.Display
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "screen_mirror"

    override fun configureFlutterEngine(flutterEngine: io.flutter.embedding.engine.FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "checkScreenMirror") {
                result.success(isScreenMirroring())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun isScreenMirroring(): Boolean {
        val displayManager = getSystemService(DISPLAY_SERVICE) as DisplayManager
        val displays = displayManager.displays

        for (display in displays) { 
            if (display.displayId != Display.DEFAULT_DISPLAY) {
                return true // External screen is connected
            }
        }
        return false
    }
}
