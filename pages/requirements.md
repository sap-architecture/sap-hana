# Requirements

Following requirements were taken into account for this Reference Architecture. Different requirements might lead to different Reference Architectures.

<!-- TOC -->

- [Requirements](#requirements)
  - [REQ1: Scale-out Driven Architecture](#req1-scale-out-driven-architecture)
  - [REQ2: High Availability (HA) Across Availability Zones (AZs)](#req2-high-availability-ha-across-availability-zones-azs)
  - [REQ3: Disaster Recovery (DR) into Remote Location](#req3-disaster-recovery-dr-into-remote-location)
  - [REQ4: SAP HANA Multitenant Database Containers (MDC) Implementation](#req4-sap-hana-multitenant-database-containers-mdc-implementation)
  - [REQ5: Virtual IP and Hostname for SAP HANA System Relocation](#req5-virtual-ip-and-hostname-for-sap-hana-system-relocation)
  - [REQ6: Support for Data Tiering Options (related to REQ2 and REQ4)](#req6-support-for-data-tiering-options-related-to-req2-and-req4)
  - [REQ7: Enabled for Instance move (related to REQ5)](#req7-enabled-for-instance-move-related-to-req5)
  - [REQ8: Enabled for Tenant move (related to REQ2 and REQ5)](#req8-enabled-for-tenant-move-related-to-req2-and-req5)
  - [REQ9: Fully TLS enabled (related to REQ4, REQ7 and REQ8)](#req9-fully-tls-enabled-related-to-req4-req7-and-req8)

<!-- /TOC -->

## REQ1: Scale-out Driven Architecture

SAP HANA database is having ability to run in distributed way across multiple VMs (or physical servers). The Reference Architecture should take into account scale-out deployment option to ensure that single-node design can be easily extended into scale-out without major architectural redesign.

## REQ2: High Availability (HA) Across Availability Zones (AZs)

Most IaaS offerings are supporting concept of Availability Zones - these are physically separated infrastructure segments that should not share any Single Point of Failure (SPOF), however are in close proximity to deliver low latencies required for Synchronous Replication. The Reference Architecture should take advantage of concept of Availability Zones to maximize the resiliency.

## REQ3: Disaster Recovery (DR) into Remote Location

Due to close proximity of Availability Zones these might not be seen as sufficient for Disaster Recovery purpose. Therefore, the Reference Architecture should support Disaster Recovery function by shipping the data into Remote Location.

## REQ4: SAP HANA Multitenant Database Containers (MDC) Implementation

SAP HANA is capable to run multiple independent database containers as part of one SAP HANA system. The Reference Architecture should support ability to run more than one database container.

## REQ5: Virtual IP and Hostname for SAP HANA System Relocation

To enable SAP HANA portability the SAP HANA instance should be decoupled from underlying Operating System by using its own Virtual IP and Virtual Hostname. This will simplify the SAP HANA relocation and will prevent the need to change hostnames or IPs during the migrations. The Reference Architecture should support this capability.

## REQ6: Support for Data Tiering Options (related to REQ2 and REQ4)

SAP invented various options how to distribute the data based on frequency of usage. The Reference Architecture should support following Data Tiering options (if technically viable):

- SAP HANA Native Storage Extensions (NSE)
- SAP HANA Extension Nodes
- SAP HANA Dynamic Tiering (DT)

**Note:** This requirement might be potentially conflicting with other requirements (in particular with REQ2 and REQ4).

## REQ7: Enabled for Instance move (related to REQ5)

In certain cases, it might be required to move instance of SAP HANA database to new VM (for example move from VM to Physical Server). The Reference Architecture should support such relocation without the need to change any configuration on connecting applications by ensuring that IP address and Hostname will be preserved.

**Note:** This requirement is related to requirement REQ5.

## REQ8: Enabled for Tenant move (related to REQ2 and REQ5)

SAP HANA database is supporting ability to relocate the database tenant into another SAP HANA database. The Reference Architecture should support such tenant relocation without the need to change any configuration on connecting applications by ensuring that IP address and Hostname will be preserved.

**Note:** This requirement is related to requirement REQ2 and REQ5.

## REQ9: Fully TLS enabled (related to REQ4, REQ7 and REQ8)

SAP HANA is supporting ability to encrypt the database communication by using Transport Layer Secure (TLS) / Secure Sockets Layer (SSL) protocol. Since Fully Qualified Domain Name (FQDN) is part of the TLS/SSL configuration the Reference Architecture should properly define usage of FQDNs for individual database containers (related to REQ4) and minimize the need to recreate the certificates as result of Instance Move (REQ7) and/or Tenant Move (REQ8).
