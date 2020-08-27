package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.github.contactlutforrahman.flutter_qr_scanner.FlutterQrScannerPlugin;
import com.github.rmtmckenzie.nativedeviceorientation.NativeDeviceOrientationPlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    FlutterQrScannerPlugin.registerWith(registry.registrarFor("com.github.contactlutforrahman.flutter_qr_scanner.FlutterQrScannerPlugin"));
    NativeDeviceOrientationPlugin.registerWith(registry.registrarFor("com.github.rmtmckenzie.nativedeviceorientation.NativeDeviceOrientationPlugin"));
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
