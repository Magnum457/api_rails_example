require 'rails_helper'

RSpec.describe Category, type: :model do
  # Teste de associação com os livros
  it { should have_many(:books) }
  # Teste de verificação da presença do atributo name
  it { should validate_presence_of(:name) }
  # Teste de verificação do tamanho do atributo name
  it { should validate_length_of(:name).is_at_least(3) }
end
