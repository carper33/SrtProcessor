module SrtProcessor
  class Subtitle
    def initialize(file)
      @file = file
    end

    def dialogs
      @dialogs ||= contents.map do |dialog|
        Dialog.new(*dialog_attributes(dialog))
      end
    end

    private

    def contents
      IO.read(@file).split("\n\n")
    end

    def dialog_attributes(dialog_source)
      id, time, text = dialog_source.split("\n", 3)
      start_time, end_time = time.split(" --> ")
      [id, start_time, end_time, text]
    end
  end
end
