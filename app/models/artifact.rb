class Artifact < ActiveRecord::Base
  attr_accessor :key
  belongs_to :project
  mount_uploader :key, FileUploader
  MAX_FILESIZE = 10.megabytes
  validates :name, presence: true, uniqueness: true
  validate :uploaded_file_size

  private

  def uploaded_file_size
		if key
			errors.add(:key, "File size must be less than #{self.class::MAX_FILESIZE}") unless key.size <= self.class::MAX_FILESIZE
		end
	end
end
