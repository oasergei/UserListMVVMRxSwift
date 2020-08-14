//
//  UserViewModel.swift
//  UserListMVVMRxSwift
//
//  Created by Sergey on 13.08.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import Foundation

struct UserViewModel {
    private let user: User
    var displayName: String {
        return user.name
    }
    var displayUser: String {
        return user.phone
    }
    
    init(user: User) {
        self.user = user
    }
}
