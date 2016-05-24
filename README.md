# ASCII Clock

Charlie Brooking (@brookingcharlie)

## Implementation

A trigonometry-based implementation using Haskell.

Use the supplied `go` script to run the solution as follows:

```
$ ./go build
Usage: ./go run|test

$ ./go test
SUCCESS: "" -> ["INVALID INPUT"]
SUCCESS: "A" -> ["INVALID INPUT"]
SUCCESS: "10" -> ["INVALID INPUT"]
...

$ echo "25:61" | ./go run
INVALID INPUT
```

## The Challenge

In this challenge you must draw an analogue clock face.

* The time is supplied on stdin in the format hh:mm, followed by a single newline.
  Both hh and mm are padded with a leading 0 (zero) if they are less than 10.
* The analogue clock face representing that time, subject to the following rules,
  should be written on stdout.
* Each hour mark should be drawn with 'o' (Lower-case O).
* The hour mark representing the hour given in the input should be drawn with an 'h'.
* The hour mark representing the minute given in the input should be drawn with an 'm'.
* If the hour and the minute both fall on the same mark, then you should draw it with an 'x'.
* You should round down the minutes past the hour to the nearest 5 for the
  purposes of marking it on the clock (so 23 becomes 20, 39 becomes 35).

Examples:

21:35

```
        o
    o       o

 o             o

h               o

 o             o

    m       o
        o
```

04:59

```
        o
    m       o

 o             o

o               o

 o             h

    o       o
        o
```

## To Win

We will be looking for:

* Clean code
* Evidence of TDD
* A go script
* A readme
* With extra credit for:
* Submitting a solution as a pair

## End Date

Monday 30th May

## To Submit

Feel free to paste a link to your solution github repo into the code challenge
email thread or email one of the Software Shokunin Community directly with a link.  

If you don’t want to post code publicly we still encourage you to give the
challenge a go! Use the problem to exercise your skills, take your brain for a
jog and work those typing muscles!!
