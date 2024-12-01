//
//  Database.swift
//  ExerciseNote
//
//  Created by 신예빈 on 11/30/24.
//

import SQLite3
import Foundation

class DatabaseManager {
    static let shared = DatabaseManager()
    private var database: OpaquePointer?
    
    private let ExerciseTable               = "Exercise"
    private let ExerciseTable_exercise_id   = "exercise_id"
    private let ExerciseTable_name          = "name"
    private let ExerciseTable_target        = "target"
    
    private let ExerciseDateTable           = "ExerciseDate"
    private let ExerciseDateTable_date_id   = "date_id"
    private let ExerciseDateTable_dates     = "dates"
    
    private let ExerciseSetTable              = "ExerciseSet"
    private let ExerciseSetTable_set_id       = "set_id"
    private let ExerciseSetTable_date_id      = "date_id"
    private let ExerciseSetTable_exercise_id  = "exercise_id"
    private let ExerciseSetTable_ordered      = "ordered"
    
    private let ExerciseAmountTable         = "ExerciseAmount"
    private let ExerciseAmountTable_set_id  = "set_id"
    private let ExerciseAmountTable_number  = "number"
    private let ExerciseAmountTable_second  = "second"
    private let ExerciseAmountTable_weight  = "weight"
    private let ExerciseAmountTable_ordered = "ordered"
    
    private let RoutineTable                = "Routine"
    private let RoutineTable_routine_id     = "routine_id"
    private let RoutineTable_name           = "name"
    
    private let RoutineExerciseTable             = "RoutineExercise"
    private let RoutineExerciseTable_routine_id  = "routine_id"
    private let RoutineExerciseTable_exercise_id = "exercise_id"
    private let RoutineExerciseTable_number      = "number"
    private let RoutineExerciseTable_weight      = "weight"
    private let RoutineExerciseTable_ordered     = "ordered"
    
    private let InfoDateTable               = "InfoDate"
    private let InfoDateTable_date_id       = "date_id"
    private let InfoDateTable_dates         = "dates"
    
    private let InfoTable                   = "Info"
    private let InfoTable_date_id           = "date_id"
    private let InfoTable_height            = "height"
    private let InfoTable_weight            = "weight"
    private let InfoTable_muscle            = "muscle"
    private let InfoTable_fat               = "fat"
    
    init() {
        openDatabase()
    }
    
    func getDatabasePath() -> String {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        guard let documentsDirectory = urls.first else {
            fatalError("Unable to access documents directory")
        }
        let databasePath = documentsDirectory.appendingPathComponent("database.sqlite").path
        print("Database path: \(databasePath)")
        return databasePath
    }
        
    private func openDatabase() {
        let fileURL = try! FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("ExerciseDB.sqlite")
       
        if sqlite3_open(fileURL.path, &database) == SQLITE_OK {
            print("Successfully opened connection to database at \(fileURL.path)")
        } else {
            print("Unable to open database.")
        }
        
        if isFirstLaunch() {
            createTables()
            markAsLaunched()
            print("launch")
        }
    }
    
