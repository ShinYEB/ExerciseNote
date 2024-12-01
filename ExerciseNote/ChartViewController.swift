//
//  ChartViewController.swift
//  ExerciseNote
//
//  Created by 신예빈 on 12/1/24.
//

import UIKit
import DGCharts

class ChartViewController: UIViewController {
    let weightChartView: LineChartView = {
        
        let chartView = LineChartView()
        
        chartView.translatesAutoresizingMaskIntoConstraints = true
        chartView.backgroundColor = .white
        chartView.clipsToBounds = true
        chartView.layer.cornerRadius = 5
        
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
    
    let muscleChartView: LineChartView = {
        
        let chartView = LineChartView()
        
        chartView.translatesAutoresizingMaskIntoConstraints = true
        chartView.backgroundColor = .white
        chartView.clipsToBounds = true
        chartView.layer.cornerRadius = 5
        
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
        
        chartView.leftAxis.axisMinimum = 35  // Y축 최소값
        chartView.leftAxis.axisMaximum = 75  // Y축 최대값

        chartView.highlightPerDragEnabled = false
        chartView.highlightPerTapEnabled = false
        chartView.dragEnabled = false
        
        return chartView
    }()
    
    let fatChartView: LineChartView = {
        
        let chartView = LineChartView()
        
        chartView.translatesAutoresizingMaskIntoConstraints = true
        chartView.backgroundColor = .white
        chartView.clipsToBounds = true
        chartView.layer.cornerRadius = 5
        
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
        
        chartView.leftAxis.axisMinimum = 5  // Y축 최소값
        chartView.leftAxis.axisMaximum = 35  // Y축 최대값

        chartView.highlightPerDragEnabled = false
        chartView.highlightPerTapEnabled = false
        chartView.dragEnabled = false
        
        return chartView
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "몸무게"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.8)
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    } ()
    
    let muscleLabel: UILabel = {
        let label = UILabel()
        label.text = "골격근"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.8)
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    } ()
    
    let fatLabel: UILabel = {
        let label = UILabel()
        label.text = "체지방"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black.withAlphaComponent(0.8)
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    } ()
    
    private func setUI() {
        self.view.addSubview(weightChartView)
        self.view.addSubview(muscleChartView)
        self.view.addSubview(fatChartView)
        self.view.addSubview(weightLabel)
        self.view.addSubview(muscleLabel)
        self.view.addSubview(fatLabel)
        
        weightChartView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(110)
            make.width.equalToSuperview().dividedBy(3.2)
        }
        
        muscleChartView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(110)
            make.width.equalToSuperview().dividedBy(3.2)
        }
        
        fatChartView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(110)
            make.width.equalToSuperview().dividedBy(3.2)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(weightChartView.snp.bottom).offset(-10)
            make.centerX.equalTo(weightChartView.snp.centerX)
            make.width.equalTo(weightChartView.snp.width)
            make.height.equalTo(20)
        }
        
        muscleLabel.snp.makeConstraints { make in
            make.top.equalTo(muscleChartView.snp.bottom).offset(-10)
            make.centerX.equalTo(muscleChartView.snp.centerX)
            make.width.equalTo(muscleChartView.snp.width)
            make.height.equalTo(20)
        }
        
        fatLabel.snp.makeConstraints { make in
            make.top.equalTo(fatChartView.snp.bottom).offset(-10)
            make.centerX.equalTo(fatChartView.snp.centerX)
            make.width.equalTo(fatChartView.snp.width)
            make.height.equalTo(20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        configure()
    }
    
    public func configure() {
        let weightitem = [75, 76, 76, 78, 80, 81, 83, 86, 84, 82]
        
        let lineDataSet = LineChartDataSet(entries: entryData(values: weightitem, startIdx: 0), label: "line")
        lineDataSet.drawCirclesEnabled = false
        lineDataSet.drawValuesEnabled = false
        lineDataSet.colors = [.custom1] // 라인 색상
        lineDataSet.circleRadius = 4.0 // 데이터 포인트 크기
        lineDataSet.lineWidth = 2.0 // 라인 두께
        lineDataSet.valueColors = [.black] // 데이터 값 색상
        lineDataSet.mode = .cubicBezier
        let lineData = LineChartData(dataSets: [lineDataSet])
        weightChartView.data = lineData
        
        let muscleitem = [50, 51, 51, 52, 52, 54, 56, 57, 54, 53]
        
        let lineDataSet2 = LineChartDataSet(entries: entryData(values: muscleitem, startIdx: 0), label: "line")
        lineDataSet2.drawCirclesEnabled = false
        lineDataSet2.drawValuesEnabled = false
        lineDataSet2.colors = [.custom2] // 라인 색상
        lineDataSet2.circleRadius = 4.0 // 데이터 포인트 크기
        lineDataSet2.lineWidth = 2.0 // 라인 두께
        lineDataSet2.valueColors = [.black] // 데이터 값 색상
        lineDataSet2.mode = .cubicBezier
        let lineData2 = LineChartData(dataSets: [lineDataSet2])
        muscleChartView.data = lineData2
        
        let fatitem = [16, 16, 17, 18, 18, 17, 18, 19, 17, 16]
        
        let lineDataSet3 = LineChartDataSet(entries: entryData(values: fatitem, startIdx: 0), label: "line")
        lineDataSet3.drawCirclesEnabled = false
        lineDataSet3.drawValuesEnabled = false
        lineDataSet3.colors = [.custom3] // 라인 색상
        lineDataSet3.circleRadius = 4.0 // 데이터 포인트 크기
        lineDataSet3.lineWidth = 2.0 // 라인 두께
        lineDataSet3.valueColors = [.black] // 데이터 값 색상
        lineDataSet3.mode = .cubicBezier
        let lineData3 = LineChartData(dataSets: [lineDataSet3])
        fatChartView.data = lineData3
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
