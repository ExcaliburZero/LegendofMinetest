
--load api
dofile(minetest.get_modpath("vehicles").."/api.lua")

--register vehicles

minetest.register_entity("vehicles:horse", {
	visual = "mesh",
	mesh = "horse.x",
	textures = {"vehicles_horse.png"},
	velocity = 15,
	acceleration = -5,
	stepheight = 1.5,
	hp_max = 200,
	physical = true,
	collisionbox = {-0.5, 0, -0.5, 0.5, 1.3, 0.5},
	on_rightclick = function(self, clicker)
		if self.driver and clicker == self.driver then
		object_detach(self, clicker, {x=1, y=0, z=1})
		elseif not self.driver then
		object_attach(self, clicker, {x=0, y=8, z=0}, true, {x=0, y=4, z=0})
		end
	end,
	on_punch = function(self, puncher)
		if not self.driver then
		local name = self.object:get_luaentity().name
		local pos = self.object:getpos()
		minetest.env:add_item(pos, name.."_spawner")
		self.object:remove()
		end
		if self.object:get_hp() == 0 then
		if self.driver then
		object_detach(self, self.driver, {x=1, y=0, z=1})
		end
		explode(self, 5)
		end
	end,
	on_step = function(self, dtime)
	if self.driver then
		object_drive(self, dtime, 13, 0.5, false, nil, nil, {x=75, y=100}, {x=25, z=25}, "jump", {x=25, y=75}, {}, 0, 1.57)
		return false
		end
		return true
	end,
})

register_vehicle_spawner("vehicles:horse", "Horse", "vehicles_horse_inv.png")