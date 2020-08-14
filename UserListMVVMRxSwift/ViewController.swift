//
//  ViewController.swift
//  UserListMVVMRxSwift
//
//  Created by Sergey on 13.08.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private var viewModel: UsersListViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: UsersListViewModel) -> ViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.tableFooterView = UIView()
        
        viewModel.fetchUserViewModels()
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UserTableViewCell.self)) { index, viewModel, cell in
                cell.nameLabel?.text = viewModel.displayName
                cell.phoneLabel?.text = viewModel.displayUser
        }.disposed(by: disposeBag)
    }
}


