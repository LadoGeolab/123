//
//  main.swift
//  oop2
//
//  Created by Ladolado3911 on 11/20/20.
//

import Foundation

enum Faculty: CaseIterable {
    case Computer_science
    case Law
    case Business
    case Construction_engineering
    case Electrical_engineering
}

enum Subject {
    case Math
    case Swift
    case History
    case Architecture
    case Physics
    case Calculus
    case DataScience
    case Statistics
    case Materials
    case CAD
    case Chemistry
    case OOP
}



struct Scores {
    var subject_name: Subject
    var activity_score: Double
    var midterm_score: Double
    var final_score: Double
}

struct WeekDay {
   var subject: Subject
   var faculty: Faculty
   var start_date: String
   var end_date: String
   var room_id: String
    
}




struct Table {
    var monday = "Monday"
    var tuesday = "Tuesday"
    var wednesday = "Wednesday"
    var thursday = "Thursday"
    var friday = "Friday"
    var saturday = "Saturday"
    var sunday = "Sunday"
}




class University {
    var name: String
    let year_founded: Int
    var students_arr: Array<Student> = []
    var lecturers_arr: Array<Lecturer> = []
    var faculties_arr: Array<Faculty> = Faculty.allCases.compactMap { $0 }
    
    
    init(name name1: String, year founded: Int) {
        self.name = name1
        self.year_founded = founded
    }
    
    
}

class Student {
    var first_name: String
    var last_name: String
    var faculty: Faculty
    var id: Int
    
    
    var year_enrolled: Int
    var scores_arr: Array<Scores> = []
    
    
    init(first name1: String, last name2: String, faculty fac: Faculty, enrolled year: Int, id id1: Int) {
        self.first_name = name1
        self.last_name = name2
        self.faculty = fac
        self.year_enrolled = year
        self.id = id1
    }
  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func study_length(now current: Int) -> Int {
        let length = current - self.year_enrolled
        return length
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func get_student_info() -> (firstName: String, lastName: String) {
        let first = self.first_name
        let second = self.last_name
        
        return (first, second)
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func get_student_birthdate(inital_Age: Int = 18, current year: Int) -> Int {
        let length = study_length(now: year)
        let birthdate = year - length - 18
        
        return birthdate
    }
 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func get_subj_arr_where_89() -> [Subject] {

        let temp = self.scores_arr.filter() {$0.final_score > 89}
        let result = temp.map() { $0.subject_name }
        
        return result
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func get_subj_arr_where_failed() -> [Subject] {

        let temp = self.scores_arr.filter() {$0.final_score < 51}
        let result = temp.map() { $0.subject_name }
        
        return result
    }
        
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
    func get_subj_arr_where_failed2() -> [Subject] {

        let temp = self.scores_arr.filter() {$0.final_score < 51 && $0.final_score > 20}
        let result = temp.map() { $0.subject_name }
        
        return result
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func most_active_in() -> Subject {
        
        let temp = self.scores_arr.map() { $0.activity_score }
        let max = temp.max()!
        
        let temp2 = self.scores_arr.filter() { $0.activity_score == max }
        
        let result = temp2[0].subject_name
        
        return result
        
    }

}


class Lecturer {
    var first_name: String
    var last_name: String
    var faculty: Faculty
    
    
    var id: String
    var subjects_arr: Array<String> = []
    var table: Table
    
    init(first name1: String, last name2: String, faculty fac: Faculty, id id1: String, table table1: Table) {
        self.first_name = name1
        self.last_name = name2
        self.faculty = fac
        self.id = id1
        self.table = table1
    }
}
