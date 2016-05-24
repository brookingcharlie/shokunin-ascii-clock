module Shokunin where

import Data.Time
import Data.Maybe

parse line = parseTimeM False defaultTimeLocale "%H:%M" line :: Maybe TimeOfDay
validate time = time >>= \t -> if todHour t < 24 && todMin t < 60 then Just t else Nothing

outputLines line = case (validate . parse) line of
  Just t -> [show (todHour t), show (todMin t)]
  Nothing -> ["INVALID INPUT"]
