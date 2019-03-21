//
//  File.swift
//  DidliBo
//
//  Created by Jeroen Dunselman on 08/04/2018.
//  Copyright © 2018 Jeroen Dunselman. All rights reserved.
//

import Foundation

class Scales { //NotenumberService
    
    //Present musical scales defined as note numbers
    let numbers = NoteNumbers()
    var scales:[[[Int]]] = [[], [], []]
    
    //Swipe position * number of fingers used requires availability of 12 scales:
    
    //Basic chords for 4 swipe regions:
    //    0: 'Minor', 1: 'Root', 2: 'Fourth' & 3: 'Fifth'
    let numberOfRegions = 4
    //e.g. chords:
    //    0: A minor (E, A, C), notenumbers 17;24;29;
    //    1: C (C, E, G),
    //    2: F (F, C, A) &
    //    3: G (G, B, D).
    
    //Number of fingers swiped needs scales definition for 2 variants to the basic chord,
    //    'VII'th' (two finger swipe, e.g. '7' in 'scaleMjF7') &
    //    'VI'th' (three finger swipe, e.g. '6', 'scaleMnA6').
    //    Handling four finger swipe uses (subtracted notenumbers of existing) Basic definition
    
    //Row index in scales
    var rowIndex: Int
    let basic = 0, variantVII = 1, variantVI = 2
    
    //store notenumber data in scales
    init() {
        
        rowIndex = basic
        var regions = [numbers.scaleMinA,
                       numbers.scaleMajC,
                       numbers.scaleMajF,
                       numbers.scaleMajG ]
        appendNotes(regions: regions)
        
        
        rowIndex = variantVII
        regions = [numbers.scaleMnA7,
                   numbers.scaleMjC7,
                   numbers.scaleMjF7,
                   numbers.scaleMjG7 ]
        
        appendNotes(regions: regions)
        
        
        rowIndex = variantVI
        regions = [numbers.scaleMnA6,
                   numbers.scaleMjC6,
                   numbers.scaleMjF6,
                   numbers.scaleMjG6 ]
        
        appendNotes(regions: regions)
        
    }
    
    func appendNotes(regions: [String]) {
        for scale in regions {
            let noteNumbers:[Int] = scale.components(separatedBy: ";").map {return Int($0)!}
            scales[rowIndex].append(noteNumbers)
        }
    }
    
}

struct NoteNumbers {
    //basic, one finger swipe
    let scaleMinA = "17;24;29;32;36;41;44;48;53;56;60;65;68;72"
    let scaleMajC = "20;24;27;32;36;39;44;48;51;56;60;63;68;72"
    let scaleMajF = "13;17;20;25;29;32;37;41;44;49;53;56;61;65"
    let scaleMajG = "15;19;22;27;31;34;39;43;46;51;55;58;63;67"
    //chord variant type 'VII', two finger swipe
    let scaleMnA7 = "17;24;27;32;36;39;41;44;48;51;56;60;63;65;68;72"
    let scaleMjC7 = "20;24;27;30;32;36;39;42;44;48;51;54;56;60;63;66;68;72"
    let scaleMjF7 = "13;17;20;23;29;32;35;37;41;44;47;53;56;59;61;65"
    let scaleMjG7 = "15;19;22;25;31;34;39;43;46;49;51;55;58;63;67"
    //chord variant type 'VI', three finger swipe
    let scaleMnA6 = "17;24;26;32;36;39;41;44;48;51;56;60;63;65;68;72"
    let scaleMjC6 = "20;24;27;29;32;36;39;41;44;48;51;53;56;60;63;65;68;72"
    let scaleMjF6 = "13;17;20;22;29;32;34;37;41;44;46;53;56;56;61;65"
    let scaleMjG6 = "15;19;22;24;31;34;36;39;43;46;48;51;55;57;63;67"
}
