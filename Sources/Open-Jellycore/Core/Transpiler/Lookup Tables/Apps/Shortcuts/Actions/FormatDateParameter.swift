//
//  FormatDateParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct FormatDateParameter: ParameterProtocol, Codable {
	var WFDate: JellyString?
	var WFDateFormatStyle: Jelly_WFDateFormatStyle?
	var WFTimeFormatStyle: Jelly_WFTimeFormatStyle?
	var WFDateFormat: JellyString?
	var WFISO8601IncludeTime: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = FormatDateParameter()

        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.WFDate = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatDate", name: "date"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "dStyle" }) {
            parameters.WFDateFormatStyle = Jelly_WFDateFormatStyle(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatDate", name: "dStyle"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "tStyle" }) {
            parameters.WFTimeFormatStyle = Jelly_WFTimeFormatStyle(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatDate", name: "tStyle"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "custom" }) {
            parameters.WFDateFormat = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatDate", name: "custom"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "isoTime" }) {
            parameters.WFISO8601IncludeTime = JellyBoolean(value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "formatDate", name: "isoTime"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"date": "10/20/30",
			"dStyle": "Short",
			"tStyle": "None",
			"custom": "",
			"isoTime": "false",

        ]
    }
}