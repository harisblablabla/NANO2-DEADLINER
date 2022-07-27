//
//  HomePage.swift
//  NC2
//
//  Created by Haris Fadhilah on 26/07/22.
//

import SwiftUI



struct HomePage: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 17/255, green: 59/255, blue: 73/255, alpha: 1)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    let pickerStatus: [String] = ["On Going","Finished"]
    @State private var selectedStatus: String = "On Going"

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Section {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.init(UIColor(red: 248/255, green: 200/255, blue: 154/255, alpha: 0.7)))
                            .frame(width: 352, height: 110, alignment: .center)
                            .padding()
                            .overlay(
                                Text("I want to be a star")
                            )
                    }
                    Section {
                        Text("Action Plan")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        Picker("Change Status", selection: $selectedStatus) {
                            ForEach(pickerStatus, id: \.self) {
                                Text($0).tag(pickerStatus.firstIndex(of: $0)!)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding()
                    }
                }
            }
            .primaryNavigation
            .navigationTitle("Hi John")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        print("mancay")
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
