import UIKit
import Flutter
import MobileSync

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var flutterVC: FlutterViewController!
    
    override init() {
        super.init()
        MobileSyncSDKManager.initializeSDK()
        NSLog("chamou delegate")
        SFSDKLoginHostStorage.sharedInstance().add(SalesforceLoginHost(name: "test org", host: "https://brq73-dev-ed.develop.my.salesforce.com", deletable: false))
        AuthHelper.registerBlock(forCurrentUserChangeNotifications: {
            self.resetViewState {
                self.setupRootViewController()
            }
        })
    }
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      NSLog("chamou del")
      GeneratedPluginRegistrant.register(withRegistry: self)
      self.window = UIWindow(frame: UIScreen.main.bounds)
      self.initializeAppViewState()
      
      AuthHelper.loginIfRequired { [weak self] in
          MobileSyncSDKManager.shared.setupUserStoreFromDefaultConfig()
          MobileSyncSDKManager.shared.setupUserSyncsFromDefaultConfig()
          self?.setupRootViewController()
      }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    func initializeAppViewState() {
        if (!Thread.isMainThread) {
            DispatchQueue.main.async {
                self.initializeAppViewState()
            }
            return
        }
        
       self.window?.rootViewController = InitialViewController(nibName: nil, bundle: nil)
        self.window?.makeKeyAndVisible()
    }
    
    
    func setupRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        flutterVC = storyboard.instantiateInitialViewController() as? FlutterViewController
        self.window?.rootViewController = flutterVC
    }
    
    func resetViewState(_ postResetBlock: @escaping () -> ()) {
        if let rootViewController = self.window?.rootViewController {
            if let _ = rootViewController.presentedViewController {
                rootViewController.dismiss(animated: false, completion: postResetBlock)
                return
            }
        }
        postResetBlock()
    }
}
