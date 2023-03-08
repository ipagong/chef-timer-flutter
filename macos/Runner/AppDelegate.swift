import Cocoa
import FlutterMacOS
import UserNotifications

@NSApplicationMain
class AppDelegate: FlutterAppDelegate, UNUserNotificationCenterDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
      if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
      }
      return true
  }
}
