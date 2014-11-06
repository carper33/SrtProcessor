module SrtProcessor
  class Contenido 
    def initialize (dialogs)
      @dialogs = dialogs
    end

    def output_content
      @dialogs.map do |dialog|
        [dialog.id, [dialog.start_time, dialog.end_time].join(' --> '), dialog.text].join("\r\n")
      end.join("\r\n\r\n")
    end
  end
end