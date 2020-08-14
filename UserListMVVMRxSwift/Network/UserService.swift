//
//  UserService.swift
//  UserListMVVMRxSwift
//
//  Created by Sergey on 13.08.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import Foundation
import RxSwift

class UserService: UserServiceProtocol {
    
    func fetchUsers() -> Observable<[User]> {
        return Observable.create { observer -> Disposable in
            
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create {
                    print("Wrong URL!")
                }
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -2, userInfo: nil))
                    return
                }
                
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    observer.onNext(users)
                } catch {
                    observer.onError(error)
                }
                
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
