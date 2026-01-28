modules: modules.hs
	ghc -package containers modules.hs -o modules 2>&1 | grep -v "ld_classic is deprecated"

run: modules
	./modules

clean:
	rm -f modules *.hi *.o

.PHONY: clean run
