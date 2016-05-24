module Shokunin where

import Data.Time
import Data.Maybe

parse line = parseTimeM False defaultTimeLocale "%H:%M" line :: Maybe TimeOfDay
validate time = time >>= \t -> if todHour t < 24 && todMin t < 60 then Just t else Nothing

clockLines time = [
    "        h        ",
    "    o       o    ",
    "                 ",
    " o             o ",
    "                 ",
    "o               o",
    "                 ",
    " o             o ",
    "                 ",
    "    o       o    ",
    "        o        "
  ]

outputLines line = case (validate . parse) line of
  Just time -> clockLines time
  Nothing -> ["INVALID INPUT"]
