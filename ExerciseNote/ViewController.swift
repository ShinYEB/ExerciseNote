//
//  ViewController.swift
//  ExerciseNote
//
//  Created by 신예빈 on 11/30/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICalendarSelectionSingleDateDelegate, UICalendarViewDelegate {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .background
        return scrollView
    }()
    
    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    } ()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Exercise Note"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.contentMode = .bottom
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.6)
        label.backgroundColor = .white
        return label
    } ()
    
    let calenderTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "건강 관리"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.6)
        return label
    } ()
    
    let healthTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "건강 기록"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.6)
        return label
    } ()
    
    let exerciseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "운동 기록"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.6)
        return label
    } ()

    let RoutineTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "루틴"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.6)
        return label
    } ()
    
    let calenderView: UICalendarView = {
        var view = UICalendarView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        view.wantsDateDecorations = true
        view.calendar = .current //뷰 컨트롤러의 캘린더를 사용자의 지역의 현재 캘린더로 설정
        view.locale = .current //캘린더 뷰 컨트롤러의 지역을 사용자의 지역의 현재 지역
        view.fontDesign = . rounded
        view.timeZone = TimeZone(abbreviation: "Ko_KR")
        return view
    }()
    
    let healthCheckDates: [DateComponents] = [
        DateComponents(year: 2024, month: 11, day: 11),
    ]
    
    let exerciseCheckDates: [DateComponents] = [
        DateComponents(year: 2024, month: 11, day: 14),
        DateComponents(year: 2024, month: 11, day: 15),
        DateComponents(year: 2024, month: 11, day: 17),
        DateComponents(year: 2024, month: 11, day: 20),
        DateComponents(year: 2024, month: 11, day: 21),
        DateComponents(year: 2024, month: 11, day: 26),
        DateComponents(year: 2024, month: 11, day: 28),
        DateComponents(year: 2024, month: 11, day: 29),
        DateComponents(year: 2024, month: 11, day: 30)
    ]
    
    let markedDates: [DateComponents] = [
        DateComponents(year: 2024, month: 11, day: 18),
        DateComponents(year: 2024, month: 11, day: 25),
    ]
    
    let chartVC = ChartViewController()
    let exerciseScrollerVC = ExerciseScrollerViewController()
    let routineScrollerVC = RoutineScrollerViewController()
    
    func setUI() {
        self.view.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(titleView)
        titleView.addSubview(titleLabel)
        scrollView.addSubview(calenderTitleLabel)
        scrollView.addSubview(healthTitleLabel)
        scrollView.addSubview(exerciseTitleLabel)
        scrollView.addSubview(RoutineTitleLabel)
        
        addChild(chartVC)
        addChild(exerciseScrollerVC)
        addChild(routineScrollerVC)
        scrollView.addSubview(chartVC.view)
        scrollView.addSubview(exerciseScrollerVC.view)
        scrollView.addSubview(routineScrollerVC.view)
        scrollView.addSubview(calenderView)
        
        chartVC.didMove(toParent: self)
        exerciseScrollerVC.didMove(toParent: self)
        routineScrollerVC.didMove(toParent: self)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(40)
        }
        
        calenderTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(25)
        }
        
        calenderView.snp.makeConstraints { make in
            make.top.equalTo(calenderTitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(420)
        }
        
        healthTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(calenderView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(25)
        }
        
        chartVC.view.snp.makeConstraints { make in
            make.top.equalTo(healthTitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(120)
        }
        
        exerciseTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(chartVC.view.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(25)
        }
        
        exerciseScrollerVC.view.snp.makeConstraints { make in
            make.top.equalTo(exerciseTitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(100)
        }
        
        RoutineTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(exerciseScrollerVC.view.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
            make.height.equalTo(25)
        }
        
        routineScrollerVC.view.snp.makeConstraints { make in
            make.top.equalTo(RoutineTitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(100)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-100)
        }
        
        
        calenderView.selectionBehavior = UICalendarSelectionSingleDate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUI()
        
        calenderView.delegate = self
        
    }
    
    
    func getStringToDate(strDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = NSTimeZone(name: "Ko_KR") as TimeZone?
            
        return dateFormatter.date(from: strDate)!
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        if (dateComponents?.day) != nil {
            let viewController = AddStatusModalViewController()
            
            if let sheet = viewController.sheetPresentationController {
                let screenHeight = UIScreen.main.bounds.height
                let oneThirdHeight = screenHeight / 2.75
                
                sheet.detents = [.custom { _ in oneThirdHeight }]
                //sheet.detents = [.medium()]
                sheet.prefersGrabberVisible = true
            }
            
            self.present(viewController, animated: true)
            
        }else {print("empty date")}
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        if healthCheckDates.contains(where: { $0.year == dateComponents.year && $0.month == dateComponents.month && $0.day == dateComponents.day }) {
            // 동그라미 스타일 추가
            return .customView {
                let circleView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                circleView.backgroundColor = .systemMint
                circleView.layer.cornerRadius = 5 // 동그라미로 만들기
                return circleView
            }
        }
        
        if exerciseCheckDates.contains(where: { $0.year == dateComponents.year && $0.month == dateComponents.month && $0.day == dateComponents.day }) {
            // 동그라미 스타일 추가
            return .customView {
                let circleView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                circleView.backgroundColor = .custom3
                circleView.layer.cornerRadius = 5 // 동그라미로 만들기
                return circleView
            }
        }
        
        if markedDates.contains(where: { $0.year == dateComponents.year && $0.month == dateComponents.month && $0.day == dateComponents.day }) {
            // 동그라미 스타일 추가
            return .customView {
                let circleView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                circleView.backgroundColor = .blue
                circleView.layer.cornerRadius = 5 // 동그라미로 만들기
                return circleView
            }
        }
        return nil
    }
    
}



//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let current_date_string = formatter.string(from: Date())
//
//
//        DatabaseManager().InsertInfoDates(date: current_date_string)
//        let item = DatabaseManager().SelectInfoDates(date: nil)
//        print(item)
//
//        DatabaseManager().InsertInfo(id: 1, height: 1, weight: 2, muscle: 3, fat: 4)
//        DatabaseManager().InsertInfo(id: 2, height: 3, weight: 4, muscle: 3, fat: 4)
//
//        let item2 = DatabaseManager().SelectInfo(id: nil)
//        print(item2)
//
//        let item3 = DatabaseManager().SelectInfo(id: 1)
//        print(item3)
