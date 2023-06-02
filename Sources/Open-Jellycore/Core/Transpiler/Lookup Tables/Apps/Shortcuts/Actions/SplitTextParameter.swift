//
//  SplitTextParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct SplitTextParameter: ParameterProtocol, Codable {
	var text: JellyArray<JellyVariableReference>?
	var separator: Jelly_WFTextSeparator?
	var WFTextCustomSeparator: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = SplitTextParameter()

        if let value = call.first(where: { node in return node.slotName == "text" }) {
            parameters.text = JellyArray<JellyVariableReference>(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "splitText", name: "text"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "separator" }) {
            parameters.separator = Jelly_WFTextSeparator(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "splitText", name: "separator"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "customSeparator" }) {
            parameters.WFTextCustomSeparator = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "splitText", name: "customSeparator"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"text": "[\"Hello-World\", \"Jello-World\"]",
			"separator": "Custom",
			"customSeparator": "-",

        ]
    }
}