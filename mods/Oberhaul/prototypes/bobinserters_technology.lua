
data:extend(
{
  {
    type = "technology",
    name = "long-inserters-2",
    icon = "__bobinserters__/graphics/icons/technology/long-inserters.png",
    icon_size = 128,
    effects =
    {
    },
    prerequisites =
    {
      "long-inserters-1",
      "logistics-3",
    },
    unit =
    {
      count = 500, --DrD 50
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 2}, --DrD 1
        {"chemical-science-pack", 1},
      },
      time = 15
    },
    order = "a-f-a-2",
  },
}
)


data:extend(
{
  {
    type = "technology",
    name = "near-inserters",
    icon = "__bobinserters__/graphics/icons/technology/near-inserters.png",
    icon_size = 128,
    effects =
    {
    },
    prerequisites =
    {
      "logistics",
    },
    unit =
    {
      count = 100, --DrD 25
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 15
    },
    order = "a-f-b-1",
  },
}
)

data:extend(
{
  {
    type = "technology",
    name = "more-inserters-1",
    icon = "__bobinserters__/graphics/icons/technology/more-inserters.png",
    icon_size = 128,
    effects =
    {
    },
    prerequisites =
    {
      "logistics-2",
    },
    unit =
    {
      count = 500, --DrD 25
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 2}, --DrD 1
      },
      time = 15
    },
    order = "a-f-c-1",
  },
}
)

data:extend(
{
  {
    type = "technology",
    name = "more-inserters-2",
    icon = "__bobinserters__/graphics/icons/technology/more-inserters.png",
    icon_size = 128,
    effects =
    {
    },
    prerequisites =
    {
      "more-inserters-1",
      "logistics-3",
    },
    unit =
    {
      count = 900, --DrD 50
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 2}, --DrD 1
        {"chemical-science-pack", 1},
      },
      time = 15
    },
    order = "a-f-c-2",
  },
}
)