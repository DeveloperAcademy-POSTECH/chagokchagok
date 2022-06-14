struct Country {
    let name: String
    let category: String
}

extension Country {
    static func all() -> [Country] {
        return [
            Country(name: "🇰🇷 Korea", category: "1"),
            Country(name: "🇯🇵 Japan", category: "1"),
            Country(name: "🇨🇳 China", category: "2"),
            Country(name: "🇮🇩 Indonesia", category: "2"),
            Country(name: "🇲🇾 Malaysia", category: "3")
        ]
    }
}
