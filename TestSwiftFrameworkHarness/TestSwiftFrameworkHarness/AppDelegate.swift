//
//  AppDelegate.swift
//  TestSwiftFrameworkHarness
//

import UIKit

// This import statement is expected to compile
import TestSwiftFramework

// This import statement compiles, but internals of the module are hidden
import TestObjCModule

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		// This line of code is expected to compile
		TestSwiftObject().printMessage()
		
		// This line of code is also expected to compile
		TestSwiftObject().printPrivateMessage()
		
		// This line of code DOES NOT compile
		//TestObjCClass().printTestMessage()
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}

