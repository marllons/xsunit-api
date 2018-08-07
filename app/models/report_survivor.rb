class ReportSurvivor < ApplicationRecord
  belongs_to :survivor, optional: true
  validates :abd_report, :inclusion => { :in => 0..3}

  def as_json(options={})
    c = super(except: [:created_at, :updated_at])
    c[:name] = (self.survivor.name unless self.survivor.name.blank?)
    c[:gender] = (I18n.t(self.survivor.gender.description))
    c[:birthday] = (self.survivor.birthday.to_time.iso8601 unless self.survivor.birthday.blank?)
    c
  end
end


  #({ posts: { include: { comments: { only: :body } }, only: :title } })
