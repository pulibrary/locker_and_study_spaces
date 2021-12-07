# frozen_string_literal: true

class User < ApplicationRecord
  devise :rememberable, :omniauthable, omniauth_providers: %i[cas]

  has_many :locker_violations
  attr_writer :applicant

  delegate :email, :name, :department, :status, :junior?, to: :applicant

  def number_of_violations
    locker_violations.count
  end

  def self.from_cas(access_token)
    user = User.find_by(provider: access_token.provider, uid: access_token.uid)
    user = User.create(provider: access_token.provider, uid: access_token.uid, admin: false) if user.blank?
    user
  end

  def self.from_uid(uid)
    user = User.find_by(uid: uid)
    user = User.create(provider: 'cas', uid: uid, admin: false) if user.blank?
    user
  end

  def self.from_email(email)
    attributes = Ldap.find_by_email(email)
    if attributes.empty?
      User.create(provider: 'migration', uid: email)
    else
      user = User.find_by(provider: 'cas', uid: attributes[:netid])
      user = User.create(provider: 'cas', uid: attributes[:netid], admin: false) if user.blank?
      user
    end
  end

  def applicant
    @applicant ||= Applicant.new(self)
  end

  def to_s
    uid
  end
end
