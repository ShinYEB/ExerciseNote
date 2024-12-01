//
//  ExerciseDetailModalViewController.swift
//  ExerciseNote
//
//  Created by 신예빈 on 12/1/24.
//

import Foundation
import UIKit
import SnapKit
import DGCharts

class ExerciseDetailModalViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.6)
        return label
    } ()
    
    let weightTextLabel: UILabel = {
        let label = UILabel()
        label.text = "최대 무게"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.4)
        return label
    } ()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    let setTextLabel: UILabel = {
        let label = UILabel()
        label.text = "세트"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.4)
        return label
    } ()
    
    let setLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    let countTextLabel: UILabel = {
        let label = UILabel()
        label.text = "횟수"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.4)
        return label
    } ()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    } ()
    
    
    let chartView: LineChartView = {
        
        let chartView = LineChartView()
        
        chartView.translatesAutoresizingMaskIntoConstraints = true
        chartView.backgroundColor = .background
        chartView.clipsToBounds = true
        chartView.layer.cornerRadius = 15
        
        // Chart 설정 - Legend, Description, Gridlines 제거
        chartView.chartDescription.enabled = false
        chartView.legend.enabled = false
        
        // X축 설정 - 라벨 및 그리드 제거
        chartView.xAxis.drawLabelsEnabled = false // X축 레이블 비활성화
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.labelPosition = .bottom
        
//        chartView.xAxis.axisMinimum = 0
        chartView.xAxis.axisMaximum = 10
        chartView.setVisibleXRangeMaximum(10)
        
        // Y축 설정 - 왼쪽, 오른쪽 축 제거
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.leftAxis.axisMinimum = 60  // Y축 최소값
        chartView.leftAxis.axisMaximum = 100  // Y축 최대값
        
        chartView.highlightPerDragEnabled = false
        chartView.highlightPerTapEnabled = false
        chartView.dragEnabled = false
        
        return chartView
    }()
    
    
    
    private func setUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(chartView)
        self.view.addSubview(weightTextLabel)
        self.view.addSubview(weightLabel)
        self.view.addSubview(setTextLabel)
        self.view.addSubview(setLabel)
        self.view.addSubview(countTextLabel)
        self.view.addSubview(countLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        chartView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        weightTextLabel.snp.makeConstraints { make in
            make.top.equalTo(chartView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(125)
            make.width.equalTo(75)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(weightTextLabel.snp.top)
            make.leading.equalTo(weightTextLabel.snp.trailing).offset(20)
            make.width.equalTo(50)
        }
        
        setTextLabel.snp.makeConstraints { make in
            make.top.equalTo(weightTextLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(125)
            make.width.equalTo(75)
        }
        
        setLabel.snp.makeConstraints { make in
            make.top.equalTo(setTextLabel.snp.top)
            make.leading.equalTo(setTextLabel.snp.trailing).offset(20)
            make.width.equalTo(50)
        }
        
        countTextLabel.snp.makeConstraints { make in
            make.top.equalTo(setTextLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(125)
            make.width.equalTo(75)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(countTextLabel.snp.top)
            make.leading.equalTo(countTextLabel.snp.trailing).offset(20)
            make.width.equalTo(50)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        configure()
        setInfo(title:"벤치프레스", weight: 70, set: 5, count: 1)
    }
    
    public func setInfo(title:String, weight:Int, set:Int, count:Int) {
        titleLabel.text = title
        weightLabel.text = String(weight) + " kg"
        setLabel.text = String(set) + " set"
        countLabel.text = String(count) + " rm"
    }
    
    public func configure() {
        let item = [70, 70, 70, 70, 75, 75, 75, 75, 75, 75]
        
        let lineDataSet = LineChartDataSet(entries: entryData(values: item, startIdx: 0), label: "line")
        lineDataSet.drawCirclesEnabled = false
        lineDataSet.drawValuesEnabled = false
        lineDataSet.colors = [.custom2] // 라인 색상
        lineDataSet.circleRadius = 4.0 // 데이터 포인트 크기
        lineDataSet.lineWidth = 2.0 // 라인 두께
        lineDataSet.valueColors = [.black] // 데이터 값 색상
        //lineDataSet.mode = .cubicBezier
        let lineData = LineChartData(dataSets: [lineDataSet])
        chartView.data = lineData
    }
    
    func entryData(values: [Int], startIdx:Int) -> [ChartDataEntry] {
        // entry 담을 array
        var chartDataEntries: [ChartDataEntry] = []
        // 담기
        for i in 0 ..< values.count {
            let chartDataEntry = ChartDataEntry(x: Double(i+startIdx), y: Double(values[i]))
            chartDataEntries.append(chartDataEntry)
        }
        // 반환
        return chartDataEntries
    }
}
