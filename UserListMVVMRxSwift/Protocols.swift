//
//  Protocols.swift
//  UserListMVVMRxSwift
//
//  Created by Sergey on 13.08.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import Foundation
import RxSwift

protocol UserServiceProtocol {
    func fetchUsers() -> Observable<[User]>
}
