//
//  UserSearchPresenter.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 12/10/21.
//

import UIKit

protocol UserSearchPresentationLogic {
    func present(_ vc: UserSearchModels.UserSearch.Response.ResponseType)
}

final class UserSearchPresenter: UserSearchPresentationLogic {

  // MARK: - Public Properties

  weak var viewController: UserSearchDisplayLogic?

  // MARK: - Private Properties
  
  //

  // MARK: - Presentation Logic
    func present(_ vc: UserSearchModels.UserSearch.Response.ResponseType) {
        switch vc {
        case .error(message: let message):
            viewController?.display(viewController: UserSearchModels.UserSearch.ViewModel.Present.error(message: message))
        case .followerListVC(username: let username):
            viewController?.display(viewController: UserSearchModels.UserSearch.ViewModel.Present.push(username: username))
        }
    }
  //
}
