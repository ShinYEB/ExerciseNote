//
//  ExerciseScrollerViewController.swift
//  ExerciseNote
//
//  Created by 신예빈 on 12/1/24.
//

import Foundation
import UIKit
import SnapKit

class ExerciseScrollerViewController: UIViewController {
    
    let exerciseView1 = ExerciseView()
    let exerciseView2 = ExerciseView()
    let exerciseView3 = ExerciseView()
    let exerciseView4 = ExerciseView()
    let exerciseView5 = ExerciseView()
    
    let scrollView = UIScrollView()
    
    public func setUI() {
        exerciseView1.configure(title: "스쿼트", imgUrl: "deadLift")
        exerciseView2.configure(title: "바벨컬", imgUrl: "barbell")
        exerciseView3.configure(title: "헤머컬", imgUrl: "dumbbell")
        exerciseView4.configure(title: "데드리프트", imgUrl: "deadLift")
        exerciseView5.configure(title: "덤벨켈", imgUrl: "dumbbell")
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(exerciseView1)
        scrollView.addSubview(exerciseView2)
        scrollView.addSubview(exerciseView3)
        scrollView.addSubview(exerciseView4)
        scrollView.addSubview(exerciseView5)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        exerciseView1.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        exerciseView2.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.leading.equalTo(exerciseView1.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        exerciseView3.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.leading.equalTo(exerciseView2.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        exerciseView4.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.leading.equalTo(exerciseView3.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        exerciseView5.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.leading.equalTo(exerciseView4.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        // UITapGestureRecognizer 생성
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        exerciseView1.addGestureRecognizer(tapGesture)
        
        // 사용자 상호작용 활성화
        exerciseView1.isUserInteractionEnabled = true
    }
    
    @objc func viewTapped() {
        // 클릭했을 때 실행될 코드
        let viewController = ExerciseDetailModalViewController()
        
        if let sheet = viewController.sheetPresentationController {
            let screenHeight = UIScreen.main.bounds.height
            let oneThirdHeight = screenHeight / 2.2
            
            sheet.detents = [.custom { _ in oneThirdHeight }]
            sheet.prefersGrabberVisible = true
        }
        
        self.present(viewController, animated: true)    }
}
