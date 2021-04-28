import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let firstVC = MainViewController()
        let navigationVC = UINavigationController(rootViewController: firstVC)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

