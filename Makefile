#
#	"sources" folder contains the .cpp files
#	"includes" folder contains the .hpp files
#	
#	Makefile configs
#

CC := g++ -std=gnu++17
CFLAGS := -fsanitize=leak -Wall

INC_FOLDER := -I includes
SRC_FOLDER := sources

EXE_OUT := bin/main
DIST_OUT := bin/dist

SOURCES := $(shell find $(SRC_FOLDER) -type f -name *.cpp)

all: build run

build:
	@mkdir -p bin
	@clear
	$(CC) $(SOURCES) $(INC_FOLDER) -o $(EXE_OUT)

run:
	@./$(EXE_OUT) > log.txt

clean:
	rm bin/*

dist:
	$(CC) $(SOURCES) $(INC_FOLDER) -o $(DIST_OUT) -O3
	$(DIST_OUT)

