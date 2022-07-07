##
## EPITECH PROJECT, 2022
## asmminilibc
## File description:
## Makefile
##

NASM		= nasm
NASMFLAGS	= -f elf64

CC		= ld
CFLAGS	= -fPIC -shared

RM		= rm -f

NAME	= libasm.so

SRC		= src/strlen.asm			\
		  src/strchr.asm			\
		  src/strrchr.asm			\
		  src/memset.asm			\
		  src/memcpy.asm			\
		  src/strcmp.asm			\

OBJ		= $(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJ)
	 $(CC) $(CFLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

.PHONY: all clean fclean re
