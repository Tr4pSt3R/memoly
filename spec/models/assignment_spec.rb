require 'spec_helper'

describe Assignment do
  it { should belong_to(:role) }
  it { should belong_to(:user) }
end
