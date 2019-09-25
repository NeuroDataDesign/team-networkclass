# Summary
Connectal Coding: Discovering the Structures Linking Cognitive Phenotypes to Individual Histories, JT Vogelstein et. al

## Abstract
* connectal coding identifies netwrok structures that link congition to individual history
* brain structure can be simply and usefully modelled by a network of nodes and edges
* goal of brain connectivity modeling is to link connectivity patterns to events

## Modeling Brain as network
* a connectome is a mathematical model of the brain (denoted G), contained nodes and edges
  * nodes represent an entity of the brain. Contraints are set on nodes, such as spatial contraint, resolution, and type
  * edges represent the presence of a connection between these nodes.
* It is common to represent this network as a graph, using the adjacency matrix
* Structure is further added to these networks through edge weights

## Example Estimated Connectomes
* connectomes visualized using the adjacency matrix
* nodes were sorted by order or type
* in the connectome matrix, color intensity corresponds to the degree of connectivity between two regions

## The purpose of brain codes
* the neural activity codes correspond to how the brain represents information
* however, connectal coding corresponds to how the brain stores information
* both activity and connectal codes are stochastic. This property is "required for operating in the world"

## The Role of Connectomes in Connectal Coding
* Definitions:
  * Genome: complete genetic sequence of an individual
  * genotype: the part of the genetic sequence of an individual that associated with a particular phenotype
  * connectotype: the collection of nodes and edges (and potentially their attributes) associated
with a given phenotype.
* no one-to-one mapping between connectotypes and phenotypes. 
* in connectal coding, connectomes are interesting as they participate in the understanding of the relationship between brain structure and individual histories or cognitive phenotypes.

## Models of Connectomes
* Most common approach is edgewise statistics, or "bag of edges", treats edges independently
* this approach requires performing many statistical tests,
which are corrected for comparisons to adequately control for the number of false
positives.
* lacks theoretical guarantees, making interpreting its results problematic
* another approach is "bag of features". In this approach,
multiple graph-wise or node-wise statistics are calculated and compared
* less popular in connectomics is the statistical modeling of networks. This is unpopular because connectomes are often weighted, directed, and include node-wise labelling.
