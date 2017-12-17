local entity = table.deepcopy(data.raw["construction-robot"]["construction-robot"])
entity.name = "solar-construction-robot"
entity.order = "a[robot]-b[construction-robot]-c[solar-construction-robot]"
entity.minable.result="solar-construction-robot"
local tint = {r=0.8, g=0.8, b=1, a=1}
entity.idle.tint = tint 
entity.idle.hr_version.tint = tint
entity.working.tint = tint
entity.working.hr_version.tint = tint
entity.in_motion.tint = tint
entity.in_motion.hr_version.tint = tint

local item = table.deepcopy(data.raw.item["construction-robot"])
item.name = "solar-construction-robot"
item.order = "a[robot]-b[construction-robot]-c[solar-construction-robot]"
item.place_result = "solar-construction-robot"
item.icons = {
	{
		icon_size = 32,
		icon = "__SolarRobots__/graphics/solar-construction-robot.png"	
	}
}



local recipe = table.deepcopy(data.raw.recipe["construction-robot"])
recipe.name = "solar-construction-robot"
recipe.enabled = true
recipe.ingredients = {{"construction-robot",1}, {"solar-panel-equipment",1}}
recipe.result = "solar-construction-robot"
recipe.icon_size = 32

data:extend{entity, item, recipe}
table.insert(data.raw.technology["construction-robotics"].effects, {type="unlock-recipe", recipe="solar-construction-robot"})

