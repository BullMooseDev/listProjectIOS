import Foundation

struct ToDo: Equatable {
    var id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
            return lhs.id == rhs.id
        }
    
    static func loadToDos() -> [ToDo]?  {
        let toDo1 = ToDo(title: "title one", isComplete: false, dueDate: Date())
        let toDo2 = ToDo(title: "title two", isComplete: false, dueDate: Date())
        let toDo3 = ToDo(title: "title three", isComplete: false, dueDate: Date())
        
        return [toDo1, toDo2, toDo3]
    }
}
