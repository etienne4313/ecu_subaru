PWD := $(shell pwd)
PROG := $(PWD)/$(shell basename `pwd`)

#
# Project files
#
DRIVER = subaru_36_2_2_2
INCLUDE = $(PWD)
common_objects := $(patsubst %.c,%.o,$(wildcard $(PWD)/*.c)) $(patsubst %.c,%.o,$(wildcard $(PWD)/driver/$(DRIVER).c)) $(patsubst %.c,%.o,$(wildcard $(PWD)/arch/$(ARCH)/*.c))

export PWD PROG INCLUDE common_objects

all:
	$(MAKE) -C $(KDIR)

debug:
	$(MAKE) -C $(KDIR) debug

clean:
	$(MAKE) -C $(KDIR) clean

flash:
	$(MAKE) -C $(KDIR) flash
