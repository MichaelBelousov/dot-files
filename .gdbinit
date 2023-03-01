
set print finish no
set history save

set breakpoint pending on
# set debuginfod enabled on

# python
# import sys
# sys.path.append('/home/mike/.config/Epic/GDBPrinters/')
# from UE4Printers import register_ue4_printers
# register_ue4_printers(None)
# print("Registered pretty printers for UE4 classes")
# end

# Bentley ##################################
python
import sys
sys.path.append('/home/mike/work/imodel02-docker/')
import bsiformatters
print("Registered pretty printers for bentley imodel02 classes")
end

skip BentleyM0200::BeJsValue::BeJsValue
skip BentleyM0200::BeJsConst::BeJsConst

############################################

# load installed -gdb.py auto loads (kinda unsafe)
add-auto-load-safe-path /usr/lib/

## temp for chromium
# source /home/mike/work/electron-src/electron/src/tools/gdb/gdbinit

define hex
  printf "%#llx\n", $arg0
end

# because I like it in bash
alias . = source

define vb
  eval "monitor get_vbits %p %d", &$arg0, sizeof($arg0)
end

python
global ex
ex = gdb.execute
end

## example command point
# break blah.cpp:10 if condition
# commands
# silent
# p variable
# continue
# end

## example python stop handler check
# python
# def handle_stop(e):
  # stack = []
  # f = gdb.newest_frame()
  # while f:
    # stack.append(f.name())
    # f = f.older()
  # print(stack)
  # if 'MY_FUNCTION_NAME' in stack:
    # gdb.execute("continue")
# 
# gdb.events.stop.connect(handle_stop)
# end

####### rr

alias rf = reverse-finish

# reverse until
define ru
  # TODO: spread all args
  tbreak $arg0
  reverse-continue
end

source /home/mike/.signals.gdb

