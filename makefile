CC = gcc
INCLUDE_DIR = include/
INCLUDE = -I${INCLUDE_DIR}
LIB_DIR = /Users/jake/Dev/flow/lib
LIB = -L${LIB_DIR}
LIBS = -lglfw3 -lstdc++
SRCS_DIR = src/
BIN_DIR = bin/
.PHONY = all clean
OUTPUT = flow
SRCS = $(wildcard ${SRCS_DIR}*.cpp) 
OBJS = $(SRCS:%.cpp=%.o) 

build : clean all objects

all : ${OUTPUT}

clean : 
	rm bin/*

objects : ${OBJS}
	@echo ${OBJS}

${OUTPUT} : ${OBJS} 
	${CC} ${LIB} ${LIBS} ${BIN_DIR}$(notdir ${OBJS}) -o bin/${OUTPUT} -v


%.o : %.cpp 
	 ${CC} -c ${INCLUDE} $< -o ${BIN_DIR}$(notdir $@)
 