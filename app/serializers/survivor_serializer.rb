class SurvivorSerializer < ActiveModel::Serializer
######### baseado na convenção do json_api
  attributes :id, :name, :birthday, :has_abd, :abd_report, :gender_id

  #optional!!!!
  # belongs_to :gender do
  #   link(:gender) { gender_url(object.gender.id) }
  # end
  has_one :location do
    link(:location) { survivor_gender_url(object.id) }
  end

  link(:self) { survivor_url(object.id) }
  link(:gender) { survivor_gender_url(object.id) }


  def attributes(*args)
    c = super(*args)#except: [:gender_id, :created_at, :updated_at], include: [:location])
    c[:birthday] = (object.birthday.to_time.iso8601 unless object.birthday.blank?)
    c[:gender] = (I18n.t(object.gender.description))
    # c[:latitude] = object.location.latitude
    # c[:longitude] = object.location.longitude
    c
  end
end
