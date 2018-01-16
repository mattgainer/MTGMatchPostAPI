# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Format.create([
  {name: "Standard"},
  {name: "Modern"},
  {name: "Legacy"}
])

Archetype.create([
  {
    name: "Temur Energy",
    format_id: 1,
    },
  {
    name: "Gifts Control",
    format_id: 1,
  },
  {
    name: "Jeskai Approach",
    format_id: 1,
  },
  {
    name: "TitanShift",
    format_id: 2,
  },
  {
    name: "Grixis Death's Shadow",
    format_id: 2,
  },
  {
    name: "Tron",
    format_id: 2,
  },
  {
    name: "D&T",
    format_id: 3,
  },
  {
    name: "Lands",
    format_id: 3,
  },
  {
    name: "RB Reanimator",
    format_id: 3,
  },
])
Result.create([
  {
    name: "2-0"
  },
  {
    name: "2-1"
  },
  {
    name: "1-1"
  },
  {
    name: "1-2"
  },
  {
    name: "0-2"
  },
])
