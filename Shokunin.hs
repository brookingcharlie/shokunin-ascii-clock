module Shokunin where

import Data.List
import Data.Maybe
import Data.Time

parseValidTime input =
  (parseTimeM False defaultTimeLocale "%H:%M" input :: Maybe TimeOfDay) >>=
  \t -> if todHour t < 24 && todMin t < 60 then Just t else Nothing

markCoords = [(x(i), y(i)) | i <- [0..11]]
  where
    x i = round(8 * sin((2 * pi / 12) * i) + 8)
    y i = round(-4.644 * cos((2 * pi / 12) * i) + 5)

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

clockLines time = [[coordChar time x y | x <- [0..16]] | y <- [0..10]]

outputLines input = maybe ["INVALID INPUT"] clockLines (parseValidTime input)
