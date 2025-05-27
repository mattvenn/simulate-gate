all: sim

show_cells:
	summary.py --show-sky130

check:
	ngspice ci.spice
	python3 check.py check.txt

sim: simulation.spice
	# run the simulation
	ngspice $^
