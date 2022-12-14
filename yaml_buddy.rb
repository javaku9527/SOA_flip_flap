# frozen_string_literal: true

require 'yaml'
# Module that can be included (mixin) to take and output YAML data
module YamlBuddy
  # take_yaml: converts a String with YAML data into @data
  # parameter: yaml - a String in YAML format
  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
  end

  # to_yaml: converts @data into YAML string
  # returns: String in YAML format
  def to_yaml
    @data.to_yaml
  end
end
