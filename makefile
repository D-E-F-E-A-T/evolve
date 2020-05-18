evolve: 
	src/evolve.nim ; nim c src/evolve.nim
install:
	if [ -f src/evolve ]; then cp src/evolve /usr/bin/; fi