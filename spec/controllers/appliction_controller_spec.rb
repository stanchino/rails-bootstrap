require 'rails_helper'

describe ApplicationController, type: :controller do
  describe '#current_ability' do
    describe 'for admin' do
      login_admin
      it 'defines the admin ability' do
        ability = Ability.new(user)
        expect(Ability).to receive(:new).and_return(ability)
        expect(subject.send(:current_ability)).to eq ability
        expect(assigns(:current_ability)).to eq ability
      end
    end

    describe 'for user' do
      login_user
      it 'defines the admin ability' do
        ability = Ability.new(user)
        expect(Ability).to receive(:new).and_return(ability)
        expect(subject.send(:current_ability)).to eq ability
        expect(assigns(:current_ability)).to eq ability
      end
    end
  end
end
