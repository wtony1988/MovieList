//
//  CharacterView.swift
//  BaseProject
//
//  Created by Tony Wang on 4/21/21.
//

import SwiftUI

struct CharacterView: View {
    let character: Character
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: " + character.name)
                .font(.system(size: 16.0, weight: .semibold, design: .default))
            Text("Gender: " + character.gender)
                .font(.system(size: 16.0, weight: .semibold, design: .default))
            Text("Height: " + character.height + "cm")
                .font(.system(size: 16.0, weight: .semibold, design: .default))
            Text("Created: " + character.created.formatted)
                .font(.system(size: 16.0, weight: .semibold, design: .default))
        }
        .padding()
        .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: Character(name: "Unknown", gender: "Unknown", height: "0", created: Date()))
    }
}
