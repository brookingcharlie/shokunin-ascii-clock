module Shokunin where

import Data.List
import Data.Maybe
import Data.Time

parse line =
  (parseTimeM False defaultTimeLocale "%H:%M" line :: Maybe TimeOfDay) >>=
  \t -> if todHour t < 24 && todMin t < 60 then Just t else Nothing

x i = round(8 * sin((2 * pi / 12) * i) + 8)
y i = round(-4.644 * cos((2 * pi / 12) * i) + 5)
markCoords = [(x(i), y(i)) | i <- [0..11]]

markSymbol time i =
  case [matchesHour, matchesMin] of
    [True, True] -> "x"
    [True, False] -> "h"
    [False, True] -> "m"
    otherwise -> "o"
  where
    matchesHour = i == (todHour time) `mod` 12
    matchesMin = i == ((todMin time) `div` 5) `mod` 12
coordSymbol time x y = elemIndex (x, y) markCoords >>= (\i -> Just (markSymbol time i))

clockLines time = map clockLine [0..10]
  where clockLine y = concat(map (\x -> fromMaybe " " (coordSymbol time x y)) [0..16])

outputLines line = maybe ["INVALID INPUT"] clockLines (parse line)
