import Foundation

struct ToDo: Equatable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isComplete: Bool, dueDate: Date,
           notes: String?) {
            self.id = UUID()
            self.title = title
            self.isComplete = isComplete
            self.dueDate = dueDate
            self.notes = notes
        }
    
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
            return lhs.id == rhs.id
        }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("toDos").appendingPathExtension("plist")
    
    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        
        let codedTodos = try? propertyListEncoder.encode(toDos)
        
        try? codedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadToDos() -> [ToDo]?  {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else { return nil }
        
        let propertyListDecoder = PropertyListDecoder()
        
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
}
