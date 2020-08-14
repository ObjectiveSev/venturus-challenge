//
//  AppCoordinator.swift
//  Venturus Challenge
//
//  Created by Thiago Augusto on 23/07/20.
//  Copyright © 2020 objectivesev. All rights reserved.
//

import UIKit

/// The AppCoordinator is our first coordinator
/// In this example the AppCoordinator as a rootViewController
public class AppCoordinator: RootViewCoordinator {
    
    // MARK: - Properties
    public var childCoordinators: [Coordinator] = []
    
    /// Remember to change the UIViewController instance to your Splash Screen
    public var rootViewController: UIViewController {
        get { return navigationController }
    }
    
    private lazy var navigationController: UINavigationController = {
        let navigation = UINavigationController(navigationBarClass: VCNavBar.self, toolbarClass: nil)
        navigation.view.backgroundColor = .white
        return navigation
    }()
    
    /// Window to manage
    let window: UIWindow
    
    // MARK: - Init
    public init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
        
    /// Starts the coordinator
    public func start() {
        let service = SearchService()
        let viewModel = HomeViewModel(searchService: service)
        let home = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(home, animated: false)
    }
    
}
