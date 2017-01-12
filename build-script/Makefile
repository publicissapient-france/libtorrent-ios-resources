SDKMIN ?= "8.0"
BOOST_VERSION ?= "1.62.0"
OPENSSL_VERSION ?= "1.0.2j"

export LIB_PATH := $(CURDIR)/lib
export INCLUDE_PATH := $(CURDIR)/include

SRCDIR := $(CURDIR)/src/libtorrent
SCRIPTDIR := $(CURDIR)/script
BUILD_OUTPUT := $(LIB_PATH)
LIB_OUTPUT_NAME := libtorrent

BOOST_BUILDDIR := $(CURDIR)/.build/boost
BOOST_OUTPUT := $(BOOST_BUILDDIR)/build/boost/$(BOOST_VERSION)/ios/prefix

OPENSSL_BUILDDIR := $(CURDIR)/.build/openssl

all: i386 x86_64 armv7 armv64
	$(call make_fat_lib)

i386:
	$(call compile_arch,i386)

x86_64:
	$(call compile_arch,x86_64)

armv7:
	$(call compile_arch,armv7)

armv64:
	$(call compile_arch,arm64)

boost: warmup
	$(call mark_start,"build boost")
	@cd $(BOOST_BUILDDIR) && sh $(SCRIPTDIR)/build-boost.sh -ios --min-ios-version $(SDKMIN) --boost-version $(BOOST_VERSION)

	ln -s $(BOOST_OUTPUT)/lib $(LIB_PATH)/boost
	ln -s $(BOOST_OUTPUT)/include/boost $(INCLUDE_PATH)
	$(call mark_end,"built boost")

openssl: warmup
	$(call mark_start,"build openssl")
	@cd $(OPENSSL_BUILDDIR) && $(SCRIPTDIR)/build-libssl.sh \
	--version=$(OPENSSL_VERSION) \
	--archs="x86_64 i386 arm64 armv7"
	--targets="ios-sim-cross-x86_64 ios-sim-cross-i386 ios64-cross-arm64 ios-cross-armv7"

	ln -s $(OPENSSL_BUILDDIR)/lib $(LIB_PATH)/openssl
	ln -s $(OPENSSL_BUILDDIR)/include $(INCLUDE_PATH)/openssl
	$(call mark_end,"built openssl")

clean:
	rm -rf $(LIB_PATH) $(INCLUDE_PATH)

warmup:
	@mkdir -p $(LIB_PATH) $(INCLUDE_PATH) $(BOOST_BUILDDIR) $(OPENSSL_BUILDDIR)

define compile_arch
	$(call mark_start,"compile torrent $1")
	$(CURDIR)/script/torrent-compile.sh $1 $(SDKMIN) $(SRCDIR)
	$(call mark_end,"compile torrent $1")

	mkdir -p $(BUILD_OUTPUT)
	mv $(LIB_PATH)/libtorrent/src/.libs/libtorrent-rasterbar.a $(BUILD_OUTPUT)/libtorrent-rasterbar-$1.a
endef

define make_fat_lib
	LIBS := $(shell find $(BUILD_OUTPUT) -name '*.a')
	lipo -create $(LIBS) -output $(LIB_OUTPUT_NAME).a
endef

GREEN="\033[1;32m"
NC='\033[0m' # No Color

define mark_start
	@echo $(GREEN)"Starting $1 🚀"$(NC)
endef

define mark_end
	@echo $(GREEN)$(1)" finished successfully! 👏"$(NC)
endef
