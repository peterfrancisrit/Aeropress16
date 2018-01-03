# Functions for the itemset mining. 

import csv 
import pandas as pd
import numpy as np



with open("/Users/harryritchie/Documents/coffee_17_minedset.csv") as file:
	read_data = csv.reader(file,delimiter=';')
	check = []
	i = 0
	j = 0
	A = [[]]
	for row in read_data:
		print(row)
		for row_again in read_data:
			if row[1:] == row_again[1:]:
				A[i][j] = 1
			else:
				continue

			j += 1

		i+= 1
		
	print(A)

