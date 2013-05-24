class Entidade < ActiveRecord::Base
  validates_uniqueness_of :nome
  has_many :campos
  has_many :relacionamentos, foreign_key: "desta_id"

  def tem_um entidade
    relacionamentos.tem_um.create(para_esta: entidade)
  end
  def tem_muitos entidade
    relacionamentos.tem_muitos.create(para_esta: entidade)
  end
end
