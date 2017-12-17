
for i, force in ipairs (game.forces) do
	if force.technology["construction-robotics"].researched == true then
		force.recipe["solar-construction-robot"].enabled = true
	elseif force.technology["logistic-robotics"].researched == true then
		force.recipe["solar-logistic-robot"].enabled = true
	end
end

