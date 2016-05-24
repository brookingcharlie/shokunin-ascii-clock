import Shokunin

test line expected =
  let actual = outputLines line in
  if actual == expected
  then putStrLn $ "SUCCESS: " ++ show line
  else do
    putStrLn $ "FAILURE: " ++ show line
    putStrLn "Expected:"
    mapM_ putStrLn expected
    putStrLn "Actual:"
    mapM_ putStrLn actual

testInvalid line = test line ["INVALID INPUT"]

main = do
  testInvalid ""
  testInvalid "A"
  testInvalid "10"
  testInvalid "2:"
  testInvalid "0:61"
  testInvalid "0:59"
  testInvalid "00:60"
  testInvalid "00:61"
  testInvalid "00:aa"
  testInvalid "24:01"
  testInvalid "99:01"
  test "00:00" [
      "        x        ",
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
  test "01:05" [
      "        o        ",
      "    o       x    ",
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
  test "13:05" [
      "        o        ",
      "    o       x    ",
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
  test "21:35" [
      "        o        ",
      "    o       o    ",
      "                 ",
      " o             o ",
      "                 ",
      "h               o",
      "                 ",
      " o             o ",
      "                 ",
      "    m       o    ",
      "        o        "
    ]
  test "04:59" [
      "        o        ",
      "    m       o    ",
      "                 ",
      " o             o ",
      "                 ",
      "o               o",
      "                 ",
      " o             h ",
      "                 ",
      "    o       o    ",
      "        o        "
    ]
