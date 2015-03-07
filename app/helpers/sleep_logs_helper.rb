module SleepLogsHelper

    def slept_hours(l)
        if (l.end_time.to_i > l.start_time.to_i)
            return ((l.end_time.to_i - l.start_time.to_i)/3600).round
        elsif (l.end_time.to_i == l.start_time.to_i)
            return 0
        else
            return (((24*3600-l.start_time.to_i) + l.end_time.to_i)/3600).round
        end
    end

end
