# Length 3 case

## Mergesort call 1

Arguments are fine.

Past divison, so far so good.

Problem with recursive calls. Copied arrays are getting overwritten by merge copies.

## Mergesort call 2 (call on (2), first element)

This call exits fine.

## Mergesort call 3 (call on (1,3), second array)

Returning result of division correctly.

## Mergesort call 4 (call on (1), first half of second array)

Exits correctly.

## Mergesort call 5 (call on (3), second half of second array)

Exits correctly.

## Merge call on 1 and 3

Copy 1 correctly. Jumping to copy_2_last correctly. Copied 3 correctly.


## Resolving mergesort call 3

Might be a problem with retrieving the return address - yes there, is! Returning to ROM[21], rather than after (RET_MERGESORT_2).

Problem is probably with return address, peeking 2 below stack top.

breakpoint PC 181


