require 'rails_helper'

RSpec.describe Quote, type: :model do
  it { should belong_to :stock}
end
