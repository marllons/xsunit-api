class Survivor < ApplicationRecord
  belongs_to :gender #,optional: true
  has_one :location

  accepts_nested_attributes_for :location#, update_only: true #caso deseje não exibir o histórico de localização, descomente essa linha


  # def to_br
  #   {
  #     name: self.name,
  #     birthday: (I18n.l(self.birthday) unless self.birthday.blank?),
  #     gender: (I18n.t(gender_description))
  #   }
  # end

  def as_json(options={})
    c = super(except: [:gender_id, :created_at, :updated_at], include: [:location])
    c[:birthday] = (self.birthday.to_time.iso8601 unless self.birthday.blank?)
    c[:gender] = (I18n.t(self.gender.description))
    # c[:latitude] = self.location.latitude
    # c[:longitude] = self.location.longitude
    c
  end
end
