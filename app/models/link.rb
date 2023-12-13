# require "digest/sha1"

class Link < ApplicationRecord
  has_many :visits

  validates :url, presence: true
  validates :signature, presence: true

  def signed?
    !signature.blank?
  end

  def statistics
    { visits_count: visits_count + visits.count }
  end
end
