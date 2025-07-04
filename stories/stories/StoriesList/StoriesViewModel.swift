//
//  StoriesViewModel.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

class StoriesViewModel: ObservableObject {
    @Published var stories: [Story] = []
    
    private var isLoading = false
    private let repository: StoriesRepositoryProtocol
    
    init(repository: StoriesRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadMoreStories() {
        guard !isLoading else { return }
        isLoading = true
        
        Task {
            let newStories = await repository.loadMoreStories()
            stories.append(contentsOf: newStories)
            isLoading = false
        }
    }
}
