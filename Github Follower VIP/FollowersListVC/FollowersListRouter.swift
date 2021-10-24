//
//  FollowersListRouter.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 12/10/21.
//

import UIKit

protocol FollowersListRoutingLogic {

}

protocol FollowersListDataPassing {
  var dataStore: FollowersListDataStore? { get }
}

final class FollowersListRouter: FollowersListRoutingLogic, FollowersListDataPassing {

  // MARK: - Public Properties

  weak var viewController: FollowersListViewController?
  var dataStore: FollowersListDataStore?
  
  // MARK: - Private Properties
  
  //

  // MARK: - Routing Logic
  
  //

  // MARK: - Navigation
  
  //

  // MARK: - Passing data
  
  //
}
