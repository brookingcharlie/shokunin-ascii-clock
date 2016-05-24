import Shokunin

test line expected =
  let actual = outputLines line in
  if actual == expected
  then putStrLn $ "SUCCESS: " ++ show line ++ " -> " ++ show actual
  else putStrLn $ "FAILURE: " ++ show line ++ " -> " ++ show actual ++ " /= " ++ show expected

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
  test "00:59" ["0", "59"]
