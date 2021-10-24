//
//  FollowersListModels.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 12/10/21.
//

import UIKit

enum FollowersListModels {
  
  // MARK: - Something
  
  enum FollowerLists {
    struct Request {
        enum RequestType {
            case getFollowers(username: String, page: Int)
        }
    }
    
    struct Response {
        enum ResponseType {
            case followers(followers: [Follower])
            case errorMessage(error: String)
        }
    }
    
    struct ViewModel {
        enum ViewModelData {
            case displayFollower(followers: FollowerViewModel)
            case displayError(message: String)
        }
    }
  }
}

struct FollowerViewModel {
    struct Cell: FollowerCellViewModel, Hashable {
        var imageName: String
    }
    
    let cells: [Cell]
}

extension FollowerViewModel: Hashable {
    static func == (lhs: FollowerViewModel, rhs: FollowerViewModel) -> Bool {
        return lhs.cells == rhs.cells
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(cells)
    }
}
