FactoryBot.define do
  factory :user do
    name { 'test' }
    email { 'aabb@hh.de' }
    password { 'ruby123' }
    id {1}
  end

  factory :post do
  user_id {1}
  content {'Lorem Ipsum is simply dummy text of the printing and typesetting industry
  Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, 
  when an unknown printer took a galley of type and scrambled it to '}
  end
end

