-- Chuchu by D00Med
-- edit of Dirt Monster by PilzAdam

mobs:register_mob("mobs_loz:chuchu", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 2,
	hp_min = 3,
	hp_max = 27,
	armor = 100,
	collisionbox = {-0.2, -0.2, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "mobs_chuchu.b3d",
	textures = {
		{"mobs_chuchu.png"},
	},
	blood_texture = "hyruletools_yellowstar.png",
	makes_footstep_sound = false,
	view_range = 5,
	walk_velocity = 1,
	run_velocity = 1,
	jump = false,
	drops = {
		{name = "hyruletools:heart",
		chance = 1, min = 3, max = 5},
		{name = "maptools:silver_coin",
		chance = 1, min = 1, max = 3},
	},
	water_damage = -1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 3,
		stand_end = 22,
		walk_start = 3,
		walk_end = 22,
		run_start = 3,
		run_end = 22,
		punch_start = 25,
		punch_end = 42,
	},
})

mobs:register_spawn("mobs_loz:chuchu", {"default:dirt_with_grass", "default:dirt_with_dry_grass", "default:dirt_with_grass3"}, 7, 0, 7000, 2, 31000)

mobs:register_egg("mobs_loz:chuchu", "chuchu", "hyruletools_spark.png", 1)