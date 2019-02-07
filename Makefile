MODELCHR=s
CC=wcc
CFLAGS=-0 -bt=dos -m$(MODELCHR) -I. -q -s -oh -os
LD=wlink
LDFLAGS=system dos option quiet

OBJECTS=dumpcis.obj pcmctrl.obj

dumpcis.exe: $(OBJECTS)
	$(LD) $(LDFLAGS) file { $(OBJECTS) }

%.obj: %.c
	$(CC) $(CFLAGS) $<

xfer:
	nc -w1 -c localhost 12345 < dumpcis.exe

clean:
	rm -rf *.exe *.obj
