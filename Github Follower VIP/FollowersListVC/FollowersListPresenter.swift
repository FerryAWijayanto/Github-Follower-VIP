//
//  FollowersListPresenter.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 12/10/21.
//

import UIKit

protocol FollowersListPresentationLogic {
    func presentFollower(follower: FollowersListModels.FollowerLists.Response.ResponseType)
}

final class FollowersListPresenter: FollowersListPresentationLogic {

  // MARK: - Public Properties

  weak var viewController: FollowersListDisplayLogic?

  // MARK: - Private Properties
  
  //

  // MARK: - Presentation Logic
    func presentFollower(follower: FollowersListModels.FollowerLists.Response.ResponseType) {
        switch follower {
        case .followers(followers: let followers):
            let cells = followers.map { cellFollowerViewModel(follower: $0) }
            let followerViewModel = FollowerViewModel(cells: cells)
            viewController?.displayFollower(data: FollowersListModels.FollowerLists.ViewModel.ViewModelData.displayFollower(followers: followerViewModel))
        case .errorMessage(error: let message):
            viewController?.displayFollower(data: FollowersListModels.FollowerLists.ViewModel.ViewModelData.displayError(message: message))
        }
    }
    
    private func cellFollowerViewModel(follower: Follower) -> FollowerViewModel.Cell {
        return FollowerViewModel.Cell(imageName: follower.avatarUrl)
    }
}
