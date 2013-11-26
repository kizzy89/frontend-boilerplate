# Require any additional compass plugins here.

require "compass-h5bp"

# Set this to the root of your project when deployed:
css_dir = "css"
sass_dir = "css/_sass"
images_dir = "i"
javascripts_dir = "js"

###
# Helpers
###

module Sass::Script::Functions
  
  # Custom str_index function for use in Sass
  def str_index(string, substring)
    assert_type string, :String
    assert_type substring, :String
    index = string.value.index(substring.value) || -1
    Sass::Script::Number.new(index + 1)
  end
  declare :str_index, [:string, :substring]
  
  # Custom list_files function for use in Sass
  def list_files(path)
    return Sass::Script::List.new(
      Dir.glob(path.value).map! { |x| Sass::Script::String.new(x) },
      :comma
    )
  end
  
end

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = true