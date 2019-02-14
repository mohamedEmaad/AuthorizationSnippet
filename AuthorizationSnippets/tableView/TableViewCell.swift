//
//  TableViewCell.swift
//  Makfy
//
//  Created by Mohamed Emad on 2/9/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import UIKit
import NewBaseFrameWork
import SnapKit

class TableViewCell: UITableViewCell {
    
    // set the profile image for this cell
    private lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.setCornerRaduis(raduis: 20)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // set the username label
    private lazy var usernameLabel: UILabel = {
        let label = BLabel()
        label.font = Fonts.fontMeduim(size: 20)
        label.textColor = .black
        return label
    }()

    // set the phone number label
    private lazy var userPhoneNom: UILabel = {
        let label = BLabel()
        label.font = Fonts.fontMeduim(size: 17)
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeUIView() // create the ui view for this cell
    }
    
    // create the ui for this cell
    func makeUIView(){
        self.contentView.addSubview(self.profileImageView)
        self.contentView.addSubview(self.usernameLabel)
        self.contentView.addSubview(self.userPhoneNom)
        
        // set the constraints of the profile
        self.profileImageView.snp.makeConstraints { [unowned self] (make) in
            make.leading.equalTo(self.contentView).offset(20)
            make.top.equalTo(self.contentView).offset(10)
            make.width.height.equalTo(40)
        }
        
        // set the constraints of the username
        self.usernameLabel.snp.makeConstraints { [unowned self] (make) in
            make.leading.equalTo(self.profileImageView.snp.trailing).offset(10)
            make.top.equalTo(self.profileImageView).offset(4)
        }
        
        // set the constraints of the phine nom
        self.userPhoneNom.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self.usernameLabel.snp.bottom).offset(10)
            make.leading.equalTo(self.usernameLabel)
            make.bottom.equalTo(self.contentView).offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // setup the views
    func setupViews(viewObject: TableViewObject){
     
        // set up the view with data
        self.profileImageView.image = viewObject.image
        self.usernameLabel.text = viewObject.name
        self.userPhoneNom.text = viewObject.phone
    }

}
