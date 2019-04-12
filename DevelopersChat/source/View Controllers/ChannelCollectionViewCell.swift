//
//  ChannelTableViewCell.swift
//  DevelopersChat
//
//  Created by stag on 11/04/19.
//  Copyright © 2019 Gabriel Silva. All rights reserved.
//

import UIKit


class ChannelCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameChannelLabel: UILabel?
    @IBOutlet weak var backgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func loadChannels(channel: Channel) {
        self.nameChannelLabel?.text = channel.name
    }

}
