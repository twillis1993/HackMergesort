# Length 5 array short start

Copying to temporary arrays fine so far. Returned from copy loop for short array. Past `(RET_COPY_TWO)` symbol, into merge logic. In first iteration of merge loop, copying first element of first array (1).

Back at top of merge loop for start of second iteration. Copying first element of second array (2). Destination address set to 21 (correct). Second iteration completed.

Third iteration. Copying second element of first array (3). Not sure that termination condition is being evaluated correctly (logic here starts at @118). Oh wait, it is. Passed branch condition. Copied successfully.

Fourth iteration. Should hit termination condition. Jumping to `COPY_2_LAST`.

Bogus return address pushed on to stack because there is no `(RET_MERGE)`.

In copy routine. Registers initialised correctly.

Ok, `(RET_MERGE)` seems to be the only problem here. 

State of virtual registers is good before starting copy loop.

Still a problem. Seems we just put the wrong return address on there.

Ok, all tests passing.
