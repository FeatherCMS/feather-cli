//
//  File.swift
//
//
//  Created by Tibor Bodecs on 2022. 01. 14..
//

// @TODO: optional patch fields
public struct ApiModelGeneratorKotlin {
    
    let descriptor: ModelDescriptor
    let module: String
    
    public init(_ descriptor: ModelDescriptor, module: String) {
        self.descriptor = descriptor
        self.module = module
    }
    
    public func generate() -> String {
        """
        package \(descriptor.kotlinPackageName ?? "")
        
        @Keep
        class \(module) {
        
            @Keep
            data class List (
                var id: String,
                \(generateFields())
            )
        
            @Keep
            data class Detail(
                var id: String,
                \(generateFields())
            )
        
            @Keep
            data class Create(
                \(generateFields())
            )
        
            @Keep
            data class Update(
                \(generateFields())
            )

            @Keep
            data class Patch(
                \(generatePatchFields())
            )
        }
        """
    }
}

private extension ApiModelGeneratorKotlin {
    
    func generatePatchField(_ property: PropertyDescriptor) -> String {
        var prop = property
        prop.isRequired = false
        return "var \(prop.name): \(prop.kotlinType)"
    }
    
    func generatePatchFields() -> String {
        descriptor.properties.map { generatePatchField($0) }.joined(separator: ", \n    ")
    }
    

    func generateField(_ property: PropertyDescriptor) -> String {
        //(property.isRequired ? "lateinit" : "") + " var \(property.name): \(property.kotlinType)"
        "var \(property.name): \(property.kotlinType)"
    }
    
    func generateFields() -> String {
        descriptor.properties.map { generateField($0) }.joined(separator: ", \n    ")
    }


}
