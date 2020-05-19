evolve: 
	src/evolve.nim ; nim c src/evolve.nim
	
update:
	git pull
	
install:
	if [ -f src/evolve ]; then cp src/evolve /usr/bin/; fi
	
uninstall:
	if [ -f /usr/bin/evolve ]; rm -f /usr/bin/evolve; fi
	
