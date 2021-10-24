//
//  FollowersListViewController.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 12/10/21.
//

import UIKit

protocol FollowersListDisplayLogic: AnyObject {
    func displayFollower(data: FollowersListModels.FollowerLists.ViewModel.ViewModelData)
}

final class FollowersListViewController: UIViewController {

  // MARK: - UI Outlets
  
    @IBOutlet weak var collectionView: UICollectionView!
    //
  
  // MARK: - Public Properties

    var interactor: FollowersListBusinessLogic?
    var router: (FollowersListRoutingLogic & FollowersListDataPassing)?
    var username: String!
    var followers = FollowerViewModel(cells: [])

  // MARK: - Private Properties

  //

  private func setup() {
    let interactor = FollowersListInteractor()
    let presenter = FollowersListPresenter()
    let router = FollowersListRouter()

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
    title = username
    setup()
    configure()
    setupCollectionView()
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

  // MARK: - Public Methods
    func setupCollectionView() {
        collectionView.register(UINib(nibName: "FollowerCell", bundle: nil), forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
  //

  // MARK: - Requests
  
  //

  // MARK: - Private Methods

  private func configure() {
    interactor?.getFollowers(follower: FollowersListModels.FollowerLists.Request.RequestType.getFollowers(username: username, page: 1))
  }
  
  // MARK: - UI Actions
  
  //
}

// MARK: - Display Logic

extension FollowersListViewController: FollowersListDisplayLogic {
    func displayFollower(data: FollowersListModels.FollowerLists.ViewModel.ViewModelData) {
        switch data {
        case .displayFollower(followers: let followers):
            self.followers = followers
            collectionView.reloadData()
        case .displayError(message: let message):
            let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            present(ac, animated: true)
        }
    }
}

extension FollowersListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followers.cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
        let followerViewModel = followers.cells[indexPath.row]
        cell.set(follower: followerViewModel)
        return cell
    }
    
}

extension FollowersListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width                           = view.bounds.width
        let padding: CGFloat                = 12
        let minimumInterimSpacing: CGFloat  = 10
        let availableWidth                  = width - (padding * 2) - (minimumInterimSpacing * 2)
        let itemWidth                       = availableWidth / 3
        
        return CGSize(width: itemWidth, height: itemWidth + 40)
    }
}
