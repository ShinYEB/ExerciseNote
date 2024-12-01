//
//  ExerciseView.swift
//  ExerciseNote
//
//  Created by 신예빈 on 12/1/24.
//

import Foundation
import UIKit
import SnapKit

class ExerciseView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.8)
        label.backgroundColor = .white
        return label
    } ()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "STOCK SIGNAL")
        return view
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect())
        
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 15
        
        self.addSubview(titleLabel)
        self.addSubview(imageView)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-15)}
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(25)
            make.height.equalTo(20)
        }
    }
    
    public func configure(title: String, imgUrl: String) {
        titleLabel.text = title
        imageView.image = UIImage(named: imgUrl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
