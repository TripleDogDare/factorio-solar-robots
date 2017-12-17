--control.lua

function debug_print(s)
	game.write_file("mylog.log", s, true) -- appending
end

function pos2str(p)
	return "["..p.x..","..p.y.."]"
end

function boost_energy(boost, name, surface)
	local entities = surface.find_entities_filtered{name=name}
	for _, entity in pairs(entities) do
		--debug_print("\tpos: "..pos2str(entity.position).." energy: "..entity.energy.." name: "..entity.name.."\n")
		entity.energy = entity.energy + boost 
	end
end

PRODUCTION_WATTAGE = 10000
MAX_DARK = 0.85


script.on_event({defines.events.on_tick},
	function (e)
		local nauvis = game.surfaces.nauvis
		local power = math.max(0, math.min(1, 1 - nauvis.darkness / MAX_DARK))
		debug_print("power: "..power.."\n")
		if power > 0 then
			local boost = power * PRODUCTION_WATTAGE / 60
			debug_print("boost: "..boost.."\n")
			local entities
			for _, surface in pairs(game.surfaces) do
				debug_print("surface: "..surface.name.."\n")
				boost_energy(boost, "solar-construction-robot", surface)
				boost_energy(boost, "solar-logistic-robot", surface)
			end
		end
	end
)

