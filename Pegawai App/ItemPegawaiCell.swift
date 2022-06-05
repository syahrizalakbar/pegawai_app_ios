//
//  ItemPegawai.swift
//  Pegawai App
//
//  Created by IDOUDA on 27/03/22.
//

import UIKit

class ItemPegawaiCell: UITableViewCell {
    
    @IBOutlet weak var namaPegawai: UILabel!
    @IBOutlet weak var gajiPegawai: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
