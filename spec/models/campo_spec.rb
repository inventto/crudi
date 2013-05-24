require 'spec_helper'

describe Campo do
  it "tem um nome e um tipo" do
    @campo = Campo.new nome: "nome", tipo: "string"
    @campo.should be_valid
  end

  it "ambos sao obrigatorios" do
    @campo = Campo.new
    @campo.should_not be_valid
    @campo.tipo ="string"
    @campo.should_not be_valid
    @campo.nome ="nome"
    @campo.should be_valid
  end
end
