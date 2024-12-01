//
//  AddStatusModalViewController.swift
//  ExerciseNote
//
//  Created by 신예빈 on 12/1/24.
//

import Foundation
import UIKit
import SnapKit

class AddStatusModalViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "건강 기록하기"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.75)
        return label
    } ()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "2024.12.01"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.4)
        return label
    } ()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "몸무게"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    let weightInput: UITextField = {
        let textField = UITextField(frame: CGRect())
        
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.backgroundColor = .white
        textField.placeholder = "0.0"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        return textField
    } ()
    
    let weightUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "kg"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    let muscleLabel: UILabel = {
        let label = UILabel()
        label.text = "골격근량"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    let muscleInput: UITextField = {
        let textField = UITextField(frame: CGRect())
        
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.backgroundColor = .white
        textField.placeholder = "0.0"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        return textField
    } ()
    
    let muscleUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "kg"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    let fatLabel: UILabel = {
        let label = UILabel()
        label.text = "체지방"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    let fatInput: UITextField = {
        let textField = UITextField(frame: CGRect())
        
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.backgroundColor = .white
        textField.placeholder = "0.0"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        return textField
    } ()
    
    let fatUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "%"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    public let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장하기", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor.white
        
        button.clipsToBounds = true
        button.layer.cornerRadius = 2
        button.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        button.layer.borderWidth = 1
        return button
    } ()
    

    
    private func setUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(weightLabel)
        self.view.addSubview(weightInput)
        self.view.addSubview(weightUnitLabel)
        self.view.addSubview(muscleLabel)
        self.view.addSubview(muscleInput)
        self.view.addSubview(muscleUnitLabel)
        self.view.addSubview(fatLabel)
        self.view.addSubview(fatInput)
        self.view.addSubview(fatUnitLabel)
        self.view.addSubview(confirmButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(110)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        weightInput.snp.makeConstraints { make in
            make.leading.equalTo(weightLabel.snp.trailing).offset(-20)
            make.top.equalTo(weightLabel.snp.top)
            make.width.equalTo(120)
            make.height.equalTo(35)
        }
        
        weightUnitLabel.snp.makeConstraints { make in
            make.trailing.equalTo(weightInput.snp.trailing).offset(-10)
            make.centerY.equalTo(weightInput)
        }
        
        muscleLabel.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(20)
            make.leading.equalTo(weightLabel.snp.leading)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        muscleInput.snp.makeConstraints { make in
            make.leading.equalTo(weightInput.snp.leading)
            make.top.equalTo(muscleLabel.snp.top)
            make.width.equalTo(120)
            make.height.equalTo(35)
        }
        
        muscleUnitLabel.snp.makeConstraints { make in
            make.trailing.equalTo(muscleInput.snp.trailing).offset(-10)
            make.centerY.equalTo(muscleInput)
        }
        
        fatLabel.snp.makeConstraints { make in
            make.top.equalTo(muscleLabel.snp.bottom).offset(20)
            make.leading.equalTo(weightLabel.snp.leading)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        fatInput.snp.makeConstraints { make in
            make.leading.equalTo(weightInput.snp.leading)
            make.top.equalTo(fatLabel.snp.top)
            make.width.equalTo(120)
            make.height.equalTo(35)
        }
        
        fatUnitLabel.snp.makeConstraints { make in
            make.trailing.equalTo(fatInput.snp.trailing).offset(-10)
            make.centerY.equalTo(fatInput)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(fatLabel.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalToSuperview().dividedBy(3.5)
        }
    }
    
    override func viewDidLoad() {
        setUI()
    }
}
