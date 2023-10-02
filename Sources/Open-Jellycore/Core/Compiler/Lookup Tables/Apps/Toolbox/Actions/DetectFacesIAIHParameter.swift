//
//  DetectFacesIAIHParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct DetectFacesIAIHParameter: ParameterProtocol, Codable {
	var image: JellyVariableReference?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = DetectFacesIAIHParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "image" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.image = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "detectFacesIAIH", name: "image"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"image": "ShortcutInput",

        ]
    }
}
