.PHONY: inference training
# If no BOARD is found in the environment, use this default:
BOARD ?= stm32f746g-disco
APP ?= inference

# This has to be the absolute path to the RIOT base directory:
RIOTBASE ?= $(HOME)/RIOT/
USEMODULE += xtimer
USEPKG += cmsis-nn cmsis-dsp

# Change this to 0 show compiler invocation lines by default:
QUIET ?= 1
WERROR ?= 0

# Features required
FEATURES_REQUIRED += cpp # basic C++ support
FEATURES_REQUIRED += libstdcpp # libstdc++ support (for #include <cstdio>)

DIRS += tinyengine-core
USEMODULE += tinyengine_core

CFLAGS_OPT  = -O3

ifeq ($(APP), training)
    include training.mk 

else
    include inference.mk 
endif