    private func isFirstLaunch() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isDatabaseInitialized")
    }
    
    private func markAsLaunched() {
        UserDefaults.standard.set(true, forKey: "isDatabaseInitialized")
    }
    
    private func createTables() {
        
        let createTableQuery = """
            CREATE TABLE \(ExerciseTable)
            (
                \(ExerciseTable_exercise_id)  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
                \(ExerciseTable_name)         TEXT    NOT NULL,
                \(ExerciseTable_target)       TEXT    NOT NULL
            );

            CREATE TABLE \(ExerciseDateTable) (
                \(ExerciseDateTable_date_id) INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
                \(ExerciseDateTable_dates)   DATE    NOT NULL
            );

            CREATE TABLE \(ExerciseSetTable) (
                \(ExerciseSetTable_set_id)       INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
                \(ExerciseSetTable_date_id)      INTEGER NOT NULL,
                \(ExerciseSetTable_exercise_id)  INTEGER NOT NULL,
                \(ExerciseSetTable_ordered)      INTEGER NOT NULL,
                
                 FOREIGN KEY (\(ExerciseSetTable_exercise_id)) REFERENCES \(ExerciseTable)(\(ExerciseTable_exercise_id))
                 ON UPDATE RESTRICT,
                FOREIGN KEY (\(ExerciseSetTable_date_id)) REFERENCES \(ExerciseDateTable)(\(ExerciseDateTable_date_id))
                 ON DELETE RESTRICT
            );

            CREATE TABLE \(ExerciseAmountTable) (
                \(ExerciseAmountTable_set_id)  INTEGER NOT NULL,
                \(ExerciseAmountTable_number)  INTEGER NOT NULL,
                \(ExerciseAmountTable_second)  INTEGER NOT NULL,
                \(ExerciseAmountTable_weight)  INTEGER NOT NULL,
                \(ExerciseAmountTable_ordered) INTEGER NOT NULL,
              
                 FOREIGN KEY (\(ExerciseAmountTable_set_id)) REFERENCES \(ExerciseSetTable)(\(ExerciseSetTable_set_id))
                 ON UPDATE RESTRICT
            );

            CREATE TABLE \(RoutineTable)
            (
                \(RoutineTable_routine_id)  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
                \(RoutineTable_name)        TEXT    NOT NULL
            );

            CREATE TABLE \(RoutineExerciseTable)
            (
                \(RoutineExerciseTable_routine_id)   INTEGER NOT NULL,
                \(RoutineExerciseTable_exercise_id)  INTEGER NOT NULL,
                \(RoutineExerciseTable_number)       INTEGER NOT NULL,
                \(RoutineExerciseTable_weight)       INTEGER NOT NULL,
                \(RoutineExerciseTable_ordered)      INTEGER NOT NULL,
              
                 FOREIGN KEY (\(RoutineExerciseTable_routine_id)) REFERENCES \(RoutineTable)(\(RoutineTable_routine_id))
                 ON DELETE RESTRICT,
                 FOREIGN KEY (\(RoutineExerciseTable_exercise_id)) REFERENCES \(ExerciseTable)(\(ExerciseTable_exercise_id))
                 ON UPDATE RESTRICT
            );

            CREATE TABLE \(InfoDateTable)
            (
                \(InfoDateTable_date_id)  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
                \(InfoDateTable_dates)    DATE    NOT NULL
            );

            CREATE TABLE \(InfoTable)
            (
                \(InfoTable_date_id)  INTEGER  NOT NULL,
                \(InfoTable_height)   DOUBLE    NOT NULL,
                \(InfoTable_weight)   DOUBLE    NOT NULL,
                \(InfoTable_muscle)   DOUBLE    NOT NULL,
                \(InfoTable_fat)      DOUBLE    NOT NULL,
             
                FOREIGN KEY (\(InfoTable_date_id)) REFERENCES \(InfoDateTable)(\(InfoDateTable_date_id))
                ON DELETE RESTRICT
            );
            """
        
        var errorMessage: UnsafeMutablePointer<Int8>? = nil
        if sqlite3_exec(database, createTableQuery, nil, nil, &errorMessage) != SQLITE_OK {
            let error = String(cString: sqlite3_errmsg(database))
            print("Failed to execute SQL: \(error)")
        } else {
            print("SQL create successfully.")
        }
    }
    
    public func InsertInfoDates(date: String) {
        let insertQuery = """
            INSERT INTO \(InfoDateTable) (\(InfoDateTable_dates))
            VALUES ('\(date)');
        """
        var statement: OpaquePointer? = nil

        if sqlite3_prepare_v2(self.database, insertQuery, -1, &statement, nil) == SQLITE_OK {
            print("Binding data: \(date)")
        } else {
            print("SQLite prepare failure: \(String(cString: sqlite3_errmsg(self.database)))")
            return
        }

        if sqlite3_step(statement) == SQLITE_DONE {
            print("SQLite insertion success")
        } else {
            print("SQLite step failure: \(String(cString: sqlite3_errmsg(self.database)))")
        }

        sqlite3_finalize(statement) // 메모리 해제
    }

    
    public func SelectInfoDates(date: String?) -> [InfoDatesEntity] {
        var query = ""
        var statement: OpaquePointer? = nil
        var result: [InfoDatesEntity] = []

        if date == nil {
            query = """
                SELECT *
                FROM \(InfoDateTable);
            """
        } else {
            query = """
                SELECT *
                FROM \(InfoDateTable)
                WHERE \(InfoDateTable_dates) = ?;
            """
        }

        if sqlite3_prepare_v2(self.database, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(self.database)!)
            print("Error while preparing: \(errorMessage)")
            return result
        }

        if let date = date {
            sqlite3_bind_text(statement, 1, date, -1, nil) // 날짜 값 바인딩
            print("Binding date for query: \(date)")
        }

        while sqlite3_step(statement) == SQLITE_ROW {
            let id = sqlite3_column_int(statement, 0) // 0번째 열
            guard let cString = sqlite3_column_text(statement, 1) else {
                print("Failed to read dates column")
                continue
            }
            let dates = String(cString: cString) // 1번째 열
            print("Retrieved dates: \(dates)")
            result.append(InfoDatesEntity(date_id: Int(id), dates: dates))
        }

        sqlite3_finalize(statement) // 메모리 해제
        return result
    }

    public func InsertInfo(id: Int, height: Double, weight: Double, muscle: Double, fat: Double) {
        let insertQuery = """
            INSERT INTO \(InfoTable) (\(InfoTable_date_id), \(InfoTable_height), \(InfoTable_weight), \(InfoTable_muscle), \(InfoTable_fat))
            VALUES (\(id), \(height), \(weight), \(muscle), \(fat));
        """
        var statement: OpaquePointer? = nil

        if sqlite3_prepare_v2(self.database, insertQuery, -1, &statement, nil) == SQLITE_OK {

        } else {
            print("SQLite prepare failure: \(String(cString: sqlite3_errmsg(self.database)))")
            return
        }

        if sqlite3_step(statement) == SQLITE_DONE {
            print("SQLite insertion success")
        } else {
            print("SQLite step failure: \(String(cString: sqlite3_errmsg(self.database)))")
        }

        sqlite3_finalize(statement) // 메모리 해제
    }

    
    public func SelectInfo(id: Int?) -> [InfoEntity] {
       
        var query = ""
        if id == nil {
            query = """
                SELECT *
                FROM \(InfoTable);
            """
        }
        else {
            query = """
                SELECT *
                FROM \(InfoTable)
                WHERE \(InfoTable_date_id) = \(id!);
            """
        }
        var statement: OpaquePointer? = nil
        var result: [InfoEntity] = []

        if sqlite3_prepare_v2(self.database, query, -1, &statement, nil) != SQLITE_OK {
            let errorMessage = String(cString: sqlite3_errmsg(self.database)!)
            print("Error while preparing: \(errorMessage)")
            return result
        }

        while sqlite3_step(statement) == SQLITE_ROW {
            let id = sqlite3_column_int(statement, 0) // 0번째 열
            let height = sqlite3_column_double(statement, 1)
            let weight = sqlite3_column_double(statement, 2)
            let muscle = sqlite3_column_double(statement, 3)
            let fat = sqlite3_column_double(statement, 4)
            
            result.append(InfoEntity(date_id: Int(id), height: height, weight: weight, muscle: muscle, fat: fat))
        }

        sqlite3_finalize(statement) // 메모리 해제
        return result
    }
}
