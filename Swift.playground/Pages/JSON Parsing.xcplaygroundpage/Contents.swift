//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

typealias Payload = [String: AnyObject]

PlaygroundPage.current.needsIndefiniteExecution = true

DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
    // TODO: Process data
    var json: Payload!
    
    // 1
    do {
        json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? Payload
    } catch {
        print(error)
        PlaygroundPage.current.finishExecution()
    }
    
    // 2
    guard let feed = json["feed"] as? Payload,
        let apps = feed["entry"] as? [AnyObject],
        let app = apps.first as? Payload
        else {
            PlaygroundPage.current.finishExecution()
    }
    
    guard let container = app["im:name"] as? Payload,
        let name = container["label"] as? String
        else { PlaygroundPage.current.finishExecution() }
    
    guard let id = app["id"] as? Payload,
        let link = id["label"] as? String
        else { PlaygroundPage.current.finishExecution() }
    
    // 3
    let entry = App(name: name, link: link)
    print(entry)

    PlaygroundPage.current.finishExecution()
}
