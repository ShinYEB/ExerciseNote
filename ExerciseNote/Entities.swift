//
//  Entities.swift
//  ExerciseNote
//
//  Created by 신예빈 on 12/1/24.
//

import Foundation

struct InfoDatesEntity: Codable {
    var date_id: Int
    var dates: String
}

struct InfoEntity: Codable {
    var date_id: Int
    var height: Double
    var weight: Double
    var muscle: Double
    var fat: Double
}
