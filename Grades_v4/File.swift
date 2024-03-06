//
//  File.swift
//  Grades_v4
//
//  Created by Etienne Hüttl on 02.03.24.
//

import Foundation
import SwiftUI

class testspeicher: Hashable{
    static func == (lhs: testspeicher, rhs: testspeicher) -> Bool {
        return lhs.datum_geschrieben == rhs.datum_geschrieben && lhs.note == rhs.note && lhs.testart == rhs.testart
    }
    
    
    
    var datum_geschrieben: Int
    var note: Double
    var testart: testarten
    let id = UUID()
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    
    init(datum_geschrieben: Int, note: Double, testart: testarten) {
        self.datum_geschrieben = datum_geschrieben
        self.note = note
        self.testart = testart
    }
    
    
}

class Fachspeicher: Hashable{
    static func == (lhs: Fachspeicher, rhs: Fachspeicher) -> Bool {
        return lhs.tests == rhs.tests && lhs.color == rhs.color && lhs.name == rhs.name
    }
    
    var tests: [testspeicher]
    var color: Color
    var name: String
    var lehrer: String
    var raum: String
    var gewichtung: Float
    let id = UUID()
    
    init(tests: [testspeicher], color: Color, name: String, lehrer: String, raum: String, gewichtung: Float) {
        self.tests = tests
        self.color = color
        self.name = name
        self.lehrer = lehrer
        self.raum = raum
        self.gewichtung = gewichtung
    }
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}


class storageclass: ObservableObject{
    @Published var activeview: viewcase = .schuljahr
    @Published var fächer: [Fachspeicher] = [Fachspeicher(tests: [testspeicher(datum_geschrieben: 1, note: 2, testart: .klassenarbeit), testspeicher(datum_geschrieben: 1, note: 1, testart: .klassenarbeit)], color: .blue, name: "Mathe", lehrer: "Herr MEinkön", raum: "131", gewichtung: 1)]
    @Published var addfach: Bool = false
}

 
enum testarten: Hashable{
    case hü, klassenarbeit, voctest, epo
}

func gettestartenString(testart: testarten) -> String{
    switch testart {
    case .hü:
        return "HÜ"
    case .klassenarbeit:
        return "Klassenarbeit"
    case .voctest:
        return "Vocabeltest"
    case .epo:
        return "Epochal"
    }
}

enum viewcase{
    case schuljahr, fach
}
