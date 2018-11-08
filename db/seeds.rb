# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
COMMENTS = %w(Awesome Tasty Amazing Stunning Awful Terrible Super Never)

User.create! ([{username: 'Hawkeye', email: 'clintbarton@gmail.com', password: 'pizzadog', password_confirmation: 'pizzadog'},
               {username: 'KatieKate', email: 'katebishop@gmail.com', password: 'lucky777', password_confirmation: 'lucky777'},
               {username: 'Captain', email: 'caroldanvers@gmail.com', password: 'AFpilot', password_confirmation: 'AFpilot'},
               {username: 'MrPrince', email: 'sanji@gmail.com', password: 'vinsmokesux', password_confirmation: 'vinsmokesux'},])
               
Category.create! ([{name: 'Appetizer'},{name: 'Dinner'},{name: 'Lunch'},{name: 'Breakfast'},{name: 'Supper'}, {name: 'Dessert'},
                   {name: 'Gluten Free'},{name: 'Vegan'},{name: 'Vegetarian'}, {name: 'Lactose Free'}])

users = User.all


Recipe.create! ([{user: users.sample,
                  title: 'Raspberry Sorbet', 
                  text: 'Raspberry sorbet is the refreshing, fruity dessert of your dreams! Made with just 3 simple ingredients, 
                        homemade raspberry sorbet is low in calories, gluten-free, and dairy-free! You need: raspberries, stevia, water. 
                        Instruction: 1. Lay out the fresh raspberries over a rimmed baking sheet lined with parchment paper. 
                        2. Freeze the raspberries until completely solid, which should take at least 2-3 hours, but I usually just leave 
                        them in the freezer overnight.
                        3.Place the frozen raspberries into the bowl of a food processor or heavy duty blender, along with a little stevia.
                        4. Blend until smooth.
                        5. Eat immediately for a softer texture, or transfer into a freezer-safe container and freeze for 3-4 hours.', 
                  category_ids: [6,7,8,9,10]},
                {user: users.sample, 
                title: 'Strawberry Sorbet', 
                  text: 'Strawberry sorbet is the refreshing, fruity dessert of your dreams! Made with just 3 simple ingredients, 
                        homemade strawberry sorbet is low in calories, gluten-free, and dairy-free! You need: strawberries, stevia, water. 
                        Instruction: 1. Lay out the fresh strawberries over a rimmed baking sheet lined with parchment paper. 
                        2. Freeze the strawberries until completely solid, which should take at least 2-3 hours, but I usually just leave 
                        them in the freezer overnight.
                        3.Place the frozen strawberries into the bowl of a food processor or heavy duty blender, along with a little stevia.
                        4. Blend until smooth.
                        5. Eat immediately for a softer texture, or transfer into a freezer-safe container and freeze for 3-4 hours.', 
                  category_ids: [6,7,8,9,10]},
                {user: users.sample,
                title: 'Tomatoe Soup',
                text:'This easy Cream of Tomato Soup recipe is the perfect fresh tomato soup recipe and freezes and reheats very well. Ready in 
                just 35 minutes!
                Ingredients: 2 tbsp olive oil, 1 red onion, diced, 2 carrots, diced, 3 cloves garlic, minced, 5 vine-ripened tomatoes, diced
                1 tbsp tomato paste, 8 fresh basil leaves,3 cups low sodium chicken broth* (or vegetable broth if vegan/vegetarian)
                2 tsp sea salt, plus more to taste, 1/4 tsp ground black pepper, plus more to taste, 3/4 cup unsweetened almond milk*
                Blend everything together and let it boil.',
                category_ids: [2,3,5]      
                  }])
recipes = Recipe.all

10.times do
  Comment.create!(
    user: users.sample,
    content: COMMENTS.sample,
    recipe: recipes.sample
  )
end
