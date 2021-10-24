//
//  ViewController.swift
//  Einteiler
//
//  Created by Lennart Wisbar on 07.12.16.
//  Copyright © 2016 Lennart Wisbar. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO:
        // - Datenbank mit Testmaterial füllen
        // - Testergebnis ausgeben
        let brain = Brain()
        brain.dates = ["1", "2", "3", "4", "5", "6"]
        brain.jobs = ["Leitung", "Cajon", "Bass", "Gesang"]
        
        brain.add(person: Person(name: "Lenni", withJobs: ["Leitung", "Cajon", "Bass"], dates: [brain.dates[0], brain.dates[1], brain.dates[2], brain.dates[3], brain.dates[4], brain.dates[5]], andDesiredFrequency: 5))
        brain.add(person: Person(name: "Timmi", withJobs: ["Leitung"], dates: [brain.dates[0], brain.dates[1], brain.dates[2], brain.dates[3], brain.dates[4], brain.dates[5]], andDesiredFrequency: 3))
        brain.add(person: Person(name: "Bain", withJobs: ["Cajon"], dates: [brain.dates[0], brain.dates[1], brain.dates[2], brain.dates[3], brain.dates[4], brain.dates[5]], andDesiredFrequency: 3))
        brain.add(person: Person(name: "Andrea", withJobs: ["Cajon"], dates: [brain.dates[0], brain.dates[1], brain.dates[2], brain.dates[3], brain.dates[4], brain.dates[5]], andDesiredFrequency: 3))
        brain.add(person: Person(name: "Karo", withJobs: ["Gesang"], dates: [brain.dates[0], brain.dates[1], brain.dates[2], brain.dates[3], brain.dates[4], brain.dates[5]], andDesiredFrequency: 3))
        brain.add(person: Person(name: "Peter", withJobs: ["Bass"], dates: [brain.dates[0], brain.dates[1], brain.dates[2], brain.dates[3], brain.dates[4], brain.dates[5]], andDesiredFrequency: 4))
        print(brain.people)
        brain.startAssignment()
        print(brain.assignmentAsString(assignment: brain.assignmentList))
//        print("\n---------\n")
//        print(brain.assignmentList)
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

