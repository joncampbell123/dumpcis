MODELCHR=s
CC=wcl
CFLAGS=-0 -bt=dos -m$(MODELCHR) -I. -q -s -oh -os
LD=wlink
LDFLAGS=system dos option quiet option map

all: dumpcis.exe dumppreg.exe

dumpcis.exe: dumpcis.obj pcmctrl.obj cisparse.obj
	$(LD) $(LDFLAGS) file { dumpcis.obj pcmctrl.obj cisparse.obj }

dumppreg.exe: dumppreg.obj pcmctrl.obj
	$(LD) $(LDFLAGS) file { dumppreg.obj pcmctrl.obj }

%.obj: %.c
	$(CC) $(CFLAGS) -c $<

xfer:
	nc -w1 -c localhost 12345 < dumpcis.exe

xfer-reg:
	nc -w1 -c localhost 12345 < dumppreg.exe

clean:
	rm -rf *.exe *.obj *.map

clean-wmake: .SYMBOLIC
	del *.exe *.obj *.map
