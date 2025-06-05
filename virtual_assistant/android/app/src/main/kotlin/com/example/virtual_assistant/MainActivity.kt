package com.example.virtual_assistant

import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "overlay_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "showBubble" -> {
                    // Logika untuk menampilkan overlay (misalnya start service)
                    Toast.makeText(this, "Showing bubble...", Toast.LENGTH_SHORT).show()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }
}
