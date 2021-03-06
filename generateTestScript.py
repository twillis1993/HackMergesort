import argparse
import os
import random

def configureArgumentParser():
	parser = argparse.ArgumentParser()

	parser.add_argument("-A", "--asmName", help="Name for the assembly file to run. Defaults to \'mergesortFunction.asm\'", type=str, default="mergesortFunction.asm")

	parser.add_argument("-O", "--outputName", action=OutputNameAction, help="Name for the .tst script", type=str, default="myTestScript")

	inputGroup = parser.add_mutually_exclusive_group(required=True)

	inputGroup.add_argument("-i", "--input", nargs='+', help="List of numbers to sort", type=int)

	inputGroup.add_argument("-n", "--numberOfRandomNumbers",  action=GenerateRandomInputAction, help="Number of random integers to generate as input to mergesort. Values are chosen from between -100 and 100. Argument must have value in interval [1,9500].", type=int, choices=range(1,9501), metavar="[1-9500]")

	return parser

def writeTstScript(argsDict):
	with open(".".join([argsDict["outputName"], "tst"]), 'w') as fh:

		fh.write("//Autogenerated tst script. Edit at your own risk\n")
		fh.write("\n")
		fh.write("load %s,\n" % argsDict["asmName"])
		#fh.write("output-file %s,\n" % ".".join([argsDict["outputName"], "out"]))
		#fh.write("compare-to %s,\n" % ".".join([argsDict["outputName"], "cmp"]))
		#fh.write("output-list %s,\n" % " ".join(["RAM[%d]%%D2.6.2" % x for x in range(4000, 4000+len(argsDict["input"]))]))

		fh.write("breakpoint PC 3,\n")
		fh.write("\n")
		fh.write("set RAM[101] 2,\n")
		fh.write("set RAM[102] 15000,\n")
		fh.write("set RAM[103] %d,\n" % len(argsDict["input"]))
		fh.write("\n")
		fh.write("set RAM[0] 103,\n")
		fh.write("\n")
		for i, x in enumerate(argsDict["input"]):
			fh.write("set RAM[%d] %d,\n" % (15000+i, argsDict["input"][i]))

		fh.write("repeat {\n\tticktock;\n}\n")

		
class OutputNameAction(argparse.Action):
	def __call__(self, parser, namespace, values, option_string):
		setattr(namespace, self.dest, os.path.splitext(values)[0])

class GenerateRandomInputAction(argparse.Action):
	def __call__(self, parser, namespace, values, option_string):
		inputNumbers = [random.randint(-2**14,2**14) for x in range(0,values)]
		setattr(namespace, "input", inputNumbers)
	
if __name__  == "__main__":
	parser = configureArgumentParser()
	args = parser.parse_args()
	writeTstScript(vars(args))

