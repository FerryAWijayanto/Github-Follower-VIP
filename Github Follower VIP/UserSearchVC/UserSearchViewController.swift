//
//  UserSearchViewController.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 12/10/21.
//

import UIKit

protocol UserSearchDisplayLogic: AnyObject {
    func display(viewController: UserSearchModels.UserSearch.ViewModel.Present)
}

final class UserSearchViewController: UIViewController {

  // MARK: - UI Outlets
    @IBOutlet weak var searchTextField: UITextField!
    
  //
  
  // MARK: - Public Properties

  var interactor: UserSearchBusinessLogic?
  var router: (UserSearchRoutingLogic & UserSearchDataPassing)?

  // MARK: - Private Properties

  //
    
  private func setup() {
    let interactor = UserSearchInteractor()
    let presenter = UserSearchPresenter()
    let router = UserSearchRouter()

    interactor.presenter = presenter
    presenter.viewController = self
    router.viewController = self
    router.dataStore = interactor

    self.interactor = interactor
    self.router = router
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    configure()
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

  // MARK: - Public Methods
  
  //

  // MARK: - Requests
  
  //

  // MARK: - Private Methods

  private func configure() {

  }
  
  // MARK: - UI Actions
    @IBAction func searchTapped(_ sender: UIButton) {
        interactor?.search(username: UserSearchModels.UserSearch.Request.RequestType.username(username: searchTextField.text ?? ""))
    }
    
  //
}

// MARK: - Display Logic

extension UserSearchViewController: UserSearchDisplayLogic {
    func display(viewController: UserSearchModels.UserSearch.ViewModel.Present) {
        switch viewController {
        case .error(message: let message):
            let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            present(ac, animated: true)
        case .push(username: let username):
            let followerListVC: FollowersListViewController = FollowersListViewController.loadFromStoryboard()
            followerListVC.username = username
            navigationController?.pushViewController(followerListVC, animated: true)
        }
    }
}

