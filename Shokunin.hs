module Shokunin where

import Data.Time
import Data.Maybe

parse line = parseTimeM False defaultTimeLocale "%H:%M" line :: Maybe TimeOfDay
validate time = time >>= \t -> if todHour t < 24 && todMin t < 60 then Just t else Nothing
hourSymbol time hour = if (todHour time) == hour then 'h' else 'o'
x h = round(8 * sin((2 * pi / 12) * h) + 8)
y h = round(-4.644 * cos((2 * pi / 12) * h) + 5)
hourPositions = [(x(h), y(h)) | h <- [0..23]]

clockLines time = lines
  where
    lines = map line [0..10]
    line y = concat(map (\x -> symbol x y) [0..16])
    symbol x y = if elem (x, y) hourPositions then "o" else " "

outputLines line = case (validate . parse) line of
  Just time -> clockLines time
  Nothing -> ["INVALID INPUT"]
