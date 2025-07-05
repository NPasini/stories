//
//  storiesApp.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import SwiftUI

@main
struct storiesApp: App {
    private let userDefaults: UserDefaults
    private let jsonReader: JsonReaderProtocol
    private let httpClient: URLSessionHTTPClient
    
    var body: some Scene {
        WindowGroup {
            assembleStoriesListPage()
        }
    }
    
    init() {
        jsonReader = JsonReader()
        httpClient = URLSessionHTTPClient()
        userDefaults = UserDefaults(suiteName: "story.storage")!
    }
}

private extension storiesApp {
    func assembleStoriesListPage() -> AnyView {
        let assembler = StoriesListAssembler(
            userDefaults: userDefaults,
            httpClient: httpClient,
            jsonReader: jsonReader
        )
        return assembler.assemble()
    }
}
