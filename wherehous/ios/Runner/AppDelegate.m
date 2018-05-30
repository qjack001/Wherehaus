#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
//#import Firebase; // Have not tested on iOS

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  //[FIRApp configure]; // Have not tested on iOS
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
