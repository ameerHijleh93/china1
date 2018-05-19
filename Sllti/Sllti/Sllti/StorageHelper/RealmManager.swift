//
//  RealmManager.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//



import Foundation
import RealmSwift
import Realm

class RealmManager{
    static let Shared = RealmManager()
    
    func migration(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            schemaVersion: 27,
            migrationBlock: { migration, oldSchemaVersion in
        })
    }
    
    func getObject(_ ofType: Object.Type) -> Results<Object> {
        do {
            let realm = try Realm()
            return realm.objects(ofType)  //as! Results<T>
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    func getObjects(_ ofType: Object.Type) -> [Object] {
        do {
            let realm = try Realm()
            let objs = realm.objects(ofType).toArray(type: ofType)
            return objs
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    func isEmpty<T>(_ ofType: T.Type) ->Bool {
        do {
            
            let realm = try Realm()
            if realm.objects(T.self as! Object.Type).isEmpty{
                return true
            }
            return false
        } catch let error as NSError {
            print(error.description)
            return true
        }
    }
    
    func getById<T>(_ ofType: T.Type,predicate:String) -> Results<T> {
        do {
            let realm = try Realm()
            return realm.objects(T.self as! Object.Type).filter(predicate) as! Results<T>
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteAll(_ obj:Object.Type)->Bool{
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete((realm.objects(obj)))
            }
            return true
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        return false
    }
    
    func UpdateById(_ obj:Object.Type,obj2:Object)->Bool{
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(obj2, update: true)
            }
            return true
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        return false
    }
    
    func DeleteById(_ obj:Object.Type,PKId:Int)->Bool{
        do {
            let realm = try Realm()
            try realm.write {
                let obj2  = realm.object(ofType: obj, forPrimaryKey: PKId as AnyObject)
                if obj2 != nil  {
                    realm.delete(obj2!)
                }
            }
            
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        return false
    }
    
    func insert(_ obj:Object)->Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(obj)
            }
            return true
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        return false
    }
    
    func insert(_ array:[Object])->Bool {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(array)
            }
            return true
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        return false
    }
    
    
    func update(_ ofType:Object,value:AnyObject,key:String)->Bool{
        do {
            let realm = try Realm()
            try  realm.write {
                ofType.setValue(value, forKeyPath: key)
            }
            return true
        }catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        return false
    }
    
    
}



extension Results {
    func toArray<T>(type: T.Type) -> [T] {
        return flatMap { $0 as? T }
    }
}

extension RealmSwift.List {
    
    func toArray<T>(type: T.Type) -> [T] {
        return flatMap { $0 as? T }
    }
}
