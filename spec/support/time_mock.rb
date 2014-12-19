class TimeMock
  extend CoercedAccessor::Time

  attr_accessor :date, :date_with_time, :just_year

  time_coerced_accessor(:date, "%Y%m%d")
  time_coerced_accessor(:date_with_time, "%Y%m%d %H:%M")
  time_coerced_accessor(:just_year, "%Y", as: :year)
end
