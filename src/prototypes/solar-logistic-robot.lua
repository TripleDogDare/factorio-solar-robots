local entity = table.deepcopy(data.raw["logistic-robot"]["logistic-robot"])
entity.name = "solar-logistic-robot"
entity.order = "a[robot]-b[logistic-robot]-c[solar-logistic-robot]"
entity.minable.result = "solar-logistic-robot"
local tint = {r=0.8, g=0.8, b=1, a=1}
entity.idle.tint = tint 
entity.idle.hr_version.tint = tint
entity.idle_with_cargo.tint = tint
entity.idle_with_cargo.hr_version.tint = tint
entity.in_motion.tint = tint
entity.in_motion.hr_version.tint = tint
entity.in_motion_with_cargo.tint = tint
entity.in_motion_with_cargo.hr_version.tint = tint

local item = table.deepcopy(data.raw.item["logistic-robot"])
item.name = "solar-logistic-robot"
item.order = "a[robot]-a[logistic-robot]-a[solar-logistic-robot]"
item.place_result = "solar-logistic-robot"
item.icons = {
	{
		--tint = {r = 0, g = 0, b = 1, a = 0.5},
		icon = "__SolarRobots__/graphics/solar-logistic-robot.png",
		icon_size = 32
	}
}

local recipe = table.deepcopy(data.raw.recipe["logistic-robot"])
recipe.name = "solar-logistic-robot"
recipe.enabled = true
recipe.ingredients = {{"logistic-robot",1}, {"solar-panel-equipment",1}}
recipe.result = "solar-logistic-robot"
recipe.icons = item.icons
recipe.icon_size = 32

data:extend{entity, item, recipe}
table.insert(data.raw.technology["logistic-robotics"].effects, {type="unlock-recipe", recipe="solar-logistic-robot"})

