
import UIKit

class UserCell: UITableViewCell {

   
    @IBOutlet weak var SecondLbl: UILabel!
    
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
