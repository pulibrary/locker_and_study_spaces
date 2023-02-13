# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Duplicate Locker Applications', js: true do
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }
  let(:lewis) { FactoryBot.create(:building, name: 'Lewis Library') }
  let(:first_application) do
    FactoryBot.create(:locker_application, user:, preferred_general_area: 'A floor', complete: true,
                                           building: Building.find_by(name: 'Firestone Library'))
  end
  let(:second_application) { FactoryBot.create(:locker_application, user:, preferred_general_area: 'A floor', complete: true, building: lewis) }
  let(:locker) { FactoryBot.create(:locker, floor: 'A floor') }

  before do
    lewis
    first_application
    second_application
    locker
  end

  it 'shows the admin an alert on duplicate applications' do
    sign_in admin
    visit awaiting_assignment_locker_applications_path
    expect(page).to have_text('There is one duplicate application')
  end

  it 'allows the admin to view the details about the duplicate application at Lewis' do
    sign_in admin
    visit awaiting_assignment_locker_applications_path
    find('summary.duplicate-applications').click
    expect(page).to have_text('Lewis Library application, submitted on')
    within('.duplicate-applications-detail') { click_link 'View' }
    expect(page).to have_text(user.uid)
    expect(page).not_to have_text 'Edit'
  end

  context 'when duplicate application is at Firestone' do
    let(:second_application) do
      FactoryBot.create(:locker_application, user:, preferred_general_area: 'A floor', complete: true,
                                             building: Building.find_by(name: 'Firestone Library'),
                                             department_at_application: 'My duplicate department')
    end

    it 'allows the admin to edit the duplicate application at Firestone' do
      sign_in admin
      visit awaiting_assignment_locker_applications_path
      within("#application_#{first_application.id}") do
        find('summary.duplicate-applications').click
        expect(page).to have_text('Firestone Library application, submitted on')
        within('.duplicate-applications-detail') { click_link 'Edit' }
      end
      expect(page).to have_field('locker_application_department_at_application', with: 'My duplicate department')
    end
  end

  context 'when the duplicate application has been assigned' do
    let(:locker_assignment) do
      LockerAssignment.create(locker_application: second_application, locker:, start_date: 1.year.ago, expiration_date: 1.day.ago)
    end

    it 'shows the admin an alert on duplicate applications' do
      sign_in admin
      visit awaiting_assignment_locker_applications_path
      expect(page).to have_text('There is one duplicate application')
    end

    context 'when the assignment has been released' do
      before { locker_assignment.release }

      it 'does not show a duplicate application alert' do
        sign_in admin
        visit awaiting_assignment_locker_applications_path
        expect(page).not_to have_text('There is one duplicate application')
      end
    end
  end
end
