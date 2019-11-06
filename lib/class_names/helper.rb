module ClassNames
  class Helper
    def initialize(*classes)
      options = classes.last.is_a?(::Hash) ? classes.pop : {}

      @classes = {}
      # default to true on class_names("truthy") like calls
      @classes = classes.map do |class_name|
        if class_name.is_a?(::Hash)
          class_name.each do |class_key, class_value|
            next if !class_value
            @classes[class_key] = true
          end
        else
           { class_name => true } if class_name
        end
      end.compact.reduce({}, &:merge)
      @classes.merge!(options)

      # handle multiple keys in hash class_names([arr_truthy, arr_falsy] => false) --> "arr_falsy"
      @classes = @classes.map { |((true_css_key, false_css_key), condition)| condition ? true_css_key : false_css_key }
    end

    def to_s
      return @classes.compact.join(" ")
    end
  end
end