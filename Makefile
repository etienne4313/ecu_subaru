PWD := $(shell pwd)
PROG := $(PWD)/$(shell basename `pwd`)

#
# Project files
#
DRIVER = subaru_36_2_2_2
INCLUDE = $(PWD)

# 
# Bug with ARM KLM where $(shell realpath -s --relative-to $(CURR) $(common_objects)) doesn't work.
#
common_objects := $(patsubst %.c,../../../../../../../../../%.o,$(wildcard $(PWD)/*.c)) $(patsubst %.c,../../../../../../../../../%.o,$(wildcard $(PWD)/driver/$(DRIVER).c)) $(patsubst %.c,../../../../../../../../../%.o,$(wildcard $(PWD)/arch/$(PLATFORM)/*.c))
#common_objects := $(patsubst %.c,%.o,$(wildcard $(PWD)/*.c)) $(patsubst %.c,%.o,$(wildcard $(PWD)/driver/$(DRIVER).c)) $(patsubst %.c,%.o,$(wildcard $(PWD)/arch/$(PLATFORM)/*.c))


export PWD PROG INCLUDE common_objects

all:
	$(MAKE) -C $(KDIR)

debug:
	$(MAKE) -C $(KDIR) debug

clean:
	$(MAKE) -C $(KDIR) clean

mrproper:
	find . -name ".*.cmd" -type f -print0 | xargs -0 /bin/rm -f
	find . -name "*.ko" -type f -print0 | xargs -0 /bin/rm -f
	find . -name "*.o" -type f -print0 | xargs -0 /bin/rm -f

flash:
	$(MAKE) -C $(KDIR) flash
