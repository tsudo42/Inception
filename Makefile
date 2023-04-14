# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tsudo <tsudo@student.42tokyo.jp>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/01 00:00:00 by tsudo             #+#    #+#              #
#    Updated: 2023/04/01 00:00:00 by tsudo            ###   ##########         #
#                                                                              #
# **************************************************************************** #

NAME		:= inception

DOCKER_COMP	:= docker-compose -p $(NAME) --project-directory srcs/

RM			:= rm -f
UNAME		:= $(shell uname)

# **************************************************************************** #

ifeq ($(UNAME), Darwin)
	# mac
endif

GR	= \033[32;1m
RE	= \033[31;1m
YE	= \033[33;1m
CY	= \033[36;1m
RC	= \033[0m

ifeq ($(DEBUG_MAKE), 1)
PRINT_INFO = $(warning [$@] <- [$?] ($^))
else
PRINT_INFO :=
endif

# **************************************************************************** #

all: build up

up:
ifeq ($(DETACH), 1)
	$(DOCKER_COMP) up --detach --wait
else
	$(DOCKER_COMP) up
endif

build:
	$(DOCKER_COMP) build --no-cache

logs:
ifeq ($(DETACH), 1)
	$(DOCKER_COMP) logs
else
	$(DOCKER_COMP) logs -f
endif

down:
	$(DOCKER_COMP) down

clean:
	$(DOCKER_COMP) down --rmi all --remove-orphans

reload: clean all

fclean:
	$(DOCKER_COMP) down --rmi all --volumes --remove-orphans

re: fclean all

.PHONY: all up build logs down clean reload fclean re

# **************************************************************************** #
