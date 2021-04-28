import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
<<<<<<< HEAD
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let firstVC = MainViewController()
        let navigationVC = UINavigationController(rootViewController: firstVC)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
=======
        guard let _ = (scene as? UIWindowScene) else { return }
>>>>>>> 77b41760a9fb566dc0fe901fc33fc6c8b9b4c74c
    }
}

