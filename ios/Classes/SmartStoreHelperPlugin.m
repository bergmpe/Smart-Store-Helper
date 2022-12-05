#import "SmartStoreHelperPlugin.h"
#if __has_include(<smart_store_helper/smart_store_helper-Swift.h>)
#import <smart_store_helper/smart_store_helper-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "smart_store_helper-Swift.h"
#endif

@implementation SmartStoreHelperPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSmartStoreHelperPlugin registerWithRegistrar:registrar];
}
@end
