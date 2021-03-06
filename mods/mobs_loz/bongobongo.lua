--bongobongo by D00Med
-- edit of Stone Monster by PilzAdam


mobs:register_arrow("mobs_loz:beam", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"mobs_loz_beam.png"},
	velocity = 4,
   tail = 1, -- enable tail
   tail_texture = "mobs_loz_beam.png",
   
	hit_player = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 1},
      }, nil)
   end,
   
   hit_mob = function(self, player)
      player:punch(self.object, 1.0, {
         full_punch_interval = 1.0,
         damage_groups = {fleshy = 1},
      }, nil)
   end,

   hit_node = function(self, pos, node)
		minetest.set_node(pos, {name="fire:basic_flame"})
      self.object:remove()
   end,
})

mobs:register_mob("mobs_loz:bongobongo", {
	type = "monster",
	passive = false,
   attack_type = "dogshoot",
   shoot_interval = 2.5,
	dogshoot_switch = 2,
	dogshoot_count = 0,
	dogshoot_count_max =5,
   arrow = "mobs_loz:beam",
   shoot_offset = 1,
	reach = 6,
	damage = 3,
	hp_min = 102,
	hp_max = 125,
	armor = 200,
	collisionbox = {-2, -1.5, -2, 1.5, 1.5, 2},
	visual = "mesh",
	mesh = "bongobongo.b3d",
	textures = {
		{"bongobongo_invis.png"}
	},
	visual_size = {x=1.5, y=1.5},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_oerkki",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = false,
	floats = 2,
   fall_speed = -1,
	view_range = 18,
	drops = {
		{name = "hyruletools:waterstone",
		chance = 1, min = 1, max = 1},
	},
	water_damage = 5,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 10,
		speed_run = 15,
		stand_start = 75,
		stand_end = 95,
		walk_start = 1,
		walk_end = 20,
		run_start = 1,
		run_end = 20,
		punch_start = 21,
		punch_end = 50,
		shoot_start = 50, 
		shoot_end = 75,
	},
	on_die = function(self, pos)
		minetest.add_particlespawner(
			10, --amount
			1, --time
			{x=pos.x-1, y=pos.y-1, z=pos.z-1}, --minpos
			{x=pos.x+1, y=pos.y-1, z=pos.z+1}, --maxpos
			{x=-0, y=-0, z=-0}, --minvel
			{x=0, y=0, z=0}, --maxvel
			{x=-0.5,y=1,z=-0.5}, --minacc
			{x=0.5,y=1,z=0.5}, --maxacc
			1, --minexptime
			1.5, --maxexptime
			20, --minsize
			25, --maxsize
			false, --collisiondetection
			"mobs_loz_light.png" --texture
		)
		minetest.set_node(pos, {name = "default:water_source"})
	end,
	on_rightclick = function(self, clicker)
	local inv = clicker:get_inventory()
		if clicker:get_wielded_item():get_name() == "hyruletools:eye" then
		self.object:set_properties({
				textures = {"bongobongo.png"},
			})
		end
	end,
})

--mobs:register_spawn("mobs_loz:dodongo_boss", {"hyrule_mapgen:dodongo_spawn"}, 20, 0, 7000, 1, 31000)

mobs:register_egg("mobs_loz:bongobongo", "Boss BongoBongo", "default_obsidian.png", 1)