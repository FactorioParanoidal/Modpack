local path = "__mferrari_lib__/"

function flying_saucer_animation()
local anim =  {
    layers =
    {

      {
          filename = path .. "graphics/entity/flying_saucer/light-spritesheet.png",
          line_length = 5,
          width = 3642/5,
          height = 2491/4,
          frame_count = 20,
          animation_speed = 0.12, --18
          direction_count = 1,
          run_mode = "forward",
         -- shift = util.by_pixel(0, 0),
        --  y = variation * 354 * 2,
          scale = 0.5
      },

      {
          filename = path .. "graphics/entity/flying_saucer/spritesheet.png",
          line_length = 5,
          width = 3455/5,
          height = 1796/4,
          frame_count = 20,
          animation_speed = 0.12, --18
          direction_count = 1,
          run_mode = "forward",
          shift = util.by_pixel(0, -180),
        --  y = variation * 354 * 2,
          scale = 0.5
      },

      {
        filename = path .. "graphics/entity/flying_saucer/mask.png",
        flags = { "mask" },
          line_length = 5,
          width = 3455/5,
          height = 1796/4,
          frame_count = 20,
          animation_speed = 0.12,
          run_mode = "forward",
		  direction_count = 1,
          shift = util.by_pixel(0, -180),
          scale = 0.5,
		  apply_runtime_tint = true,
		  tint = {r=5,g=210,b=255, a=1}, --{r=20,g=183,b=255, a=0.8},
		  --tint = {r=153,g=237,b=231},
	 	--draw_as_glow = true, blend_mode = "additive",
      },

	{

          filename = path .. "graphics/entity/flying_saucer/shadow.png",
          draw_as_shadow = true,
          width = 2951/4,
          height = 2073/5,
		  direction_count = 1,
		  shift = util.by_pixel(200, 0),
		  line_length = 4, 
          frame_count = 20,
		  --repeat_count=60,
          animation_speed = 0.12,
          run_mode = "forward",
          --shift = util.by_pixel(36, 10),
          --line_length = 4,
          --y = variation * 406 * 2,
          scale = 0.5

      }
    }
  }
 return anim
end
