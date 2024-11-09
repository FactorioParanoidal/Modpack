
data.raw["gui-style"]["default"]["ic_title_frame"] = {
  type = "frame_style",
  graphical_set = {},
  horizontally_stretchable = "on",
  padding = 0,
  right_margin = 6,
  top_margin = 4,
  vertical_align = "center"
}


data:extend({
{
  type = "speech-bubble",
  name = "mf_speech_bubble",
  style = "compilatron_speech_bubble",
 -- wrapper_flow_style = "compilatron_speech_bubble_wrapper",
  fade_in_out_ticks = 60 * 0.5,
  flags = {"not-on-map", "placeable-off-grid"},
  hidden = true
}
})
