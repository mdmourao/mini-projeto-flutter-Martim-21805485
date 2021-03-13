//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<hardware_buttons/HardwareButtonsPlugin.h>)
#import <hardware_buttons/HardwareButtonsPlugin.h>
#else
@import hardware_buttons;
#endif

#if __has_include(<sensors/FLTSensorsPlugin.h>)
#import <sensors/FLTSensorsPlugin.h>
#else
@import sensors;
#endif

#if __has_include(<volume_watcher/VolumeWatcherPlugin.h>)
#import <volume_watcher/VolumeWatcherPlugin.h>
#else
@import volume_watcher;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [HardwareButtonsPlugin registerWithRegistrar:[registry registrarForPlugin:@"HardwareButtonsPlugin"]];
  [FLTSensorsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSensorsPlugin"]];
  [VolumeWatcherPlugin registerWithRegistrar:[registry registrarForPlugin:@"VolumeWatcherPlugin"]];
}

@end
