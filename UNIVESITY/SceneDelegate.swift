//
//  SceneDelegate.swift
//  UNIVESITY
//
//  Created by Andrei Apekunou on 4/12/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//
import Foundation
import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
       // guard let _ = (scene as? UIWindowScene) else { return }
       // LoginManager.shared.makeLogoff()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        if let style = UserDefaults.standard.value(forKey: "style") as? Int {
          switch style {
            case 0:
              window?.overrideUserInterfaceStyle = .unspecified
            case 1:
              window?.overrideUserInterfaceStyle = .light
            case 2:
              window?.overrideUserInterfaceStyle = .dark
            default:
               break
          }
        }
        let rootNavigationController = UINavigationController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var initialVC = UIViewController()
        if LoginManager.shared.isLogined(){
                  initialVC = storyboard.instantiateViewController(withIdentifier: "PersonsCollectionViewController") as! PersonsCollectionViewController
        }
        else{
        initialVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        }
        
        self.window?.rootViewController = rootNavigationController
        rootNavigationController.pushViewController(initialVC, animated: false)
        window?.makeKeyAndVisible()
    }
    func barItemFunc(){
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

