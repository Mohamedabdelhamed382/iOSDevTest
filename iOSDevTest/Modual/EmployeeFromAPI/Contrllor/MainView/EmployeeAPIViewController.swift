//
//  EmployeeAPIViewController.swift
//  iOSDevTest
//
//  Created by MohamedAbdelhamed on 25/09/2022.
//

import UIKit

class EmployeeAPIViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var currentPage: Int = 1
    var totalPages: Int?
    var user: [UserResponse]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingOffersData(1)
        configure()
        registerCell()
    }
}

extension EmployeeAPIViewController {
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeCell")
        
    }
    
    func bindingOffersData(_ page: Int){
        APIService.share.apiRequest(URl: BaseURl.baseURl + "?page=\(page)", parameters: nil, headders: nil, method: .get) { [weak self] (userResponse: DataGram?, error) in
            guard let self = self else {return} 
            switch error{
            case .none:
                guard let users = userResponse?.data  else {return}
                self.totalPages = userResponse?.totalPages
                self.user! += users
                self.tableView.reloadData()
            case .some(let error):
                print(error)
            }
        }
    }
}

extension EmployeeAPIViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! EmployeeTableViewCell
        if let data = user?[indexPath.row] {
            cell.cellConfiger(user: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            // Check if the last row number is the same as the last current data element
        if indexPath.row == (self.user?.count ?? 0) - 1 {
            if currentPage != totalPages {
                currentPage = currentPage + 1
                bindingOffersData(currentPage)
            } else if user?.count ?? 0 <= 100 {
                guard let duplicateArray = user else { return }
                self.user! += duplicateArray
                tableView.reloadData()
            }
        }
    }
}
