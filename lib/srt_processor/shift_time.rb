module SrtProcessor
  class ShiftTime
    def initialize(time,seconds)
        @seconds = seconds
        @time = time
        
    end
      def shift_time
        hours, minutes, seconds_and_mili = @time.split(':')
        seconds, mili = seconds_and_mili.split(',')
        seconds_and_mili = [seconds.to_i + @seconds, mili].join(',')
        [hours, minutes, seconds_and_mili].join(':')
      end
  end
end

