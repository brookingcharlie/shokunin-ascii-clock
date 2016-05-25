module Shokunin where

import Data.List
import Data.Maybe
import Data.Time

parse line =
  (parseTimeM False defaultTimeLocale "%H:%M" line :: Maybe TimeOfDay) >>=
  \t -> if todHour t < 24 && todMin t < 60 then Just t else Nothing

x i = round(8 * sin((2 * pi / 12) * i) + 8)
y i = round(-4.644 * cos((2 * pi / 12) * i) + 5)
markCoordinates = [(x(i), y(i)) | i <- [0..11]]

markSymbol time i =
  if matchesHour && matchesMin then "x"
  else if matchesHour then "h"
  else if matchesMin then "m"
  else "o"
  where
    matchesHour = i == (todHour time) `mod` 12
    matchesMin = i == ((todMin time) `div` 5) `mod` 12
coordinateSymbol time x y = elemIndex (x, y) markCoordinates >>= (\i -> Just (markSymbol time i))

clockLines time = lines
  where
    lines = map line [0..10]
    line y = concat(map (\x -> fromMaybe " " (coordinateSymbol time x y)) [0..16])

outputLines line = maybe ["INVALID INPUT"] clockLines (parse line)
