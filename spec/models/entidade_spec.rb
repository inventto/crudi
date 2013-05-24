require 'spec_helper'
def entidade nome
  Entidade.create! nome: nome
end
def campo_exemplo
  Campo.new(nome: "nome", tipo: "string")
end

describe Entidade do
  describe "validacoes" do
    subject do
      entidade "Cliente"
    end
    it "permite cadastrar entidades" do
      should be_valid
    end
    it "nao permite entidades duplicadas" do
      -> { 2.times { entidade "Cliente"} }.should raise_error
    end
    it "permite adicionar campos a entidade" do
      cliente = entidade "Cliente"
      cliente.campos << campo_exemplo
      cliente.should have(1).campos
    end
    after :all do
      Entidade.destroy_all
    end
  end
  describe "relacionamentos" do
    before :all do
      @cliente = entidade "Cliente"
    end
    it "o campo nao pode estar duplicado na mesma entidade" do
      2.times { @cliente.campos << campo_exemplo }
      @cliente.should have(1).errors_on(:campos)
    end
    it "permite configurar relacionamentos unarios a entidade" do
      @endereco = entidade "Endereco"
      @cliente.tem_um @endereco
      @cliente.relacionamentos.first.tipo == "has_one"
    end
    it "permite configurar relacionamentos multiplo entidade" do
      @cliente.tem_muitos entidade("Telefone")
      @cliente.relacionamentos.last.tipo == "has_many"
    end
    after :all do
      [Relacionamento, Campo, Entidade].each &:destroy_all
    end
  end
end
