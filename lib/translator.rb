require 'yaml'
require 'pry'


def load_library(file_path) #arg is taking in a string, so it's using whatevers in the .yml file so file_path
  emoticons = YAML.load_file(file_path) #we don't have to use path.yml because calling . on anything = calling method. so call on the file path which refers to info in emoticons.yml
    translator = {"get_meaning" => {}, "get_emoticon" => {}}
      emoticons.each do |meaning, emoticon_symbols| #iterate over resulting hash (emoticons)
          translator["get_meaning"][emoticon_symbols[1]] = meaning #when you make the key you have to set it equal to something, to make it populate
          translator["get_emoticon"][emoticon_symbols[0]] = emoticon_symbols[1]

          # [1] is the japanese symbol, [0] is english symbol, then you have to  call it after emoticon symbol again to show that
          # english symbol is equal to japanese symbol

          #this is how we want it to look:
        # {
        #   get_meaning: {
        #     "☜(⌒▽⌒)☞": "angel"
        #   },
        #   get_emoticon: {
        #     "O:)": "☜(⌒▽⌒)☞"
        #   }
        # }
    end
  translator
end


def get_japanese_emoticon(file_path, english_emoticon)
  #loaded_library = load_library(file_path) -- dont need this bc the line under is doing that already
    library = load_library(file_path) #we don't need to call YAML. bc it already pre exists in method load_library. and replace load_file with load_library method.
      #load_library.each do |meaning, emoticon_symbols|
        if library["get_meaning"].include? (english_emoticon) #variable + calling key directly.include? english_emoticon placeholder
          library["get_meaning"][english_emoticon] #returning getmeaning key with english_emoticon
          # return load_library[emoticon_symbols][0] = emoticon_symbols[1]
          # if meaning = "happy"
          #   return load_library[emoticon_symbols][0] = emoticon_symbols[1]
          #   if meaning = "sad"
          #     return load_library[emoticon_symbols][0] = emoticon_symbols[1]
        else
          "Sorry, that emoticon was not found"

        end
      end
    end

def get_english_meaning(file_path, japanese_emoticon)
  library = load_library(file_path) #setting var = to method + file_path arg.
    #library.each do |meaning, emoticon_symbols| #we dont need to iterate just set conditions, bc load_library method is called.
      if library["get_meaning"].include? (japanese_emoticon)
        library["get_meaning"][japanese_emoticon]
      else
        "Sorry, that emoticon was not found"
  end
