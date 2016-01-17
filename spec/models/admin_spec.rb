require 'rails_helper'
require 'cancan/matchers'

describe Admin, type: :model do
  describe 'abilities' do
    subject(:ability) { Ability.new(user) }
    let(:user) { FactoryGirl.create(:admin) }
    it { is_expected.to be_able_to(:manage, :all) }
  end
end
