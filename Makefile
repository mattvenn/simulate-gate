all: sim

show_cells:
	summary.py --show-sky130

sim: simulation.spice
	# run the simulation
	ngspice $^
