//
//  UserGoals.swift
//  NC2
//
//  Created by Haris Fadhilah on 29/07/22.
//

import SwiftUI

struct UserGoals: View {
    let goals: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.init(UIColor(red: 248/255, green: 200/255, blue: 154/255, alpha: 0.7)))
            .frame(width: 352, height: 110, alignment: .center)
            .padding()
            .overlay(
                Text("I want to be a \(goals)")
                    .frame(width: 350, alignment: .center)
            )
    }
}

struct UserGoals_Previews: PreviewProvider {
    static var previews: some View {
        UserGoals(goals: "iOS Developer")
            .previewLayout(.sizeThatFits)
    }
}
