require 'date'

class OptionDate
  @month = nil
  @day = nil
  @year = nil

  def initialize(date)
    if date and date != ''
      parts = date.split('-')
      if parts.size == 1
        @year = parts[0].to_i
      elsif parts.size == 2
        @year = parts[0].to_i
        @month = parts[1].to_i
      elsif parts.size == 3
        @year = parts[0].to_i
        @month = parts[1].to_i
        @day = parts[2].to_i
      end
    end
  end

  def to_s
    parts = [@year, @month, @day]
    parts.delete(nil)
    return parts.join('-')
  end

  def formatted
    parts = self.to_s.split('-')

    begin
      raise "Error" if self.to_s == ''
      if parts.size == 3
        date =  DateTime.parse("#{parts[2]}-#{parts[0]}-#{parts[1]}")
        return {month: parts[1], day: parts[2], year: parts[0], error: false, exact: true, date: date, formatted: date.strftime('%B %-d, %Y')}
      elsif parts.size == 2
        d = "#{parts[0]}-#{parts[1]}-1"
        date =  DateTime.parse(d)
        return {month: parts[1], day: '', year: parts[0], error: false, exact: false, date: date, formatted: date.strftime('%B, %Y') }
      elsif parts.size == 1
        date = DateTime.parse("#{parts[0]}-1-1")
        return {month: '', day: '', year: parts[0], error: false, exact: false, date: date, formatted: date.strftime('%Y')}
      else
        raise "Error"
      end
    rescue Exception => e
        return {month: '', day: '', year: '', error: true, exact: false, date: '', formatted: ''}
    end
  end


end
