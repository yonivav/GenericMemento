//
//  MementoPOCTests.swift
//  MementoPOCTests
//
//  Created by Yoni Vizel on 9/29/20.
//  Copyright © 2020 Yoni Vizel. All rights reserved.
//

import XCTest
@testable import MementoPOC

class MementoPOCTests: XCTestCase {

    func testMementoString() {

        let originator = Originator(state: "Super-duper-super-puper-super.")
        let caretaker = Caretaker(originator: originator)

        caretaker.backup()
        originator.updateState("1")

        caretaker.backup()
        originator.updateState("2")

        caretaker.backup()
        originator.updateState("3")

        print("\n")
        caretaker.showHistory()

        print("\nClient: Now, let's rollback!\n\n")
        caretaker.undo()

        print("\nClient: Once more!\n\n")
        caretaker.undo()
    }

    func testMementoInt() {

        let originator = Originator(state: 0)
        let caretaker = Caretaker(originator: originator)

        caretaker.backup()
        originator.updateState(1)

        caretaker.backup()
        originator.updateState(2)

        caretaker.backup()
        originator.updateState(3)

        print("\n")
        caretaker.showHistory()

        print("\nClient: Now, let's rollback!\n\n")
        caretaker.undo()

        print("\nClient: Once more!\n\n")
        caretaker.undo()
    }
    
    func testMementoUserClass() {

        class User {
            let id: Int
            var name: String
            
            init(id: Int, name: String) {
                self.name = name
                self.id = id
            }
        }
        
        let user = User(id: 123456, name: "Johny Boy")
        
        let originator = Originator(state: user)
        let caretaker = Caretaker(originator: originator)

        caretaker.backup()
        user.name = "Johny Good Boy"
        originator.updateState(user)

        caretaker.backup()
        user.name = "Johny Bad Boy"
        originator.updateState(user)

        caretaker.backup()
        user.name = "Johny VERY Bad Boy"
        originator.updateState(user)

        print("\n")
        caretaker.showHistory()

        print("\nClient: Now, let's rollback!\n\n")
        caretaker.undo()

        print("\nClient: Once more!\n\n")
        caretaker.undo()
    }
    
    func testMementoUserStruct() {

        struct User {
            let id: Int
            var name: String
            
            init(id: Int, name: String) {
                self.name = name
                self.id = id
            }
        }
        
        var user = User(id: 123456, name: "Johny Boy")
        
        let originator = Originator(state: user)
        let caretaker = Caretaker(originator: originator)

        caretaker.backup()
        user.name = "Johny Good Boy"
        originator.updateState(user)

        caretaker.backup()
        user.name = "Johny Bad Boy"
        originator.updateState(user)

        caretaker.backup()
        user.name = "Johny VERY Bad Boy"
        originator.updateState(user)

        print("\n")
        caretaker.showHistory()

        print("\nClient: Now, let's rollback!\n\n")
        caretaker.undo()

        print("\nClient: Once more!\n\n")
        caretaker.undo()
    }
}
