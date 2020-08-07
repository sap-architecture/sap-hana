# Reference Architecture for SAP HANA

<!-- TOC -->

- [Reference Architecture for SAP HANA](#reference-architecture-for-sap-hana)
  - [Objective](#objective)
  - [Approach](#approach)
  - [Table of Content](#table-of-content)
  - [Contributing](#contributing)

<!-- /TOC -->

## Objective

SAP HANA database is offering many different options how to design the infrastructure.

There are different ways how to implement High Availability (HA) and Disaster Recovery (DR) and there are many optional SAP HANA extensions (like Extension Nodes, Dynamic Tiering, XSA, etc.) that can be deployed.

There are various considerations that must be taken into account when designing infrastructure - for example ability to seamlessly move tenant (tenant portability) or whole instance (instance portability) without breaking external connectivity to the component.

Additional challenge is how to configure hostname resolution for individual virtual IPs to enable support for certificates and ensure their validity in relation to tenant or instance portability.

As result of this there are too many ways how to deploy SAP HANA and therefore almost all published Reference Architectures are very high-level showing only the generic concepts and they lack important details how to correctly implement the solution.

Goal of this project is to provide **one standardized multi-cloud and on-premise architecture** for SAP HANA that is able to support as many optional extensions as possible and to offer implementation details for different platforms including Public Cloud vendors (AWS, Azure, GCP, etc.) as well as on-premise implementations (VMware, Bare Metal).

It is important to state that other architectures are still valid (as long as formally supported by SAP) and can be used for specific requirements or use cases.

## Approach

The approach taken by the team is driven by the opinion that it is simpler to remove the features rather than to add them and make them work in harmony with the rest of the design.

Basic steps are following:

1. Define complex requirements including most common optional features
2. Make Architectural Decisions (ADs) to reduce the amount of deployment options
3. Design infrastructure architecture meeting as many requirements as possible (one standardized architecture)
4. Derive simplified versions of the architecture by removing specific requirements
5. Modify the infrastructure architecture for different platforms by introducing platform-specific details

## Table of Content

- [Change Log](CHANGELOG.md#change-log)
- [How to Contribute](CONTRIBUTING.md#how-to-contribute)

1. [Requirements](pages/requirements.md#requirements)
2. [Architectural Decisions](pages/architectural_decisions.md#architectural-decisions)
3. Generic SAP HANA Architecture
   - [Overall Architecture and Modularity](pages/generic_architecture/overall_architecture.md#overall-architecture-and-modularity)
   - [Module: Basic Architecture](pages/generic_architecture/module_basic_architecture.md#module-basic-architecture)
   - [Module: Virtual Hostname/IP](pages/generic_architecture/module_virtual_hostname.md#module-virtual-hostnameip)
   - [Module: High Availability](pages/generic_architecture/module_high_availability.md#module-high-availability)
   - [Module: Disaster Recovery](pages/generic_architecture/module_disaster_recovery.md#module-disaster-recovery)
   - [Module: Data Tiering Options](pages/generic_architecture/module_data_tiering.md#module-data-tiering-options)
   - [Module: SAP XSA](pages/generic_architecture/module_xsa.md#module-sap-xsa)
   - [Alternative Implementations](pages/generic_architecture/alternative_implementations.md#alternative-implementations)
4. Platform Specific Architecture
   - [Cloud IaaS: AWS](pages/platform_specific_architecture/cloud_iaas_aws.md#platform-specific-architecture-for-aws-amazon-web-services)
   - [Cloud IaaS: Azure](pages/platform_specific_architecture/cloud_iaas_azure.md#platform-specific-architecture-for-azure-microsoft-azure)
   - Cloud IaaS: IBM Cloud
   - Cloud IaaS: Google
   - On-premise: VMware
   - On-premise: IBM Power
5. Operational Procedures
   - High Availability (HA) Operation
   - Disaster Recovery (DR) Operation
   - SAP HANA Instance Move
   - SAP HANA Tenant Move
6. Additional Information
   - SAP HANA: Network Latency Requirements
   - SAP HANA: Stacking Options (MCOD, MCOS, MDC)
   - SAP HANA: Certificate setup

## Contributing

Please refer to [How to Contribute](CONTRIBUTING.md#how-to-contribute) to understand how to contribute to this project.
