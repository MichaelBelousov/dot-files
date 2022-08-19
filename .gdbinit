
set print finish no

set history save

python
import sys

sys.path.append('/home/mike/.config/Epic/GDBPrinters/')

from UE4Printers import register_ue4_printers
register_ue4_printers(None)
print("Registered pretty printers for UE4 classes")

end


## temp for chromium
# source /home/mike/work/electron-src/electron/src/tools/gdb/gdbinit

define hex
  printf "%#x\n", $arg0
end

# because I like it in bash
alias . = source

define vb
  eval "monitor get_vbits %p %d", &$arg0, sizeof($arg0)
end

## example command point
# break blah.cpp:10 if condition
# commands
# silent
# p variable
# continue
# end

