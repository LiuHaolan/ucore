# Markdown notes for OS

## 1, the ucore image
bootloader in the first segment of the disk
the Kernel ELF in the second segment of the disk

## 2, the boot process
when the CPU boots it loads the BIOS into memory and executes it
 
the BIOS intializes devices, sets of the interrupt routines, and
reads the first sector of the boot device(e.g., hard-drive) into memory and jumps to it. This is the boot loader
 

Here, control starts in bootasm.s -- which sets up protected mode,
 and a stack so C code then run, then calls bootmain()
 
 bootmain() in this file takes over, reads in the kernel and jumps to it.
