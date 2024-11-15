import Foundation

struct TaskItem: Codable, Identifiable {
    var id = UUID()
    let title : String
    let descriptionDish: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case descriptionDish = "description"
        case image = "image"
        case category = "category"
    }
}
