module InlineERB
  module ClassMethods
    SNIPPET_RE = Regexp.new("<%=.*embed_view.*(\"|\')(.*)(\"|\').*%>").freeze

    def new(*args, &block)
      source     = args[0]
      identifier = args[1]
      while (matches = source.scan(SNIPPET_RE)).any? do
        #puts matches.inspect
        #puts "-----------------------------------------#{matches.size}--"
        matches.each do |(a, b, c)|
          path = File.expand_path(File.join(File.dirname(identifier), b.strip))
          Rails.logger.debug "  embed_view: #{b.strip}"
          source.gsub!(Regexp.new("<%=.*embed_view.*#{a}#{b}#{c}.*%>"), File.binread(path))
          identifier = path
        end
      end
      #binding.pry
      # puts source
      # puts "--------------------------"
      # puts "--------------------------"
      # puts "--------------------------"
      args[0] = source
      super(*args, &block)
    end
  end

  class << self
    def included(klass)
      klass.extend(ClassMethods)
    end
  end
end


module EmbedView
  class Railtie < ::Rails::Railtie
    initializer 'embed_view.helpers' do
      ActionView::Template.send :include, InlineERB
    end
  end
end
