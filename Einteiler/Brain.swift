//
//  Brain.swift
//  Einteiler
//
//  Created by Lennart Wisbar on 02.01.17.
//  Copyright © 2017 Lennart Wisbar. All rights reserved.
//

import Foundation

// TODO: Was, wenn zu wenig Leute da sind, um alles zu besetzen? Gleichmäßig verteilen. Vielleicht mit Platzhalter-Personen?

class Brain {
    var people: [Person]
    var jobs: [String]
    var dates: [String]
    typealias Job = String
    typealias Date = String
    var remainingDesiredFrequencies: [Float] = [] // Diese beiden evtl.
    var remainingDateCounts: [Int] = []          // nicht als properties, sondern nur in den Methoden weitergeben.
    var assignmentList: [[Person]] = []
    
    init(withPeople people: [Person] = [],
        andJobs jobs: [String] = [],
        andDates dates: [String] = []) {
        
        self.people = people
        self.jobs = jobs
        self.dates = dates
    }
    
    func add(person: Person) {
        people.append(person)
        people.sort()
    }
    
    func add(job: Job) {
        jobs.append(job)
    }
    
    func add(date: Date) {
        dates.append(date)
    }

    func startAssignment() {
        prepareRemainingDesiredFrequencies()
        prepareRemainingDateCounts()
        for date in dates {
            assignmentList.append([])
            assignJobs(at: date)
        }
    }
    
    func assignJobs(at date: Date) {
        for job in jobs {
            let availablePeople = filterPeopleByAvailability(at: date, for: job)
            if let person = findBestMatch(at: date, for: job, of: availablePeople) {
                assignmentList[dates.index(of:date)!].append(person)
                remainingDesiredFrequencies[people.index(of: person)!] -= 1
                remainingDateCounts[people.index(of: person)!] -= 1
            } else {
                // Platzhalter einfügen?
            }
        }
    }
    
    func filterPeopleByAvailability(at date: Date, for job: Job) -> [Person] {
        var availablePeople: [Person] = []
        for person in people {
            guard person.dates.contains(date)          // TODO: Nicht 2x am selben Datum
                && person.jobs.contains(job)
                && remainingDesiredFrequencies[people.index(of: person)!] > 0 else {
                    continue
            }
            availablePeople.append(person)
        }
        return availablePeople
    }
    
    func findBestMatch(at date: Date, for job: Job, of availablePeople: [Person]) -> Person? {
        var bestMatch: Person?
        var bestRating: Float = 0
        var rating: Float = 0
        
        for person in availablePeople {
            rating = remainingDesiredFrequency(for: person) / Float(remainingDateCount(for: person))
            print(person, terminator: "s Rating: \(rating)\n")
            if rating > bestRating {
                bestRating = rating
                bestMatch = person
            }
        }
        
        return bestMatch
    }
    
    func prepareRemainingDesiredFrequencies() {
        var frequency: Float = 0.0
        for person in people {
            if person.desiredFrequency > Float(person.dates.count) {
                frequency = Float(person.dates.count)
            } else {
                frequency = person.desiredFrequency
            }
            remainingDesiredFrequencies.append(frequency)
        }
    }
    
    func prepareRemainingDateCounts(){
        for person in people {
            remainingDateCounts.append(person.dates.count)
        }
    }
    
    func remainingDesiredFrequency(for person: Person) -> Float {
        return remainingDesiredFrequencies[people.index(of: person)!]
    }
    
    func remainingDateCount(for person: Person) -> Int {
        return remainingDateCounts[people.index(of: person)!]
    }
    
    func assignmentAsString(assignment: [[Person]]) -> String {
        var assignmentString = ""
        var dateAssignmentIndex = 0
        for dateAssignment in assignment {
            assignmentString += dates[dateAssignmentIndex] + "\n"
            var personIndex = 0
            for person in dateAssignment {
                assignmentString +=  jobs[personIndex] + ": "
                assignmentString += person.name + "\n"
                personIndex += 1
            }
            assignmentString += "\n"
            dateAssignmentIndex += 1
        }
        return assignmentString
    }
}
