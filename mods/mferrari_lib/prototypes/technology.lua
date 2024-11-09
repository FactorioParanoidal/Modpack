

require("prototypes.sprite")
require("prototypes.style")
require("prototypes.technology-slot-style")

---- RED BLOOD
function make_blood_particle_pictures(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/blood-particle/blood-particle.png",
      line_length = 12,
      width = 10,
      height = 8,
      frame_count = 12,
      variation_count = 7,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2,-1), options.shift),
      hr_version =
      {
        filename = "__base__/graphics/particle/blood-particle/hr-blood-particle.png",
        line_length = 12,
        width = 16,
        height = 16,
        frame_count = 12,
        variation_count = 7,
        tint = options.tint,
        scale = 0.5,
        shift = util.add_shift(util.by_pixel(1.5,-1), options.shift)
      }
    }
  }
end

local blood = table.deepcopy(data.raw["optimized-particle"]["blood-particle"])
blood.name = "maf-blood-particle"
blood.pictures = make_blood_particle_pictures({tint = {r = 200, g = 15, b = 15}})



data.raw["gui-style"]["default"]["ic_title_frame"] = {
  type = "frame_style",
  graphical_set = {},
  horizontally_stretchable = "on",
  padding = 0,
  right_margin = 6,
  top_margin = 4,
  vertical_align = "center"
}



