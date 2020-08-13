FactoryBot.define do
  factory :code_snippet do
    code { 'MyCodeSnippetCode' }
    language { 'MyCodeSnippetLanguage' }
    association :section, factory: :section
  end
end
