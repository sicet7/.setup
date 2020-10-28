#!/bin/sh

promptUserY()
{
    read -p "$1 (Y/n): " yn
    if [ -z "$yn" ]; then
        yn="y"
    else
        yn=$(echo -n "$yn" | tr '[:upper:]' '[:lower:]');
    fi
    if [ "$yn" = "y" ]; then
        return 0
    else
        return 1
    fi
}

promptUserN()
{
    read -p "$1 (y/N): " ny
    if [ -z "$ny" ]; then
        ny="n"
    else
        yn=$(echo -n "$ny" | tr '[:upper:]' '[:lower:]');
    fi
    if [ "$ny" = "n" ]; then
        return 0
    else
        return 1
    fi
}
