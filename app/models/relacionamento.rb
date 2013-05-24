class Relacionamento < ActiveRecord::Base
  belongs_to :desta, class_name: "Entidade"
  belongs_to :para_esta, class_name: "Entidade"

  scope :tem_um,     -> { where tipo: "has_one" }
  scope :tem_muitos, -> { where tipo: "has_many" }
end
