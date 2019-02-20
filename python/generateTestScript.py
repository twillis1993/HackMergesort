import argparse
import os
import random

def configureArgumentParser():
	parser = argparse.ArgumentParser()

	parser.add_argument("-A", "--asmName", help="Name for the assembly file to run", type=str, required=True)

	parser.add_argument("-N", "--outputName", action=OutputNameAction, help="Name for the .tst script", type=str, default="myTestScript.tst")

	inputGroup = parser.add_mutually_exclusive_group(required=True)

	inputGroup.add_argument("-i", "--input", nargs='+', help="List of numbers to sort", type=int)

	inputGroup.add_argument("-n", "--numberOfRandomNumbers",  action=GenerateRandomInputAction, help="Number of random integers to generate. Values are chosen from between -100 and 100. Argument must have value in interval [1,1000].", type=int, choices=range(1,1001))

	return parser

def writeTstScript(asmName, testScriptName):
	with open(testScriptName, 'w') as fh:
		pass
		
class OutputNameAction(argparse.Action):
	def __call__(self, parser, namespace, values, option_string):
		setattr(namespace, self.dest, os.path.splitext(values)[0])

class GenerateRandomInputAction(argparse.Action):
	def __call__(self, parser, namespace, values, option_string):
		inputNumbers = [random.randint(-100,101) for x in range(0,values)]
		setattr(namespace, "input", inputNumbers)
	
if __name__  == "__main__":
	parser = configureArgumentParser()
	args = parser.parse_args()
	print vars(args)["input"]
