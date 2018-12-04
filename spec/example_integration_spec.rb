# require ('rspec')
# require ('capybara/rspec')
# require ('pry')
# require ('./app')
# require ('capybara')
# require ('./lib/example')
#
# describe("#actors") do
#   it("returns all of the actors in a particular movie") do
#     movie = Movie.new({:name => "Oceans Eleven", :id => nil})
#     movie.save()
#     george = Actor.new({:name => "George Clooney", :id => nil})
#     george.save()
#     brad = Actor.new({:name => "Brad Pitt", :id => nil})
#     brad.save()
#     movie.update({:actor_ids => [george.id(), brad.id()]})
#     expect(movie.actors()).to(eq([george, brad]))
#   end
# end
