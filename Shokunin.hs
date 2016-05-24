module Shokunin where

import Data.List
import Data.Maybe
import Data.Time

parse line = parseTimeM False defaultTimeLocale "%H:%M" line :: Maybe TimeOfDay
validate time = time >>= \t -> if todHour t < 24 && todMin t < 60 then Just t else Nothing
x i = round(8 * sin((2 * pi / 12) * i) + 8)
y i = round(-4.644 * cos((2 * pi / 12) * i) + 5)
clockPositions = [(x(i), y(i)) | i <- [0..11]]

clockLines time = lines
  where
    lines = map line [0..10]
    line y = concat(map (\x -> fromMaybe " " (symbol x y)) [0..16])
    symbol x y =
      elemIndex (x, y) clockPositions >>=
      \i -> Just (if i == (todHour time) `mod` 12 then "x" else "o")

outputLines line = case (validate . parse) line of
  Just time -> clockLines time
  Nothing -> ["INVALID INPUT"]
