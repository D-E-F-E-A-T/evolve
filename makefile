evolve: 
	src/evolve.nim ; nim c src/evolve.nim
	
update:
	git pull
	
install:
	if [ -f src/evolve ]; then cp src/evolve /usr/bin/; fi
	
uninstall:
	if [ -f /usr/bin/evolve ]; then rm -f /usr/bin/evolve; fi
	
clean:
	if [ -f src/evolve ]; then rm -f src/evolve; fi
	
