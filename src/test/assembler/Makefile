
BUILD_DIR   = $(REPO_BUILD)/tests/assembler

ALL_TARGETS = 

include $(REPO_HOME)/src/tests/common.mk

$(eval $(call add_assembler_target,test_archstr.S))
$(eval $(call add_assembler_target,test_simple_assembly.S))

all: $(ALL_TARGETS)

clean:
	rm -f $(ALL_TARGETS)

