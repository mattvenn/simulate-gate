all: sim

show_cells:
	summary.py --show-sky130

check:
	ngspice ci.spice

sim: simulation.spice
	# run the simulation
	ngspice $^
