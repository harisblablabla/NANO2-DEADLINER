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
    @State private var timePicker: String = ""

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
                            //dasdad
                        } header: {
                            Text("Time to finish the topic")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        
                    }
                    Spacer()
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
                        print(topic, description)
                    } label: {
                        Text("Save")
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
