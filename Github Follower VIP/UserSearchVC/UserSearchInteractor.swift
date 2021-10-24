//
//  UserSearchInteractor.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 12/10/21.
//

import Foundation

protocol UserSearchBusinessLogic {
    func search(username: UserSearchModels.UserSearch.Request.RequestType)
}

protocol UserSearchDataStore {

}

final class UserSearchInteractor: UserSearchBusinessLogic, UserSearchDataStore {

  // MARK: - Public Properties

  var presenter: UserSearchPresentationLogic?
  lazy var worker: UserSearchWorkingLogic = UserSearchWorker()

  // MARK: - Private Properties
    
  //

  // MARK: - Business Logic
    func search(username: UserSearchModels.UserSearch.Request.RequestType) {
        switch username {
        case .username(username: let username):
            if username.isEmpty {
                presenter?.present(UserSearchModels.UserSearch.Response.ResponseType.error(message: "Please enter a username. We need to know who to look for"))
            } else {
                presenter?.present(UserSearchModels.UserSearch.Response.ResponseType.followerListVC(username: username))
            }
        }
    }
    
}
