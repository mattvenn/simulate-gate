NAME=sky130_fd_sc_hd__nand2_1

all: sim

simulation.spice: pre.spice $(NAME).spice post.spice
	# build a simulation with pre and post.spice
	cat $^ > $@

sim: simulation.spice
	# run the simulation
	ngspice $^

clean:
	rm -f $(NAME).spice model.spice $(NAME).ext

phony: clean
