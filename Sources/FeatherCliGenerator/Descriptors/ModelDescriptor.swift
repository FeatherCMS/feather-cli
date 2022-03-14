//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 13..
//


public struct ModelDescriptor {
    public var name: String
    public var properties: [PropertyDescriptor]
    public var kotlinPackageName: String? = nil
    
    public init(name: String, properties: [PropertyDescriptor], kotlinPackageName: String? = nil) {
        self.name = name
        self.properties = properties
        self.kotlinPackageName = kotlinPackageName
    }
    
}
