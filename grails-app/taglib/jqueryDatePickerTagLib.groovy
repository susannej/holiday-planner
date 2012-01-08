
class jqueryDatePickerTagLib {
	
	def jqDatePicker = {attrs, body ->
		def out = out
		def name = attrs.name //The name attribute is required for the tag to work seamlessly with grails
		def id = attrs.id ?: name
		def minDate = attrs.minDate
		def showDay = attrs.showDay
		def value = attrs.value
		def displayFormat = attrs.displayFormat
		def datepickerFormat = attrs.datepickerFormat
		
		def displayFormatString = displayFormat ? displayFormat : "MM/dd/yyyy"
		def datepickerFormatString = datepickerFormat ? datepickerFormat : "dd/mm/yy"		
		//def dateString = value ? value.format('MM/dd/yyyy') : ""
		def dateString = value ? value.format(displayFormatString) : ""
		def dayString = value ? value.format('dd') : ""
		def monthString = value ? value.format('MM') : ""
		def yearString = value ? value.format('yyyy') : ""

		//Create date text field and supporting hidden text fields need by grails
		out.println "<input type=\"text\" name=\"${name}\" id=\"${id}\" value=\"${dateString}\" />"
		out.println "<input type=\"hidden\" name=\"${name}_day\" id=\"${id}_day\" value=\"${dayString}\" />"
		out.println "<input type=\"hidden\" name=\"${name}_month\" id=\"${id}_month\" value=\"${monthString}\" />"
		out.println "<input type=\"hidden\" name=\"${name}_year\" id=\"${id}_year\" value=\"${yearString}\" />"
		
		//Code to parse selected date into hidden fields required by grails
		out.println "<script type=\"text/javascript\"> \$(document).ready(function(){"
		out.println "\$(\"#${name}\").datepicker({"
		out.println "onClose: function(dateText, inst) {"
		out.println "\$(\"#${name}_month\").attr(\"value\",new Date(dateText).getMonth() +1);"
		out.println "\$(\"#${name}_day\").attr(\"value\",new Date(dateText).getDate());"
		out.println "\$(\"#${name}_year\").attr(\"value\",new Date(dateText).getFullYear());"
		out.println "}"
		
		//If you want to customize using the jQuery UI events add an if block an attribute as follows
		if(minDate != null){
			out.println ","
			out.println "minDate: ${minDate}"
		}
		
		if(datepickerFormatString != null) {
			out.println ","
			out.println "dateFormat: '${datepickerFormatString}'"
		}
		
		if(showDay != null){
			out.println ","
			out.println "beforeShowDay: function(date){"
			out.println "var day = date.getDay();"
			out.println "return [day == ${showDay},\"\"];"
			out.println "}"
		}
		
		out.println "});"
		out.println "})</script>"
		
	}

	def jqDatePicker2 = {attrs, body ->
		def out = out
		def name = attrs.name // The name attribute is required for the tag to work seamlessly with grails
		def id = attrs.id ?: name
		def minDate = attrs.minDate
		def showDay = attrs.showDay
		def value = attrs.value
		def changeMonth = attrs.changeMonth
		def changeYear = attrs.changeYear
		def yearRange = attrs.yearRange
		def yearsBack = attrs.yearsBack
		def yearsAhead = attrs.yearsAhead

		def dateString = value ? value.format('MM/dd/yyyy') : ""
		def dayString = value ? value.format('dd') : ""
		def monthString = value ? value.format('MM') : ""
		def yearString = value ? value.format('yyyy') : ""

		// Create date text field and supporting hidden text fields need by grails
		out.println ""
		out.println ""
		out.println ""
		out.println ""

		// Code to parse selected date into hidden fields required by grails
		out.println " \$(document).ready(function(){"
		out.println "\$(\"#${name}\").datepicker({"
		out.println "onClose: function(dateText, inst) {"
		out.println "\$(\"#${name}_month\").attr(\"value\",new Date(dateText).getMonth() +1);"
		out.println "\$(\"#${name}_day\").attr(\"value\",new Date(dateText).getDate());"
		out.println "\$(\"#${name}_year\").attr(\"value\",new Date(dateText).getFullYear());"
		out.println "}"
		
		// If you want to customize using the jQuery UI events add an if block an attribute as follows
		if(null != minDate){
			out.println ","
			out.println "minDate: ${minDate}"
		}
		
		if(showDay != null){
			out.println ","
			out.println "beforeShowDay: function(date){"
			out.println "var day = date.getDay();"
			out.println "return [day == ${showDay},\"\"];"
			out.println "}"
		}
		
		if(changeMonth != null) {
			out.println ","
			out.println "changeMonth: ${changeMonth}"
		}
		
		if(changeYear != null) {
			out.println ","
			out.println "changeYear: ${changeYear}"
		}
		
		if(yearRange != null) {
			out.println ","
			out.println "yearRange: ${yearRange}"
		}
		
		if(yearsBack != null && yearsAhead != null) {
			def thisYear = Calendar.getInstance().get(Calendar.YEAR)
			def minYear = thisYear - yearsBack.toInteger()
			def maxYear = thisYear + yearsAhead.toInteger()
			out.println ","
			out.println "yearRange: '${minYear}:${maxYear}'"
		}
		
		out.println "});"
		out.println "})"
	}
}
