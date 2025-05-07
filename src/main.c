/*
** EPITECH PROJECT, 2025
** The Main Function
** File description:
** Chocolatine - DevOps
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(void)
{
    char *str = "The program is working!";

    write(1, &str, sizeof(str));
    return 0;
}