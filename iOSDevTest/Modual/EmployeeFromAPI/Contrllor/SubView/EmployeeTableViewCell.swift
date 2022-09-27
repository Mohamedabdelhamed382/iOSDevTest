//
//  EmployeeTableViewCell.swift
//  iOSDevTest
//
//  Created by MohamedAbdelhamed on 25/09/2022.
//

import UIKit
import Kingfisher

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none    }
    
    func cellConfiger(user: UserResponse) {
        if let imageURL = user.avatar {
            userImage.kf.setImage(with: imageURL.asUrl)
        }
        firstName.text = user.firstName
        lastName.text = user.lastName
        email.text = user.email
    }
    
}
