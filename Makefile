##
## EPITECH PROJECT, 2025
## The Makefile
## File description:
## No description
##

CC      := gcc

CFLAGS := -Wall -Wextra -Werror -pedantic

SRC_DIR := src

OBJ_DIR := obj

BIN_DIR := bin

TARGET := $(BIN_DIR)/program

SRC     := $(wildcard $(SRC_DIR)/*.c)

OBJ     := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))

TEST_DIR := tests

TESTS := $(wildcard $(TEST_DIR)/*.c)

TEST_BIN := unit_tests

all: | $(BIN_DIR) $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN_DIR):
	@mkdir -p $@

$(OBJ_DIR):
	@mkdir -p $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -rf $(BIN_DIR)

re: fclean all

tests_run: $(TESTS)
	$(CC) $(CFLAGS) $(TESTS) $(SRC) -Iinclude -lcriterion
		--coverage -o $(TEST_BIN)
	./$(TEST_BIN)

.PHONY: clean fclean re all tests_run