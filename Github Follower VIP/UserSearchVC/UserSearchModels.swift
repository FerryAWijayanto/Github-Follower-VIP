//
//  UserSearchModels.swift
//  Github Follower VIP
//
//  Created by Ferry Adi Wijayanto on 12/10/21.
//

import UIKit

enum UserSearchModels {
  
  // MARK: - Something
  
  enum UserSearch {
    struct Request {
        enum RequestType {
            case username(username: String)
        }
    }
    
    struct Response {
        enum ResponseType {
            case error(message: String)
            case followerListVC(username: String)
        }
    }
    
    struct ViewModel {
        enum Present {
            case error(message: String)
            case push(username: String)
        }
    }
  }
}
