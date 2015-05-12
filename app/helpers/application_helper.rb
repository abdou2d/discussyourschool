module ApplicationHelper
    def error_field(model, attribute)
		if model.errors.has_key? attribute
			content_tag(
				:div,
				model.errors[attribute].first,
				class: 'error'
			)
		end
	end

    def grade_options
        [
            ["Terceiro ano EM", "terceiroEM"],
            ["Segundo ano EM", "segundoEM"],
            ["Primerio ano EM", "primeiroEM"],
            ["Nono ano", "nono"],
            ["Oitavo ano", "oitavo"],
            ["Sétimo ano", "setimo"],
            ["Sexto ano", "sexto"],
        ]
    end

    def student_school_name
        @student_school_name = School.find_by(name: current_student.school_name)
        @student_school_name.slug
    end

end
