module SrtProcessor
  class Processor
    def initialize(input, output)
      @input = input
      @output = output
    end

    def shift(seconds)
      dialogs = output_dialogs(seconds)
      content = Contenido.new(@dialogs_to_output).output_content
      export(content)
    end

    def input_subtitle
      @input_subtitle ||= Subtitle.new(@input)
    end

    def output_dialogs(seconds)
      @dialogs_to_output = []
      input_subtitle.dialogs.map do |dialog|
        start_time = ShiftTime.new(dialog.start_time, seconds).shift_time
        end_time = ShiftTime.new(dialog.end_time, seconds).shift_time
        @dialogs_to_output << Dialog.new(dialog.id, start_time, end_time, dialog.text)
      end
    end

      def export(content)
        Exporter.new(@output,content).export
      end
  end
end