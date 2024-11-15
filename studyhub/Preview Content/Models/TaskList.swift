import CoreData
import Foundation

struct TaskList: Codable {
    let menu: [TaskItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    let tasksJSONS: String = """
      "menu": [
        {
          "id": 1,
          "title": "Greek Salad",
          "description": "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.",
          "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true",
          "category": "starters"
        },
        {
          "id": 2,
          "title": "Lemon Desert",
          "description": "Traditional homemade Italian Lemon Ricotta Cake.",
          "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/lemonDessert%202.jpg?raw=true",
          "category": "desserts"
        },
        {
          "id": 3,
          "title": "Grilled Fish",
          "description": "Our Bruschetta is made from grilled bread that has been smeared with garlic and seasoned with salt and olive oil.",
          "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/grilledFish.jpg?raw=true",
          "category": "mains"
        },
        {
          "id": 4,
          "title": "Pasta",
          "description": "Penne with fried aubergines, cherry tomatoes, tomato sauce, fresh chilli, garlic, basil & salted ricotta cheese.",
          "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/pasta.jpg?raw=true",
          "category": "mains"
        },
        {
          "id": 5,
          "title": "Bruschetta",
          "description": "Oven-baked bruschetta stuffed with tomatos and herbs.",
          "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/bruschetta.jpg?raw=true",
          "category": "starters"
        }
      ]
    """
    struct Challenge: Decodable {
        let id: Int
        let title: String
        let description: String
        let image: String
        let category: String
    }
    static func getMenuData(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()
        
        let url = URL(string: "http://localhost:3000/menu")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let decoder = JSONDecoder()
        
    }
}
