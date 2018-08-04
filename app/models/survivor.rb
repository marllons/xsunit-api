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


end
