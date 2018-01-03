# Functions for the itemset mining. 

import csv 
import pandas as pd
import numpy as np
from collections import defaultdict
import matplotlib.pyplot as plt
import networkx as nx
from networkx.algorithms.approximation import clique



# FUNCTION THAT TURNS A DICTIONARY INTO GRAPH IF VALUES ARE EQUAL 

def GraphDict(names):
	graph = defaultdict(list)
	for key, values in names.items():
		listed = []
		for key2, values2 in names.items():
			if values == values2:
				listed.append(key2)
			else:
				continue
		listed = listed[1:]

		graph[key] = listed
	return graph

# GENERATE EDGES FOR THE GRAPH
def generate_edges(graph):
    edges = []
 
    # for each node in graph
    for node in graph:
         
        # for each neighbour node of a single node
        for neighbour in graph[node]:
             
            # if edge exists then append
            edges.append((node, neighbour))
    return edges

# SHORTEST PATH FROM ONE RECIPE TO ANOTHER 
def find_shortest_path(graph, start, end, path =[]):
        path = path + [start]
        if start == end:
            return path
        shortest = None
        for node in graph[start]:
            if node not in path:
                newpath = find_shortest_path(graph, node, end, path)
                if newpath:
                    if not shortest or len(newpath) < len(shortest):
                        shortest = newpath
        return shortest


with open("/Users/harryritchie/Documents/Aeropress16/coffee_17_minedset.csv") as file:
	read_data = csv.reader(file,delimiter=';')
	names = {}
	for row in read_data:
		names[row[0]] = row[1:]
	del names['Recipe']

	# GRAPH
	GRAPH = GraphDict(names)

	G = nx.Graph(GRAPH)

	# MAX CLIQUE WITH MINED SETTINGS SUP > 0.5 
	print(clique.max_clique(G))


	# PLOT GRAPH
	# pos=nx.spring_layout(G)
	# nx.draw_networkx(G,pos)
	# plt.show()








