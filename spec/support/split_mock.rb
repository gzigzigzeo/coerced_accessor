class SplitMock
  extend CoercedAccessor::Split

  attr_accessor :subject

  split_accessors :subject, :subject_id, :subject_type
end
