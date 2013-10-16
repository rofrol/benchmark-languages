import sys
open(sys.argv[2],'w').writelines(sorted(open(sys.argv[1]).readlines()))
