//
//  MainViewController.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import UIKit

final class MainViewController: BaseViewController<MainView> {
  // MARK: Properties
  weak var viewModel: MainViewModelDelegate?

  // MARK: Life Cicle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureBinds()

    customView?.delegate = self

    viewModel?.getWeatherForecast()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
}

// MARK: Conforms to View Delegate
extension MainViewController: MainViewDelegate {}

// MARK: Initialize
extension MainViewController {
  static func initialize(viewModel: MainViewModelDelegate?) -> MainViewController {
    let viewController = MainViewController()
    viewController.viewModel = viewModel

    return viewController
  }
}
