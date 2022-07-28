//
//  ModalAction.swift
//  NC2
//
//  Created by Haris Fadhilah on 27/07/22.
//

import SwiftUI

struct ModalAction: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var topic: String = ""
    @State private var description: String = ""
    @State private var currentDays: Int = 1

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Form {
                        Section {
                            TextField("", text: $topic)
                        } header: {
                            Text("Topic")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        Section {
                            TextEditor(text: $description)
                                .frame(height: 100)
                        } header: {
                            Text("Description")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        Section {
//                            TimerView(setDate: toDate)
                            HStack {
                                Text("Days:   ")
                                Picker("Days Picker", selection: $currentDays, content: {
                                    ForEach(0..<30, content: { index in
                                        Text("\(index+1)").tag(index+1)
                                    })
                                })
                                .frame(width: 250)
                                .clipped()
                                .pickerStyle(.wheel)
                            }
                        } header: {
                            Text("Time to finish the topic")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        
                    }
//                    Spacer()
                }
            }
            .primaryNavigation
            .navigationTitle("Action Plan")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                            .resizable()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        let toDate = Calendar.current.date(byAdding: .day, value: currentDays, to: Date())
                        print(topic, description, toDate!)
                    } label: {
                        Text("Save")
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct ModalAction_Previews: PreviewProvider {
    static var previews: some View {
        ModalAction()
    }
}
