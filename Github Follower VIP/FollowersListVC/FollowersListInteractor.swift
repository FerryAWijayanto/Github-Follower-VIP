//
//  FollowersListInteractor.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 12/10/21.
//

import Foundation

protocol FollowersListBusinessLogic {
    func getFollowers(follower: FollowersListModels.FollowerLists.Request.RequestType)
}

protocol FollowersListDataStore {

}

final class FollowersListInteractor: FollowersListBusinessLogic, FollowersListDataStore {

  // MARK: - Public Properties

  var presenter: FollowersListPresentationLogic?
  lazy var worker: FollowersListWorkingLogic = FollowersListWorker()

  // MARK: - Private Properties
    private var fetcher: DataFetcher = NetworkDataFetcher(service: NetworkService())
  //

  // MARK: - Business Logic
    func getFollowers(follower: FollowersListModels.FollowerLists.Request.RequestType) {
        switch follower {
        case .getFollowers(username: let username, page: let page):
            fetcher.getFollower(from: username, page: page) { [weak self] results in
                guard let self = self else { return }
                switch results {
                case .success(let followers):
                    self.presenter?.presentFollower(follower: FollowersListModels.FollowerLists.Response.ResponseType.followers(followers: followers))
                case .failure(let error):
                    self.presenter?.presentFollower(follower: FollowersListModels.FollowerLists.Response.ResponseType.errorMessage(error: error.rawValue))
                }
            }
        }
    }
}
