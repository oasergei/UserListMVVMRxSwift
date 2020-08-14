//
//  UsersListViewModel.swift
//  UserListMVVMRxSwift
//
//  Created by Sergey on 13.08.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import Foundation
import RxSwift

struct UsersListViewModel {
    let title = "Users"
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    func fetchUserViewModels() -> Observable<[UserViewModel]> {
        userService.fetchUsers().map { $0.map { UserViewModel(user: $0) } }
    }
}
