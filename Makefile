CC      = gcc
CFLAGS  = -std=c11 -Wall -Wextra -fPIC $(shell pkg-config --cflags gtk+-3.0)
LDFLAGS = $(shell pkg-config --libs gtk+-3.0) -Wl,--as-needed

NAME    = HelloPlugin

.PHONY: all install clean

all: HelloPlugin/$(NAME).so

HelloPlugin/$(NAME).so: HelloPlugin/$(NAME).c
	$(CC) $(CFLAGS) -shared -o $@ $< $(LDFLAGS)

install: HelloPlugin/$(NAME).so
	mkdir -p ~/.config/notetux/plugins/$(NAME)
	cp HelloPlugin/$(NAME).so ~/.config/notetux/plugins/$(NAME)/

clean:
	rm -f HelloPlugin/$(NAME).so
