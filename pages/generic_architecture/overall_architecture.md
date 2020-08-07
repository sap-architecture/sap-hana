# Overall Architecture and Modularity

This section is explaining overall concept and how to use this Reference Architecture.

<!-- TOC -->

- [Overall Architecture and Modularity](#overall-architecture-and-modularity)
  - [Modular Concept](#modular-concept)
  - [Resulting Architecture Is Too Complex](#resulting-architecture-is-too-complex)
  - [How to Read This Reference Architecture](#how-to-read-this-reference-architecture)

<!-- /TOC -->

## Modular Concept

Overall approach how this Reference Architecture was created is briefly described [here](../../README.md#approach).

Individual customers are having different requirements. These requirements are dictating how the resulting architecture will look like. Unfortunately, initial requirements are quite often not final - customers will need to enable new functions and features and this might subsequently drive the need to significantly change the architecture and reimplement SAP HANA database.

This Reference Architecture is trying to minimize the changed to SAP HANA architecture by offering individual "modules" which are pre-integrated together. These modules are optional and solution architects should choose only those modules which are required in given scenario. The benefit is that additional modules can be enabled later without the need to redeploy the SAP HANA database.

## Resulting Architecture Is Too Complex

If all modules are selected, then resulting Reference Architecture is quite complex. This is because of complex requirements which are to be satisfied. If you consider the resulting architecture to be way too complicated, then try removing some optional modules or use simplified version of the modules (for example in area of Pacemaker configuration).

## How to Read This Reference Architecture

Next sections are started by describing the basic setup - simple Single-Node and Scale-Out deployment in single Availability Zone. Subsequent modules are then always building up on top of each other - each module describing how to include one additional function until we end up with full scenario having all options enabled.

Since all modules are optional - it is technically impossible to document all permutations of choices as separate diagrams. Therefore, it is assumed that Solution Architect working with this Reference Architecture is familiar with SAP HANA technology and is able to properly combine available modules creating his own architecture based on preferred choices.
