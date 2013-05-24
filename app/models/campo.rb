class Campo < ActiveRecord::Base
  belongs_to :entidade
  validates :nome, :tipo, presence: true
  validates_uniqueness_of :nome, scope: [:tipo, :entidade_id]
end
