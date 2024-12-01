//
//  TodayRoutineView.swift
//  ExerciseNote
//
//  Created by 신예빈 on 12/1/24.
//

import Foundation
import UIKit
import SnapKit

class TodayRoutineView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 루틴"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.8)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex1: UILabel = {
        let label = UILabel()
        label.text = "1. 벤치프레스"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.65)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex1_r1: UILabel = {
        let label = UILabel()
        label.text = "70kg / 3rm / 20s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex1_r2: UILabel = {
        let label = UILabel()
        label.text = "65kg / 5rm / 30s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex1_r3: UILabel = {
        let label = UILabel()
        label.text = "65kg / 5rm / 30s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex1_r4: UILabel = {
        let label = UILabel()
        label.text = "60kg / 5rm / 30s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex1_r5: UILabel = {
        let label = UILabel()
        label.text = "70kg / 5rm / 30s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex2: UILabel = {
        let label = UILabel()
        label.text = "2. 딥스"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.65)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex2_r1: UILabel = {
        let label = UILabel()
        label.text = "12 rm / 0kg / 25s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex2_r2: UILabel = {
        let label = UILabel()
        label.text = "12 rm / 0kg / 25s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex2_r3: UILabel = {
        let label = UILabel()
        label.text = "12 rm / 0kg / 25s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex3: UILabel = {
        let label = UILabel()
        label.text = "펙 덱 플라이"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.65)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex3_r1: UILabel = {
        let label = UILabel()
        label.text = "15 rm / 59kg / 60s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex3_r2: UILabel = {
        let label = UILabel()
        label.text = "15 rm / 59kg / 60s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    let ex3_r3: UILabel = {
        let label = UILabel()
        label.text = "15 rm / 59kg / 60s"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        label.backgroundColor = .white
        return label
    } ()
    
    private func setUI() {
        addSubview(titleLabel)
        addSubview(ex1)
        addSubview(ex2)
        addSubview(ex3)
        
        addSubview(ex1_r1)
        addSubview(ex1_r2)
        addSubview(ex1_r3)
        addSubview(ex1_r4)
        addSubview(ex1_r5)
        
        addSubview(ex2_r1)
        addSubview(ex2_r2)
        addSubview(ex2_r3)
        
        addSubview(ex3_r1)
        addSubview(ex3_r2)
        addSubview(ex3_r3)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(150)
        }
        
        ex1.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        ex1_r1.snp.makeConstraints { make in
            make.top.equalTo(ex1.snp.bottom).offset(7)
            make.leading.equalTo(ex1.snp.leading)
        }
        
        ex1_r2.snp.makeConstraints { make in
            make.top.equalTo(ex1_r1.snp.bottom).offset(5)
            make.leading.equalTo(ex1.snp.leading)
        }
        
        ex1_r3.snp.makeConstraints { make in
            make.top.equalTo(ex1_r2.snp.bottom).offset(5)
            make.leading.equalTo(ex1.snp.leading)
        }
        
        ex1_r4.snp.makeConstraints { make in
            make.top.equalTo(ex1_r3.snp.bottom).offset(5)
            make.leading.equalTo(ex1.snp.leading)
        }
        
        ex1_r5.snp.makeConstraints { make in
            make.top.equalTo(ex1_r4.snp.bottom).offset(5)
            make.leading.equalTo(ex1.snp.leading)
        }
        
        ex2.snp.makeConstraints { make in
            make.top.equalTo(ex1_r5.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        ex2_r1.snp.makeConstraints { make in
            make.top.equalTo(ex2.snp.bottom).offset(7)
            make.leading.equalTo(ex2.snp.leading)
        }
        
        ex2_r2.snp.makeConstraints { make in
            make.top.equalTo(ex2_r1.snp.bottom).offset(5)
            make.leading.equalTo(ex2.snp.leading)
        }
        
        ex2_r3.snp.makeConstraints { make in
            make.top.equalTo(ex2_r2.snp.bottom).offset(5)
            make.leading.equalTo(ex2.snp.leading)
        }
        
        ex3.snp.makeConstraints { make in
            make.top.equalTo(ex2_r3.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        ex3_r1.snp.makeConstraints { make in
            make.top.equalTo(ex3.snp.bottom).offset(7)
            make.leading.equalTo(ex2.snp.leading)
        }
        
        ex3_r2.snp.makeConstraints { make in
            make.top.equalTo(ex3_r1.snp.bottom).offset(5)
            make.leading.equalTo(ex2.snp.leading)
        }
        
        ex3_r3.snp.makeConstraints { make in
            make.top.equalTo(ex3_r2.snp.bottom).offset(5)
            make.leading.equalTo(ex3.snp.leading)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect())
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
