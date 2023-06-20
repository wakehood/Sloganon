//
//  AppDelegate.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 9/16/22.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL ?? "")
        do {
            let realm = try Realm()
            
            //Only add default slogans if realm is empty
            if realm.objects(SloganSayingOrAcronym.self).isEmpty
            {
                SloganSayingOrAcronym.initalizeSlogans()
                
            }

            //only add default acronyms if realm is empty
            if realm.objects(WebPage.self).isEmpty
            {
                WebPage.initializeWebPages()

            }
        } catch {
            assertionFailure("Error initialising new realm, \(error)")
        }
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
}

