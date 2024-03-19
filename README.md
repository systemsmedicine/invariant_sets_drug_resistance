# Invariant set theory for streamlining the success of antibiotic cycling

This repository contains the computation of invariant sets for switched linear systems, with applications to a model for bacteria evolution of resistance to antibiotics. It also contains the solutions of a network-based nonlinear model for bacteria dynamics population.

The nonlinear model is based on bug:drug interactions, which provide a mutation network based on collateral effects among the antibiotics used, namely collateral sensitivity, cross-resistance, and insensitivity. This mutation network connects with a series of differential equations that estimate the rate of change of the total bacteria population. The model used to describe the total population is given by a nonlinear switching system, where the drug used serves as a control measure for the population.

For further details, please refer to: https://www.biorxiv.org/content/10.1101/2024.02.06.579227v1.abstract

## Tabla de Contenidos

1. [Instalación](#instalación)
2. [Contacto](#contacto)
3. [Cite](#cite)

## Instalación

Before using this project, please ensure you have the following installed:

Matlab
MPT3 toolbox for working with polytope sets (Polyhedron function)
Installation Steps
Matlab Installation: If you haven't already, install Matlab on your system. You can obtain Matlab from MathWorks.

MPT3 Toolbox Installation: After installing Matlab, download and install the MPT3 toolbox. The MPT3 toolbox is required for working with polytope sets, specifically for utilizing the Polyhedron function. 

## Contacto

Alejandro Anderson: alelanderson@gmail.com
Esteban Hernandez Vargas: esteban@uidaho.edu 

## Cite
Cite the corresponding tool as follows: A. Anderson, M. W. Kinahan, A. H. Gonzalez, K. Udekwu, E. A. Hernandez-Vargas.
Invariant set theory for streamlining the success of antibiotic cycling, Mathematical Biosciences, 2024.
