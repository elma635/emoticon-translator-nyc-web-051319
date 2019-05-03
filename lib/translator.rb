require 'yaml'
require 'pry'

# require modules here
def load_library(file_path) #arg is taking in a string, so it's using whatevers in the .yml file so file_path
  emoticons = YAML.load_file(file_path) #we don't have to use path.yml because calling . on anything = calling method. so call on the file path which refers to info in emoticons.yml
    translator = {"get_meaning" => {}, "get_emoticon" => {}}
      emoticons.each do |meaning, emoticon_symbols| #iterate over resulting hash (emoticons)
          translator["get_meaning"][emoticon_symbols[1]] = meaning #when you make the key you have to set it equal to something, to make it populate
          translator["get_emoticon"][emoticon_symbols[0]] = emoticon_symbols[1]
 #binding.pry

          #this is how we want it to look:
        # {
        #   get_meaning: {
        #     "☜(⌒▽⌒)☞": "angel"
        #   },
        #   get_emoticon: {
        #     "O:)": "☜(⌒▽⌒)☞"
        #   }
        # }

      #binding.pry
    end
  translator
end

#
# def get_japanese_emoticon(file_path, emoticon)
#   #loaded_library = load_library(file_path) -- dont need this bc the line under is doing that already
#     load_library = YAML.load_file(file_path)
#
#
# end
#
# def get_english_meaning(file_path, emoticon)
#   load_library = YAML.load_file(file_path)
#     load_library.each do |meaning, emoticon_symbols|
#
#       if meaning[:grinning] =
#
#     end
#   end
# end
