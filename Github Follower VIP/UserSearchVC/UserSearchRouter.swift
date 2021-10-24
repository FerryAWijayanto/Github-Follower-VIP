//
//  UserSearchRouter.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 12/10/21.
//

import UIKit

protocol UserSearchRoutingLogic {

}

protocol UserSearchDataPassing {
  var dataStore: UserSearchDataStore? { get }
}

final class UserSearchRouter: UserSearchRoutingLogic, UserSearchDataPassing {

  // MARK: - Public Properties

  weak var viewController: UserSearchViewController?
  var dataStore: UserSearchDataStore?
  
  // MARK: - Private Properties
  
  //

  // MARK: - Routing Logic
  
  //

  // MARK: - Navigation
  
  //

  // MARK: - Passing data
  
  //
}
