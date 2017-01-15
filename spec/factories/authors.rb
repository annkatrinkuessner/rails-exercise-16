FactoryGirl.define do
  factory :author do
     first_name "Alan"
     last_name "Turing"
     homepage "http://wikipedia.de/Alan_Turing"
     papers []
    # {build_list :paper, 1}
  end
end