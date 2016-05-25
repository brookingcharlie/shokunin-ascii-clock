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

markSymbol time x y =
  elemIndex (x, y) markCoordinates >>=
  \i -> Just (if i == (todHour time) `mod` 12 then "x" else "o")

clockLines time = lines
  where
    lines = map line [0..10]
    line y = concat(map (\x -> fromMaybe " " (markSymbol time x y)) [0..16])

outputLines line = maybe ["INVALID INPUT"] clockLines (parse line)
