module ApplicationHelper
  # Retourner un titre basé sur la page.
  def titre
      base_titre = "Anima"
      if @titre.nil?
          base_titre
      else
          "#{base_titre} | #{@titre}"
      end
  end

  # Returns true or false based on the provided path and condition
  # Possible condition values are:
  #                  Boolean -> true | false
  #                    Regex -> /regex/
  #   Controller/Action Pair -> [[:controller], [:action_a, :action_b]]
  # Example usage:
  #   is_active_link?('/root', true)
  #   is_active_link?('/root', /^\/root/)
  #   is_active_link?('/root', ['users', ['show', 'edit']])
  #
  def is_active_link?(condition = nil)
    case condition
      when Regexp
        !request.fullpath.match(condition).blank?
      when Array
        controllers = [*condition[0]]
        actions     = [*condition[1]]
        (controllers.blank? || controllers.member?(controller_name)) &&
            (actions.blank? || actions.member?(action_name))
      when TrueClass
        true
      when FalseClass, nil
        false
    end
  end
end
