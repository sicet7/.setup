#!/bin/sh

if ! hasCommand uname; then
    echo 'Missing command "uname".';
    exit 1;
fi

if ! hasCommand tr; then
    echo 'Missing command "tr".';
    exit 1;
fi

if ! hasCommand mv; then
    echo 'Missing command "mv".';
    exit 1;
fi

if ! hasCommand ln; then
    echo 'Missing command "ln".';
    exit 1;
fi

if ! hasCommand mkdir; then
    echo 'Missing command "mkdir".';
    exit 1;
fi

if ! hasCommand rm; then
    echo 'Missing command "rm".';
    exit 1;
fi

if ! hasCommand cat; then
    echo 'Missing command "cat".';
    exit 1;
fi
