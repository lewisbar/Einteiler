//
//  Person.swift
//  Einteiler
//
//  Created by Lennart Wisbar on 02.01.17.
//  Copyright © 2017 Lennart Wisbar. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible, Comparable {
    var name: String
    var jobs: [String]
    var dates: [String]
    var desiredFrequency: Float
    var description: String {
        return name
    }
    
    init(name: String = "Neue Person",
        withJobs jobs: [String] = [],
        dates: [String] = [],
        andDesiredFrequency desiredFrequency: Float = 0) {
        
        self.name = name
        self.jobs = jobs
        self.dates = dates
        self.desiredFrequency = desiredFrequency
    }
    
    // Comparable
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.name.localizedCaseInsensitiveCompare(rhs.name) == ComparisonResult.orderedAscending
    } // Man könnte auch einfach mit < sortieren, aber so ist es noch besser. Sonst kämen z.B. Kleinbuchstaben ganz am Ende, d.h. "alfred" käme nach "Zippo".
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
            && lhs.jobs == rhs.jobs
            && lhs.dates == rhs.dates
            && lhs.desiredFrequency == rhs.desiredFrequency
    }
    
    ///
    
}
