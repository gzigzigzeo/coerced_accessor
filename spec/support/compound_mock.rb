class CompoundMock
  extend CoercedAccessor::Compound

  attr_accessor :subject_id, :subject_type

  compound_accessor :subject, :subject_id, :subject_type, delimiter: '/'
end
