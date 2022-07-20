NAME=sky130_fd_sc_hd__nand2_1

all: sim

show_cells:
	klayout -l $(PDK_ROOT)/$(PDK)/libs.tech/klayout/$(PDK).lyp $(PDK_ROOT)/$(PDK)/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds

magic:
	# for rcfile to work PDK_ROOT must be set correctly
	magic -rcfile $(PDK_ROOT)/$(PDK)/libs.tech/magic/$(PDK).magicrc $(NAME).mag
	# now in the command window type:
	# extract
	# ext2spice lvs
	# ext2spice cthresh 0
	# ext2spice

simulation.spice: pre.spice $(NAME).spice post.spice
	# build a simulation with pre and post.spice
	cat $^ > $@

sim: simulation.spice
	# run the simulation
	ngspice $^

clean:
	rm -f $(NAME).spice model.spice $(NAME).ext

phony: clean
