import Foundation

struct DataUsers: Decodable, Hashable {
    var data: Users?
}

struct Users: Decodable, Hashable {
    var users: [Doctor]?
}

struct Doctor: Decodable, Hashable {
    let firstName: String?
    let patronymic: String?
    let lastName: String?
    let specialization: [DoctorSpecilization]?
    let textChatPrice: Int?
    let videoChatPrice: Int?
    let homePrice: Int?
    let avatar: String?
    let rank: Int?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case patronymic
        case lastName = "last_name"
        case specialization
        case textChatPrice = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case homePrice = "home_price"
        case avatar
        case rank
    }
}

struct DoctorSpecilization: Decodable, Hashable {
    var name: String?
}
