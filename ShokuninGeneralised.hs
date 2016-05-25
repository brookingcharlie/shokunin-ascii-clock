module ShokuninGeneralised where

import Data.List
import Data.Maybe
import Data.Time

hRadius = 8
vRadius = 5
hScale = 1.0
vScale = 0.9

parseValidTime input =
  (parseTimeM False defaultTimeLocale "%H:%M" input :: Maybe TimeOfDay) >>=
  \t -> if todHour t < 24 && todMin t < 60 then Just t else Nothing

markCoords = [(x(i), y(i)) | i <- [0..11]]
  where
    x i = round(hScale * (fromIntegral hRadius) * sin((2 * pi / 12) * i) + (fromIntegral hRadius))
    y i = round(vScale * (fromIntegral (-vRadius)) * cos((2 * pi / 12) * i) + (fromIntegral vRadius))

markChar time i =
  case [matchesHour, matchesMin] of
    [True, True] -> 'x'
    [True, False] -> 'h'
    [False, True] -> 'm'
    otherwise -> 'o'
  where
    matchesHour = i == (todHour time) `mod` 12
    matchesMin = i == ((todMin time) `div` 5) `mod` 12

coordChar time x y = maybe ' ' (markChar time) (elemIndex (x, y) markCoords)

clockLines time = [[coordChar time x y | x <- [0..(hRadius * 2)]] | y <- [0..(vRadius * 2)]]

outputLines input = maybe ["INVALID INPUT"] clockLines (parseValidTime input)
