class SleepLog < ActiveRecord::Base
    belongs_to :user
    validates :date, uniqueness: true
    
    def log_dreams
      @dreams = Array.new
      @dreams = self.user.dreams.where(date: self.date).find_each
      puts @dreams
      return @dreams.count
    end
    
    def log_hours
        if (self.end_time.to_i > self.start_time.to_i)
            return ((self.end_time.to_i - self.start_time.to_i)/3600).round
        else
            return (((24*3600-self.start_time.to_i) + self.end_time.to_i)/3600).round
        end
    end
    
end
