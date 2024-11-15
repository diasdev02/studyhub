import Foundation

struct TaskItem: Codable, Identifiable {
    var id = UUID()
    let title : String
    let descriptionTask: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case descriptionTask = "description"
        case image = "image"
        case category = "category"
    }
}
