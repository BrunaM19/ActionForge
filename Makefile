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

TARGET := $(BIN_DIR)/my_app
ANOTHER_EXEC := $(BIN_DIR)/another_exec  # Adiciona o caminho para o outro executável

SRC     := $(wildcard $(SRC_DIR)/*.c)

OBJ     := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))

TEST_DIR := tests

TESTS := $(wildcard $(TEST_DIR)/*.c)

TEST_BIN := unit_tests

# A regra all agora depende de $(ANOTHER_EXEC) também
all: | $(BIN_DIR) $(TARGET) $(ANOTHER_EXEC)

# Regra para compilar o programa principal
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

# Regra para compilar o outro executável
$(ANOTHER_EXEC): src/another_exec.c
	$(CC) $(CFLAGS) -o $@ $<  # Compila src/another_exec.c e gera bin/another_exec

# Regra para compilar arquivos .c em .o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Cria os diretórios necessários
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
	$(CC) $(CFLAGS) $(TESTS) $(SRC) --coverage -o $(TEST_BIN)
	./$(TEST_BIN)

.PHONY: clean fclean re all tests_run