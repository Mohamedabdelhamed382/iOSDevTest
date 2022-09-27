//
//  OnbordingScreenViewController.swift
//  iOSDevTest
//
//  Created by MohamedAbdelhamed on 26/09/2022.
//

import UIKit

class OnbordingScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func apiNavgationActionButton(_ sender: UIButton) {
        let vc = EmployeeAPIViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sqlLiteNavagtionActionButton(_ sender: UIButton) {
        let vc = SqlLiteViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
