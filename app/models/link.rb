# require "digest/sha1"

class Link < ApplicationRecord
  validates :url, presence: true
  validates :signature, presence: true

  def signed?
    !signature.blank?
  end
end
