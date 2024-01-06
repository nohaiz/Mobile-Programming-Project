import Foundation

class Services: Codable {
    var id: UUID
    var name: String
    var price: Double
    var description: String
    var isFastingRequired: Bool
    var isPromoted: Bool
    var isRecent: Bool {
        didSet {
            // Here you can add any code that needs to be executed when isNewDate changes.
            // For example, you might want to check if the date is within a certain range
            // to determine if the service is considered "new".
        }
    }
    var popularityScore: Int // Higher values indicate more popularity
    var date: Date
    var hospitalName: String

    init(name: String, price: Double, description: String, isFastingRequired: Bool, isPromoted: Bool, isRecent: Bool, popularityScore: Int, date: Date, hospitalName: String) {
        self.name = name
        self.price = price
        self.description = description
        self.isFastingRequired = isFastingRequired
        self.isPromoted = isPromoted
        self.isRecent = isRecent
        self.popularityScore = popularityScore
        self.date = date
        self.hospitalName = hospitalName
        self.id = UUID()
    }

    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        self.id = try container.decode(UUID.self)
        self.name = try container.decode(String.self)
        self.price = try container.decode(Double.self)
        self.description = try container.decode(String.self)
        self.isFastingRequired = try container.decode(Bool.self)
        self.isPromoted = try container.decode(Bool.self)
        self.isRecent = try container.decode(Bool.self)
        self.popularityScore = try container.decode(Int.self)
        // Decode the additional attributes
        self.date = try container.decode(Date.self)
        self.hospitalName = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()

        try container.encode(id)
        try container.encode(name)
        try container.encode(price)
        try container.encode(description)
        try container.encode(isFastingRequired)
        try container.encode(isPromoted)
        try container.encode(isRecent)
        try container.encode(popularityScore)
        // Encode the additional attributes
        try container.encode(date)
        try container.encode(hospitalName)
    }
}
