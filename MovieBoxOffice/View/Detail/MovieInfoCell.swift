//
//  MovieInfoCell.swift
//  MovieBoxOffice
//
//  Created by ParkSungJoon on 11/12/2018.
//  Copyright © 2018 Park Sung Joon. All rights reserved.
//

import UIKit

protocol PosterTapDelegate {
    func posterTapDelegate()
}

class MovieInfoCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var salesLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var audienceLabel: UILabel!
    @IBOutlet weak var gradeView: GradeView!
    @IBOutlet weak var ratingView: RatingView!
    
    var delegate: PosterTapDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTapGesture()
        setGradeView()
    }
    
    fileprivate func setGradeView() {
        gradeView.layer.masksToBounds = true
        gradeView.layer.cornerRadius = gradeView.frame.size.width / 2
    }
    
    fileprivate func addTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(setTapGestureAction(_:)))
        posterImageView.isUserInteractionEnabled = true
        posterImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func setTapGestureAction(_ sender: UIGestureRecognizer){
        delegate?.posterTapDelegate()
    }
}
