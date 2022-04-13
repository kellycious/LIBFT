# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: khuynh <khuynh@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/11 23:10:17 by khuynh            #+#    #+#              #
#    Updated: 2022/04/13 17:51:52 by khuynh           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
SRCS =  \
		srcs/ft_memset.c     \
        srcs/ft_memmove.c    \
        srcs/ft_memchr.c     \
        srcs/ft_memcmp.c     \
        srcs/ft_memcpy.c     \
        srcs/ft_bzero.c      \
        srcs/ft_atoi.c       \
        srcs/ft_strlen.c     \
        srcs/ft_strlcpy.c    \
        srcs/ft_strlcat.c    \
        srcs/ft_strchr.c     \
        srcs/ft_strrchr.c    \
        srcs/ft_strnstr.c    \
        srcs/ft_strncmp.c    \
        srcs/ft_atoi.c       \
        srcs/ft_isalnum.c    \
        srcs/ft_isdigit.c    \
        srcs/ft_isalpha.c    \
        srcs/ft_isascii.c    \
        srcs/ft_isprint.c    \
        srcs/ft_tolower.c    \
        srcs/ft_toupper.c    \
        srcs/ft_calloc.c     \
        srcs/ft_strdup.c     \
        srcs/ft_itoa.c       \
        srcs/ft_substr.c     \
        srcs/ft_strjoin.c    \
        srcs/ft_strtrim.c    \
        srcs/ft_split.c      \
        srcs/ft_strmapi.c    \
        srcs/ft_putchar_fd.c \
        srcs/ft_putstr_fd.c  \
        srcs/ft_putendl_fd.c \
        srcs/ft_putnbr_fd.c		
			
BONUS = \
		bonus/ft_lstmap.c		\
		bonus/ft_lstlast.c		\
		bonus/ft_lstnew.c		\
		bonus/ft_lstadd_back.c  \
		bonus/ft_lstadd_front.c	\
		bonus/ft_lstclear.c		\
		bonus/ft_lstdelone.c	\
		bonus/ft_lstiter.c		\
		bonus/ft_lstsize.c		\
		
HEADERS = includes
OBJS = ${SRCS:.c=.o}
BONUS_OBJS = ${BONUS:.c=.o}
CC = gcc
CFLAGS = -Wall -Werror -Wextra 
RM = rm -f
AR = ar rcs

# COLORS
RESET=        \033[0m
DARK=        \033[1;32m
RED=        \033[31m
GREEN=        \033[32m
YELLOW=        \033[33m
BLUE=        \033[34m
MAGENTA=    \033[35m
CYAN=        \033[36m
WHITE=        \033[37m
BOLDBLACK=    \033[1m\033[30m
BOLDRED=    \033[1m\033[31m
BOLDWHITE=    \033[1m\033[37m

all: $(NAME)

.c.o :
	@echo "$(MAGENTA)compiling... $(RESET)"
	${CC} ${CFLAGS} -c $< -o ${<:.c=.o} -I ${HEADERS}

${NAME}: ${OBJS}
	@echo "$(GREEN)compiling done:$(BOLDWHITE) 100% $(RESET)"
	@echo "$(YELLOW)archiving object files... $(RESET)"
	ar rcs ${NAME} ${OBJS}
	@echo "$(GREEN)archiving done:$(BOLDWHITE) 100% $(RESET)"

bonus: ${BONUS_OBJS}
	@echo "$(YELLOW)archiving bonus object files... $(RESET)"
		ar rcs ${NAME} ${BONUS_OBJS}
	@echo "$(GREEN)archiving done:$(BOLDWHITE) 100% $(RESET)"
	
clean:
	@echo "$(CYAN)cleaning... $(RESET)"
	rm -f ${OBJS} ${BONUS_OBJS}
	@echo "$(GREEN)cleaning done:$(BOLDWHITE) 100% $(RESET)"
	
fclean: clean
	rm -r ${NAME}

re: fclean all

.PHONY: all clean fclean re bonus


