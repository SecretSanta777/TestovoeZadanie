import Foundation

struct DataUsers: Decodable, Hashable {
    var data: Users?
}

struct Users: Decodable, Hashable {
    var users: [Doctor]?
}

struct Doctor: Decodable, Hashable {
    var first_name: String?
    var patronymic: String?
    var last_name: String?
    var specialization: [DoctorSpecilization]?
    var text_chat_price: Int?
    var video_chat_price: Int?
    var home_price: Int?
    var avatar: String?
    var rank: Int?
}

struct DoctorSpecilization: Decodable, Hashable {
    var name: String?
}
