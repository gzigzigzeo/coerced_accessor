require 'spec_helper'

describe CoercedAccessor::Time do
  subject { TimeMock.new }

  let(:date) { DateTime.new(2009, 1, 1) }
  let(:date_with_time) { DateTime.new(2009, 1, 1, 12, 0) }

  it 'converts dates' do
    subject.date = date
    expect(subject.date_human).to eq("20090101")

    subject.date_human = nil
    expect(subject.date).to be_nil

    subject.date_human = "20090202"
    expect(subject.date).to_not be_nil

    expect(subject.date.year).to eq(2009)
    expect(subject.date.month).to eq(2)
    expect(subject.date.day).to eq(2)
  end

  it 'handles time zones' do
    subject.date_with_time = date_with_time
    expect(subject.date_with_time_human).to eq("20090101 12:00")
  end

  it ':as option works' do
    subject.year = "2009"
    expect(subject.year).to eq("2009")
  end
end
