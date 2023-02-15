//
//  ToDoCell.swift
//  ToDos
//
//  Created by 项宇杰 on 2023/2/5.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var checkBoxBtn: UIButton!
    @IBOutlet weak var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkBoxBtn.setImage(UIImage(systemName: "circle"), for: .normal)
        checkBoxBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
