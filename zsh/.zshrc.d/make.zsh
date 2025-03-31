# Use system gdb-multiarch instead of broken Arm-bundled GDB.
export GDB_EXEC_OVERRIDE=gdb-multiarch
# Make Make quieter
export MAKEFLAGS="${MAKEFLAGS} -s"
