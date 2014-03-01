ERL_LIB = $(NERVES_SDK_SYSROOT)/usr/lib/erlang/lib
ELX_LIB = $(NERVES_ROOT)/buildroot/output/host/usr/lib/elixir/lib
REL2FW = $(NERVES_ROOT)/scripts/rel2fw.sh

release: compile
	relx --system_libs $(ERL_LIB) -l $(ELX_LIB)

compile: deps
	mix compile

deps:
	mix deps.get	

firmware: release
	$(REL2FW) _rel

sdcard:
	mmccopy _images/sdcard.img

clean:
	mix clean; rm -fr _build _rel _images

distclean: clean
	-rm -fr ebin deps 
