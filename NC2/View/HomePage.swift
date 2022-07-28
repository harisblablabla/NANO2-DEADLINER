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
    
    @StateObject var vm = ActionPlanViewModel()
    
    let toDate = Calendar.current.date(byAdding: .day, value: 30, to: Date())
    
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
                        UserGoals(goals: "MasterChef Winner")
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
                        List(vm.savedEntities, id: \.self) { entity in
                            CustomRowView(title: entity.topic ?? "Still Empty", date: entity.time ?? toDate!)
                        }
                        .listStyle(.plain)
                        .padding(.trailing)
                        .background(Color.white.opacity(0.3))
                    }
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
