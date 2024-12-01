//
//  RoutineModalViewController.swift
//  ExerciseNote
//
//  Created by 신예빈 on 12/1/24.
//

import Foundation
import UIKit
import SnapKit

class RoutineModalViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "어께 운동 루틴"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.6)
        return label
    } ()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "5운동 X 3set"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.6)
        return label
    } ()
    
    let scrollView = UIScrollView()
    
    let routineView1 = RoutineView()
    let routineView2 = RoutineView()
    let routineView3 = RoutineView()
    let routineView4 = RoutineView()
    let routineView5 = RoutineView()
    
    override func viewDidLoad() {
        routineView1.configure(title: "1. 오버헤드프레스", r1: "50kg / 8rm", r2: "50kg / 8rm", r3: "50kg / 8rm", r4: "", r5: "")
        routineView2.configure(title: "2. 덤벨숄더프레스", r1: "20kg / 10rm", r2: "20kg / 10rm", r3: "20kg / 10rm", r4: "", r5: "")
        routineView3.configure(title: "3. 머신숄더프레스", r1: "20kg / 15rm", r2: "20kg / 15rm", r3: "20kg / 15rm", r4: "", r5: "")
        routineView4.configure(title: "4. 사이드레터럴레이즈", r1: "8kg / 12rm", r2: "8kg / 12rm", r3: "8kg / 12rm", r4: "", r5: "")
        routineView5.configure(title: "5. 사이드레터럴레이즈", r1: "4kg / 20rm", r2: "4kg / 20rm", r3: "4kg / 20rm", r4: "", r5: "")
        
        self.view.backgroundColor = .background
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(totalLabel)
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(routineView1)
        scrollView.addSubview(routineView2)
        scrollView.addSubview(routineView3)
        scrollView.addSubview(routineView4)
        scrollView.addSubview(routineView5)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        routineView1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(130)
            make.height.equalTo(160)
        }
        
        routineView2.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(routineView1.snp.trailing).offset(10)
            make.width.equalTo(130)
            make.height.equalTo(160)
        }
        
        routineView3.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(routineView2.snp.trailing).offset(10)
            make.width.equalTo(130)
            make.height.equalTo(160)
        }
        
        routineView4.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(routineView3.snp.trailing).offset(10)
            make.width.equalTo(130)
            make.height.equalTo(160)
        }
        
        routineView5.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(routineView4.snp.trailing).offset(10)
            make.width.equalTo(130)
            make.height.equalTo(160)
            make.trailing.equalToSuperview().offset(-10)
        }
        
    }
    
    
}
