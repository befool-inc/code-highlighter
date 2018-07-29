require "rouge"

module Octopress
  module CodeHighlighter
    class Formatter < ::Rouge::Formatters::HTMLLinewise
      def stream(tokens, &b)
        token_lines(tokens) do |line|
          line.each do |tok, val|
            yield @formatter.span(tok, val)
          end
          yield "\n"
        end
      end
    end
  end
end
