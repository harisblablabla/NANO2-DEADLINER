//
//  ActionPlanViewModel.swift
//  NC2
//
//  Created by Haris Fadhilah on 28/07/22.
//

import Foundation
import CoreData

class ActionPlanViewModel: ObservableObject {
//    var topic: String = ""
    
    let persistentContainer: NSPersistentContainer
    @Published var savedEntities: [ActionPlanEntity] = []
    
    init() {
        persistentContainer = NSPersistentContainer(name: "NC2Container")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize core data stack \(error)")
            }
        }
        fetchActionPlan()
    }
    
    func fetchActionPlan() {
        let request = NSFetchRequest<ActionPlanEntity>(entityName: "ActionPlanEntity")
        
        do {
            savedEntities = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching: \(error)")
        }
    }
    
    func addActionPlan(plan: String, description: String, date: Date) {
        let newActionPlan = ActionPlanEntity(context: persistentContainer.viewContext)
        newActionPlan.topic = plan
        newActionPlan.desc = description
        newActionPlan.time = date
        newActionPlan.status = true
        newActionPlan.id = UUID()
        saveData()
    }
    
    func saveData() {
        do {
            try persistentContainer.viewContext.save()
            fetchActionPlan()
        } catch let error {
            print("Error in Saving \(error)")
        }
    }
}
