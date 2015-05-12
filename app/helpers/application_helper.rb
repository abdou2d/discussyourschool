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

    def posts_count_no_anonymous(student_id, school_name)
        student = Student.find_by(id: student_id).where(school_name: school.name)
        @posts_no_anonymous = student.posts.where.not(anonymous: '1')
    end

end
