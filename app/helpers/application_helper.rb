module ApplicationHelper
	def controller?(*controller)
		controller.include?(params[:controller])
	end

	def action?(*action)
		action.include?(params[:action])
	end

	def alert_color flash_type
		case flash_type.to_s
		when "success"
			"green"
		when "notice"
			"blue"
		when "info"
			"blue"
		when "warning"
			"yellow darken-3"
		else 
			"red"
		end
	end
 
end
