require 'spec_helper'

describe CoercedAccessor::Compound do
  subject { SplitMock.new }

  it do
    subject.subject_id = 1
    subject.subject_type = 'User'
    expect(subject.subject).to eq('1:User')
  end
end
