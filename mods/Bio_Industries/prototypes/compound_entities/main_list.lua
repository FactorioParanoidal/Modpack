--~ log("Entered file prototypes/compound_entities.lua")
------------------------------------------------------------------------------------
--  This file contains the data of all compound entities. It will be used in the  --
--  data stage to create the prototypes for the hidden enitities, and during the  --
--  control stage to combine the compound entities and pass on any optional data  --
--  that may be required by the scripts.
------------------------------------------------------------------------------------
require("util")

-- During the data stage, we want to remove compound entities (or some of their
-- hidden entities) that have been disabled via startup setting, so that we don't
-- spam the game with unnecessary prototypes.
-- During the control stage, we build a separate list of all the compound entities
-- that are available and store it in a global table. We'll need a complete list in
-- this case, so that we can keep track of the removed prototypes and clean out the
-- obsolete tables. We can achieve this by checking for "script" or "data".
-- However, we may also need a complete list during the data stage (e.g. for finding
-- recipes, items etc. of removed compound entity parts). In this case, we'll need
-- to pass on a valid argument (anything not nil) to this function.

local ret = {}

-- Map short handles for hidden entities in the table to actual prototype types
ret.HE_map = {
  ammo_turret = "ammo-turret",
  assembler = "assembling-machine",
  boiler = "boiler",
  lamp = "lamp",
  panel = "solar-panel",
  connector = "electric-pole",
  pole = "electric-pole",
  radar = "radar"
}

ret.HE_map_reverse = {}
for k, v in pairs(ret.HE_map) do
  ret.HE_map_reverse[v] = k
end
--~ log("ret.HE_map_reverse: " .. serpent.block(ret.HE_map_reverse))
------------------------------------------------------------------------------------
-- List of compound entities
-- Key:                 name of the base entity
-- tab:                 name of the global table where data of these entity are stored
-- hidden:              table containing the hidden entities needed by this entity
--                      Key:    handle of the hidden entity
--                      Value:  data needed when placing the hidden entity
-- localize_entity:     Pointer to an entity name -- e.g. {"entity-name.NAME"} -- that
--                      will be used to localize this entity. This is needed when the
--                      same string is used for differently named entity names, such
--                      as "legacy-straight-rail"/"legacy-curved-rail"/"rail-planner".
-- new_base_name:       If the placed entity is used as overlay, it will be replaced
--                      with this entity.
-- add_global_tables    table of names of other tables in global that are needed by
--                      this entity
-- add_global_values    table of names and values of variables that should be added to
--                      the global table if this compound entity is used
-- optional:            Any optional data affecting the compound entity that must be
  --                      stored in the global table.
------------------------------------------------------------------------------------
-- Data of hidden entities
-- name:                name of the entity prototype
-- type:                prototype type
-- base_offset:         Position of the hidden entity relative to the base entity
------------------------------------------------------------------------------------

-- We add full data for the base entities because their type can't be deduced from
-- their name. For the hidden entities, we just create the fields and fill in any
-- optional data that may be needed. Name and type of the prototypes will be added
-- later automatically.
ret.compound_entities = {
  ["bi-bio-farm"] = {
    tab = "bi_bio_farm_table",
    base = {
      name = "bi-bio-farm",
      type = ret.HE_map.assembler,
    },
    hidden = {
      connector = {
        name = "bi-bio-farm-hidden-connector_pole",
        type = ret.HE_map.pole,
        -- base_offset = {x = 1.0, y = 1.0},
        -- base_offset = (script and script.active_mods["_debug"] or mods and mods["_debug"]) and
                      --~ {x = 1.0, y = 1.0} or {x = 0, y = 0},
      },
      pole = {
        -- name = "bi-bio-farm-hidden-pole",
        -- type = ret.HE_map.pole,
        -- base_offset = {x = 1.0, y = 1.0},
        base_offset = (script and script.active_mods["_debug"] or mods and mods["_debug"]) and
                      {x = 1.0, y = 1.0} or {x = 0, y = 0},
      },
      panel = {
        -- name = "bi-bio-farm-hidden-panel",
        -- type = ret.HE_map.panel,
      },
      lamp = {
        -- name = "bi-bio-farm-hidden-lamp",
        -- type = ret.HE_map.lamp
      },
    }
  },
  ["bi-bio-garden"] = {
    tab = "bi_bio_garden_table",
    base = {
      name = "bi-bio-garden",
      type = ret.HE_map.assembler,
    },
    hidden = {
      pole = {
        -- name = "bi-bio-garden-hidden-pole",
        -- type = ret.HE_map.pole,
      },
    }
  },
  ["bi-bio-solar-farm"] = {
    tab = "bi_solar_farm_table",
    base = {
      name = "bi-bio-solar-farm",
      type = ret.HE_map.panel,
    },
    hidden = {
      pole = {
        -- name = "bi-solar-farm-hidden-pole",
        -- type = ret.HE_map.pole,
      },
    }
  },
  ["bi-solar-boiler"] = {
    tab = "bi_solar_boiler_table",
    base = {
      name = "bi-solar-boiler",
      type = ret.HE_map.boiler,
    },
    hidden = {
      panel = {
        -- name = "bi-solar-boiler-hidden-panel",
        -- type = ret.HE_map.panel,
      },
      pole = {
        -- name = "bi-solar-boiler-hidden-pole",
        -- type = ret.HE_map.pole,
      },
    }
  },
}

------------------------------------------------------------------------------------
--     Fill in the missing names and types of the hidden entities' prototypes!    --
------------------------------------------------------------------------------------
for c_name, c_data in pairs(ret.compound_entities) do
--~ log("c_name: " .. serpent.block(c_name))
  for h_key, h_data in pairs(c_data.hidden) do
--~ log(string.format("h_key: %s\th_data: %s", h_key, serpent.block(h_data)))
    h_data.name = h_data.name or c_name .. "-hidden-" .. h_key
    h_data.type = h_data.type or ret.HE_map[h_key]
  end
end
--~ log("ret.compound_entities: " .. serpent.block(ret.compound_entities))

------------------------------------------------------------------------------------
--  Remove entries for disabled compound entities. Do this before making copies!  --
------------------------------------------------------------------------------------
ret.get_HE_list = function(get_complete_list)
  if get_complete_list or script then
    --~ log("Preserving complete list!")

  else
    --~ log("Removing obsolete entities from the list!")

    local settings = settings.startup
    local function get_settings(name)
      return settings[name] and settings[name].value
    end

    -- Solar additions
    --~ if not BI.Settings.BI_Solar_Additions then
    if not get_settings("BI_Solar_Additions") then
      --~ log("Solar additions have been disabled!")
      for e, entry in ipairs({"bi-bio-solar-farm", "bi-solar-boiler"}) do
        ret.compound_entities[entry] = nil
        --~ log("Removed " .. entry .. " from compound_entity list!")
      end
    end

    -- Easy Bio gardens: We only need the hidden pole if the setting is enabled. (But we
    -- want to keep the rest of the table even if the setting is disabled.)
    --~ if not BI.Settings.BI_Easy_Bio_Gardens then
    if not get_settings("BI_Easy_Bio_Gardens") then
      --~ log("\"Easy Bio gardens\" are disabled!")
      ret.compound_entities["bi-bio-garden"].hidden.pole = nil
      --~ log("Removed hidden pole from list of hidden entities!")
    end
  end

  return ret.compound_entities
end

return ret
