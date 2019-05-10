require 'digest'
require 'base64'

class TrainingFile < ApplicationRecord

  belongs_to :user

  validates :user, presence: true
  validates :file_digest, presence: true, uniqueness: {message: 'File already has been uploaded'}

  def file_digest_snippet
    if file_digest.nil?
      nil
    else
      file_digest[0..7] + '...'
    end
  end

  def bytes_snippet
    if bytes_sample.nil?
      nil
    else
      bytes_sample[0..15] + '...'
    end
  end

  def file=(original_file)
    if original_file.nil?
      self.file_digest = nil
      self.original_filename = nil
    else
      content = original_file.read
      self.file_digest = Digest::SHA256.hexdigest content
      self.original_filename = original_file.original_filename
      b64 = Base64.encode64(content)
      start = (b64.length / 2).floor
      self.bytes_sample = b64[start..(start + 255)].gsub! '=', ''
    end
  end

  if respond_to?(:attributes_protected_by_default)
    def self.attributes_protected_by_default
      super + ['file_digest', 'original_filename']
    end
  end
end
