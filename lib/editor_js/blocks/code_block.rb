# frozen_string_literal: true

module EditorJs
  module Blocks
    # code block
    class CodeBlock < Base
      def schema
        YAML.safe_load(<<~YAML)
          type: object
          additionalProperties: false
          properties:
            code:
              type: string
          required:
          - code
        YAML
      end

      def render(_options = {})
        content_tag :pre do
          content_tag :code, class: css_name do
            data['code']
          end
        end
      end

      def plain
        data['code'].strip
      end
    end
  end
end
