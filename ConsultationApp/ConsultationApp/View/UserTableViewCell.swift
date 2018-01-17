/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2017C
 Assignment: 3
 Author: Ho Phu Thien- Tran Trong Tri- Nguyen Tran Ngoc Diep
 ID: s3574966-s3533437- s3519039
 Created date: 26/12/2017
 Acknowledgement:
 -Thien
 Client-side fan-out for data consistency
 https://firebase.googleblog.com/2015/10/client-side-fan-out-for-data-consistency_73.html
 Programmatically creating UITabBarController in Swift
 https://medium.com/ios-os-x-development/programmatically-creating-uitabbarcontroller-in-swift-e957cd35cfc4
 Programmatically Creating Constraints
 https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/ProgrammaticallyCreatingConstraints.html
 iOS Notes 19 : How to push and present to ViewController programmatically ? [ How to switch VC ]
 https://freakycoder.com/ios-notes-19-how-to-push-and-present-to-viewcontroller-programmatically-how-to-switch-vc-8f8f65b55c7b
 Create UITabBarController programmatically
 http://swiftdeveloperblog.com/code-examples/create-uitabbarcontroller-programmatically/
 UINavigationController And UITabBarController Programmatically (Swift 3)
 https://medium.com/@ITZDERR/uinavigationcontroller-and-uitabbarcontroller-programmatically-swift-3-d85a885a5fd0
 -Diep
 Delegate Protocol for custom cell
 https://www.youtube.com/watch?v=3Rrzm9ZXdds
 DLRadioButton
 https://github.com/DavydLiu/DLRadioButton
 Pass Data Between View Controllers
 https://www.youtube.com/watch?v=7fbTHFH3tl4
 -Tri
 https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html#//apple_ref/doc/uid/TP40015214-CH2-SW1
 */

import UIKit
import FirebaseDatabase

protocol UserCellDelegate {
    func switchRoleChanged(sender : UserTableViewCell, check : Bool)
    func consultantRoleChanged(sender : UserTableViewCell, tag : Int)
}

class UserTableViewCell: UITableViewCell {

    var delegate: UserCellDelegate?
    @IBOutlet weak var userAvarta: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var switchRole: UISwitch!
    
    @IBOutlet weak var generalBtn: DLRadioButton!
    @IBOutlet weak var loveBtn: DLRadioButton!
    @IBOutlet weak var stressBtn: DLRadioButton!
    @IBOutlet weak var depressBtn: DLRadioButton!
    
    var refUser : DatabaseReference!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

    @IBAction func switchRoleChanged(_ sender: UISwitch) {
        if let delegate = self.delegate {
            delegate.switchRoleChanged(sender: self, check: sender.isOn)
        }
    }
    
    @IBAction func btnTapped(_ sender: DLRadioButton) {
        if let delegate = self.delegate {
            delegate.consultantRoleChanged(sender: self, tag: sender.tag)
        }
    }
    
}
