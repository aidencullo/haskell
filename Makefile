modules: modules.hs
	ghc -package containers modules.hs -o modules

clean:
	rm -f modules *.hi *.o

.PHONY: clean
