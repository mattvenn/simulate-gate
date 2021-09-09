NAME=CELL_NAME

all: sim

show_cells:
	klayout -l $(PDK_ROOT)/sky130A/libs.tech/klayout/sky130A.lyp $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds

magic:
	# for rcfile to work PDKPATH must be set correctly
	magic -rcfile sky130A.magicrc $(NAME).mag
	# now in the command window type:
	# extract
	# ext2spice lvs
	# ext2spice cthresh 0
	# ext2spice

sim: simulation.spice
	# run the simulation
	ngspice $^

clean:
	rm -f $(NAME).spice model.spice $(NAME).ext

phony: clean
