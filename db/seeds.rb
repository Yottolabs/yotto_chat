puts "Creating 5 Base Skill with 5 child skills"
5.times do
  _skill_set = SkillSet.create(name: Faker::Name.name)
  5.times do
    _first_child = _skill_set.children.build(name: Faker::Name.name)
    _skill_set.save
    5.times do
      _first_child.children.build(name: Faker::Name.name)
      _first_child.save
    end
    
  end
  
end


puts "Create 10 User"
10.times do
  User.create(
                name:       Faker::Name.name,
                email:      Faker::Internet.email,
                password:   Faker::Internet.password
            )
end

puts "Create My User"
User.create(
              name:     "Santu Koley",
              email:    "santu.cst08@gmail.com",
              password: "santu123"
            )
