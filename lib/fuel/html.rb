class Fuel::Html < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet # yep, that's it.
end