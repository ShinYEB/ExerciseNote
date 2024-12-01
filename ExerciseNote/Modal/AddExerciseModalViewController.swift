//
//  AddExerciseModalViewController.swift
//  ExerciseNote
//
//  Created by 신예빈 on 12/1/24.
//

import Foundation
import UIKit
import SnapKit

class AddExerciseModalViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "운동 기록하기"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.75)
        return label
    } ()
    
    private let currenttimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2024.12.01"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.4)
        return label
    } ()
    
    let exerciseLabel: UILabel = {
        let label = UILabel()
        label.text = "종목"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    let exerciseInput: UITextField = {
        let textField = UITextField(frame: CGRect())
        
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.backgroundColor = .white
        textField.placeholder = "-"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        return textField
    } ()
    
    let exerciseUnitLabel: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "arrowtriangle")
        return view
    } ()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "무게"
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
    
    let fatLabel: UILabel = {
        let label = UILabel()
        label.text = "횟수"
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
        textField.placeholder = "0"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        return textField
    } ()
    
    let fatUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "rm"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "시간"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    let timeInput: UITextField = {
        let textField = UITextField(frame: CGRect())
        
        textField.textColor = .black
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.backgroundColor = .white
        textField.placeholder = "0"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        return textField
    } ()
    
    let timeUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "초"
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
    
    public let timeButton: UIButton = {
        let button = UIButton()
        button.setTitle("시간 체크", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor.white
        
        button.clipsToBounds = true
        button.layer.cornerRadius = 2
        button.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        button.layer.borderWidth = 1
        return button
    } ()
    
    let todayRoutineView = TodayRoutineView()
    
    private func setUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(currenttimeLabel)
        scrollView.addSubview(weightLabel)
        scrollView.addSubview(weightInput)
        scrollView.addSubview(weightUnitLabel)
        scrollView.addSubview(exerciseLabel)
        scrollView.addSubview(exerciseInput)
        scrollView.addSubview(exerciseUnitLabel)
        scrollView.addSubview(fatLabel)
        scrollView.addSubview(fatInput)
        scrollView.addSubview(fatUnitLabel)
        scrollView.addSubview(timeLabel)
        scrollView.addSubview(timeInput)
        scrollView.addSubview(timeUnitLabel)
        scrollView.addSubview(timeButton)
        scrollView.addSubview(confirmButton)
        
        scrollView.addSubview(todayRoutineView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()}
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        currenttimeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        exerciseLabel.snp.makeConstraints { make in
            make.top.equalTo(currenttimeLabel.snp.bottom).offset(20)
            make.leading.equalTo(weightLabel.snp.leading)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        exerciseInput.snp.makeConstraints { make in
            make.leading.equalTo(weightInput.snp.leading)
            make.top.equalTo(exerciseLabel.snp.top)
            make.width.equalTo(120)
            make.height.equalTo(35)
        }
        
        exerciseUnitLabel.snp.makeConstraints { make in
            make.trailing.equalTo(exerciseInput.snp.trailing).offset(-10)
            make.centerY.equalTo(exerciseInput)
            make.height.equalTo(10)
            make.width.equalTo(10)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(exerciseLabel.snp.bottom).offset(20)
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
        
        fatLabel.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(20)
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
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(fatLabel.snp.bottom).offset(20)
            make.leading.equalTo(weightLabel.snp.leading)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        timeInput.snp.makeConstraints { make in
            make.leading.equalTo(weightInput.snp.leading)
            make.top.equalTo(timeLabel.snp.top)
            make.width.equalTo(120)
            make.height.equalTo(35)
        }
        
        timeUnitLabel.snp.makeConstraints { make in
            make.trailing.equalTo(timeInput.snp.trailing).offset(-10)
            make.centerY.equalTo(timeLabel)
        }
        
        timeButton.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(80)
            make.height.equalTo(40)
            make.width.equalToSuperview().dividedBy(3.5)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(200)
            make.height.equalTo(40)
            make.width.equalToSuperview().dividedBy(3.5)
        }
        
        todayRoutineView.snp.makeConstraints { make in
            make.top.equalTo(confirmButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(scrollView.snp.bottom)
            make.height.equalTo(400)
            make.width.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        setUI()
    }
}
