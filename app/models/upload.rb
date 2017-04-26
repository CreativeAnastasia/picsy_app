class Upload < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  has_attached_file :image, styles: { small: "350x350>", medium: "600x600>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
