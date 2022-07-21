all: sim

show_cells:
	klayout -l $(PDK_ROOT)/$(PDK)/libs.tech/klayout/$(PDK).lyp $(PDK_ROOT)/$(PDK)/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds

sim: simulation.spice
	# run the simulation
	ngspice $^
