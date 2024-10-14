//
//  PersistenceManager.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 13/10/24.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys { static let favarites = "favarites" }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void){
        retriveFavarites { result in
            switch result {
            case .success(var favorites):
                switch actionType  {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreadyFavorites)
                        return
                    }
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll() { $0.login == favorite.login }
                }
                completed(save(favorates: favorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retriveFavarites(completed: @escaping(Result<[Follower], GFError>) -> Void) {
        guard let favariteData = defaults.object(forKey: Keys.favarites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorates = try decoder.decode([Follower].self, from: favariteData)
            completed(.success(favorates))
        } catch {
            completed(.failure(.unableToFavorates))
        }
    }
    
    static func save(favorates: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encoderfavorates = try encoder.encode(favorates)
            defaults.set(encoderfavorates, forKey: Keys.favarites)
            return nil
        } catch {
            return .unableToFavorates
        }
    }
}
