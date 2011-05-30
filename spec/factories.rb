# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.username               "subhashtest"
  user.email                  "subhashtest@strata.co.in"
  user.password               "justbooks12"
end
