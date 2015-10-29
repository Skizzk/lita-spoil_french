require 'open-uri'
require 'htmlentities'

module Lita
  module Handlers
    class SpoilFrench < Handler
      route(/^spoil(?<title>\s+-t)?(\s+(?<id>\w+))?/, :spoil, command: true, help: {
        "spoil [-t] [id]" => "Spoil a movie in french. if -t display the title. if id try to find the movie by its id."
      })

      def spoil(r)
        @id = r.match_data[:id]
        result(r.match_data[:title])
        r.reply(format_result)
      end

      private

      def result(add_title = false)
        @result ||= begin 
                      @result = if add_title
                                  "#{title} - "
                                else
                                  ""
                                end
                      @result += "#{text} (#{id})"
                    end
      end

      def format_result
        HTMLEntities.new.decode(result)
      end

      def title
        @title ||= /<title>(?<title>.*)\s-\s/.match(page)[:title]
      end

      def text
        @text ||= /<p>(?<text>.*)<\/p>/.match(page)[:text]
      end

      def id
        @id 
      end

      def url
        "http://etenfaitalafin.fr"
      end

      def page
        unless @id
          index = /document\.location = '\/(?<id>.*)'/.match(open(url).read)
          @id = index[:id]
        end
        @page ||= open("http://etenfaitalafin.fr/#{@id}").read
      end

      Lita.register_handler(self)
    end
  end
end
