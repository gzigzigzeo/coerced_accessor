require 'spec_helper'

describe CoercedAccessor::Compound do
  subject { CompoundMock.new }

  it do
    subject.subject = 'a/b'
    expect(subject.subject_id).to eq('a')
    expect(subject.subject_type).to eq('b')

    subject.subject_id = 8
    expect(subject.subject).to eq('8/b')
  end
end
