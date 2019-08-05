# Reference Architecture for SAP HANA

## Objective

SAP HANA database is offering many different options how to design the infrastructure.

There are different ways how to implement High Availability (HA) and Disaster Recovery (DR) and there are many optional SAP HANA extensions (like Extension Nodes, Dynamic Tiering, XSA, etc.) that can be deployed.

There are various considerations that must be taken into account when designing infrastructure - for example ability to seamlesly move tenant (tenant portability) or whole instance (instance portability) without breaking external connectivity to the component.

Additional challenge is how to configure hostname resolution for individual virtual IPs to enable support for certificates and ensure their validity in relation to tenant or instance portability.

As result of this there are too many ways how to deploy SAP HANA and therefore almost all published Reference Architectures are very high-level showing only the generic concepts and they lack important details how to correctly implement the solution.

Goal of this project is to provide **one standardized multi-cloud and on-premise architecture** for SAP HANA that is able to support as many optional extensions as possible and to offer implementation details for different platforms including Public Cloud vendors (AWS, Azure, GCP, etc.) as well as on-premise implementations (VMware, Bare Metal).

It is important to state that other architectures are still valid (as long as formally supported by SAP) and can be used for specific requirements or use cases.

## Approach

The approach taken by the team is driven by the opinion that it is more simple to remove the features rather than to add them and make them working in harmony with the rest of the design.

Basic steps are following:

1. Define complex requirements including most common optional features
2. Make Architectural Decisions (ADs) to reduce the amount of deployment options
3. Design infrastructure architecture meeting as many requirements as possible (one standardized architecture)
4. Derive simplified versions of the architecture by removing specific requirements
5. Modify the infrastructure architecture for different platforms by introducing platform-specific details

## Table of Content

* [Change Log](CHANGELOG.md)
* [How to Contribute](CONTRIBUTING.md)

1. Requirements
2. Architectural Decisions
3. Infrastructure Architecture
4. Simplified versions of Infrastructure Architecture
5. Platform specific implementations
   * IaaS Cloud: AWS
   * IaaS Cloud: Azure
   * IaaS Cloud: GCP
   * On-premise: VMware
   * On-premise: Bare Metal

## Contributing

Please refer to [How to Contribute](CONTRIBUTING.md) to understand how to contribute to this project.
