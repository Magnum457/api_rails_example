require 'rails_helper'

RSpec.describe Book, type: :model do
  # Teste de associação com as categorias
  it { should belong_to(:category) }
  # Teste de verificação da presença do atributo titulo
  it { should validate_presence_of(:title) }
  # Teste de verificação da presença do atributo autor
  it { should validate_presence_of(:author) }
  # Teste de verificação do temanho do atributo titulo
  it { should validate_length_of(:title).is_at_least(3) }
end
