# make file generated by gryphel build system (which is trash, btw)

mk_COptionsCommon = -c -Wall -Wmissing-prototypes -Wno-uninitialized -Wundef -Wstrict-prototypes -Icfg/ -Isrc/
mk_COptionsOSGLU = $(mk_COptionsCommon) -Os
mk_COptions = $(mk_COptionsCommon) -Os

.PHONY: TheDefaultOutput clean

TheDefaultOutput : minivmac.exe

bld/OSGLUWIN.o : src/UI/WIN32/OSGLUWIN.c src/LANG/STRCNENG.h cfg/STRCONST.h src/INTLCHAR.h src/COMOSGLU.h src/CONTROLM.h cfg/CNFGGLOB.h
	gcc "src/UI/WIN32/OSGLUWIN.c" -o "bld/OSGLUWIN.o" $(mk_COptions)
bld/GLOBGLUE.o : src/GLOBGLUE.c cfg/CNFGGLOB.h
	gcc "src/GLOBGLUE.c" -o "bld/GLOBGLUE.o" $(mk_COptions)
bld/M68KITAB.o : src/M68K/M68KITAB.c cfg/CNFGGLOB.h
	gcc "src/M68K/M68KITAB.c" -o "bld/M68KITAB.o" $(mk_COptions)
bld/MINEM68K.o : src/M68K/MINEM68K.c cfg/CNFGGLOB.h
	gcc "src/M68K/MINEM68K.c" -o "bld/MINEM68K.o" $(mk_COptions)
bld/VIAEMDEV.o : src/VIAEMDEV.c cfg/CNFGGLOB.h
	gcc "src/VIAEMDEV.c" -o "bld/VIAEMDEV.o" $(mk_COptions)
bld/IWMEMDEV.o : src/IWMEMDEV.c cfg/CNFGGLOB.h
	gcc "src/IWMEMDEV.c" -o "bld/IWMEMDEV.o" $(mk_COptions)
bld/SCCEMDEV.o : src/SCCEMDEV.c cfg/CNFGGLOB.h
	gcc "src/SCCEMDEV.c" -o "bld/SCCEMDEV.o" $(mk_COptions)
bld/RTCEMDEV.o : src/RTCEMDEV.c cfg/CNFGGLOB.h
	gcc "src/RTCEMDEV.c" -o "bld/RTCEMDEV.o" $(mk_COptions)
bld/ROMEMDEV.o : src/ROMEMDEV.c cfg/CNFGGLOB.h
	gcc "src/ROMEMDEV.c" -o "bld/ROMEMDEV.o" $(mk_COptions)
bld/SCSIEMDV.o : src/SCSIEMDV.c cfg/CNFGGLOB.h
	gcc "src/SCSIEMDV.c" -o "bld/SCSIEMDV.o" $(mk_COptions)
bld/SONYEMDV.o : src/SONYEMDV.c cfg/CNFGGLOB.h
	gcc "src/SONYEMDV.c" -o "bld/SONYEMDV.o" $(mk_COptions)
bld/SCRNEMDV.o : src/SCRNEMDV.c cfg/CNFGGLOB.h
	gcc "src/SCRNEMDV.c" -o "bld/SCRNEMDV.o" $(mk_COptions)
bld/MOUSEMDV.o : src/MOUSEMDV.c cfg/CNFGGLOB.h
	gcc "src/MOUSEMDV.c" -o "bld/MOUSEMDV.o" $(mk_COptions)
bld/KBRDEMDV.o : src/KBRDEMDV.c cfg/CNFGGLOB.h
	gcc "src/KBRDEMDV.c" -o "bld/KBRDEMDV.o" $(mk_COptions)
bld/SNDEMDEV.o : src/SNDEMDEV.c cfg/CNFGGLOB.h
	gcc "src/SNDEMDEV.c" -o "bld/SNDEMDEV.o" $(mk_COptions)
bld/PROGMAIN.o : src/PROGMAIN.c cfg/CNFGGLOB.h
	gcc "src/PROGMAIN.c" -o "bld/PROGMAIN.o" $(mk_COptions)

ObjFiles = \
	bld/MINEM68K.o \
	bld/OSGLUWIN.o \
	bld/GLOBGLUE.o \
	bld/M68KITAB.o \
	bld/VIAEMDEV.o \
	bld/IWMEMDEV.o \
	bld/SCCEMDEV.o \
	bld/RTCEMDEV.o \
	bld/ROMEMDEV.o \
	bld/SCSIEMDV.o \
	bld/SONYEMDV.o \
	bld/SCRNEMDV.o \
	bld/MOUSEMDV.o \
	bld/KBRDEMDV.o \
	bld/SNDEMDEV.o \
	bld/PROGMAIN.o \


bld/main.res: src/UI/WIN32/main.rc
	windres.exe -i "src/UI/WIN32/main.rc" --input-format=rc -o "bld/main.res" -O coff  --include-dir SRC


minivmac.exe : $(ObjFiles) bld/
	gcc \
		-o "minivmac.exe" \
		$(ObjFiles) -mwindows -lwinmm -lole32 -luuid

clean :
	rm -f $(ObjFiles)
	rm -f "bld/"
	rm -f "minivmac.exe"
