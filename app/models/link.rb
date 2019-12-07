class Link < ApplicationRecord
  validates_presence_of :original_link, :uuid
  validates_uniqueness_of :original_link, :uuid
  validate :validate_original_link

  after_initialize :set_uuid

  private
    def set_uuid
      self.uuid ||= SecureRandom.urlsafe_base64(6)
    end

    def validate_original_link
      begin
        response = HTTParty.get(self.original_link)
      rescue => e
        errors.add(:original_link, "Invalid link.")
      end
    end
end
