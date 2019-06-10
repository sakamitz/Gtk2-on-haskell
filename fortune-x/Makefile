# Project: fortune-x

BIN = fortune-x
REQ = $(BIN).glade $(BIN).hs
TMP = $(BIN).o $(BIN).hi

.PHONY: all clean

all: $(BIN)

clean:
	rm -f $(BIN) $(TMP)

$(BIN): $(REQ)
	ghc $(BIN).hs