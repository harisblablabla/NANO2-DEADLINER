//
//  HomePage.swift
//  NC2
//
//  Created by Haris Fadhilah on 26/07/22.
//

import SwiftUI



struct HomePage: View {
    
    let pickerStatus: [String] = ["On Going","Finished"]
    @State private var selectedStatus: String = "On Going"
    @State private var showModal: Bool = false
    
    let toDate = Calendar.current.date(byAdding: .minute, value: 1, to: Date())
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 17/255, green: 59/255, blue: 73/255, alpha: 1)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }

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
                                Text("I want to win MasterChef Competition")
                                    .frame(width: 350, alignment: .center)
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
                    List(0...12, id: \.self) { index in
                        CustomRowView(title: "Swift UI", date: toDate!)
                    }
                    .listStyle(.plain)
                    .padding(.trailing)
                    .background(Color.white.opacity(0.3))
                }
            }
            .primaryNavigation
            .navigationTitle("Hi John")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        
                        showModal.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                }
            }
            .sheet(isPresented: $showModal) {
                ModalAction()
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

private struct CustomRowView: View {
  var title: String
  var date: Date
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.headline)
      Spacer()
      TimerView(setDate: date)
    }
  }
}
