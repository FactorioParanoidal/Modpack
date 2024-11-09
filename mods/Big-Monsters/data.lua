
mf_hp_multiplier  = settings.startup["bm-big-enemy-hp-multiplier"].value
mf_hp_variant     = settings.startup["bm-big-enemy-hp-variant"].value
mf_dmg_multiplier = settings.startup["bm-enemy-damage-multiplier"].value

require "__mferrari_lib__/prototypes/bosses"
require "__mferrari_lib__/prototypes/bosses_worms"
require "__mferrari_lib__/prototypes/flying_saucer"
require "__mferrari_lib__/prototypes/sounds"
require "__mferrari_lib__/prototypes/bosses_projectiles"
require "__mferrari_lib__/prototypes/loot"
colors = require("__mferrari_lib__/colors")

mf_fh_base_name       = "bm_fake_human"
mf_fh_add_spawner     = false
mf_fh_add_turrets     = true
mf_fh_add_nuker       = true
mf_fh_add_explosive   = true
mf_fh_mechanicus_skin = false
require "__mferrari_lib__/prototypes/fake_humans"


path = '__Big-Monsters__/'
require "prototypes.explosion" --electric blast
require "prototypes.turrets"
require "prototypes.entities"

