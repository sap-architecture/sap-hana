# Platform Specific Architecture for IBM Cloud

Description

<!-- TOC -->

- [Platform Specific Architecture for IBM Cloud](#platform-specific-architecture-for-ibm-cloud)
  - [IBM Cloud: Overall Architecture](#ibm-cloud-overall-architecture)
  - [IBM Cloud: Basic Architecture](#ibm-cloud-basic-architecture)
    - [IBM Cloud: Storage Configurations](#ibm-cloud-storage-configurations)
  - [IBM Cloud: Virtual Hostname/IP](#ibm-cloud-virtual-hostnameip)
  - [IBM Cloud: High Availability](#ibm-cloud-high-availability)
  - [IBM Cloud: Disaster Recovery](#ibm-cloud-disaster-recovery)
  - [IBM Cloud: Data Tiering Options](#ibm-cloud-data-tiering-options)
  - [IBM Cloud: XSA](#ibm-cloud-xsa)

<!-- /TOC -->

## IBM Cloud: Overall Architecture

- need picture here

- some general text
  - some basic links to IBM reference architectures and documentation

## IBM Cloud: Basic Architecture

Link to generic content: [Module: Basic Architecture](../generic_architecture/module_basic_architecture.md#module-basic-architecture)

- supported instance types
- description of single node implementation (storage) + picture
- description of scale-out implementations (storage) + picture
- are subnets are stretched across AZs?
- links to IBM documentation

### IBM Cloud: Storage Configurations

- visualization of storage for IBM Cloud

## IBM Cloud: Virtual Hostname/IP

Link to generic content: [Module: Virtual Hostname/IP](../generic_architecture/module_virtual_hostname.md#module-virtual-hostnameip)

- how to implement virtual IP - maybe additional network interface?
- reference to Instance Move and how to execute IBM specific steps (move network interface?)

## IBM Cloud: High Availability

Link to generic content: [Module: High Availability](../generic_architecture/module_high_availability.md#module-high-availability)

- link to list of Availability Zones in IBM
- comment that it is important to measure AZ latency via niping (I will add this as new section in general part)
- fencing mechanism (options, recommendation)
- how to implement cluster IP ?
  - provide some details
- links to IBM/SUSE/RHEL documentation
- how to modify cluster to have active/active
- how to modify cluster to have tenant specific cluster IPs
- anything else?

## IBM Cloud: Disaster Recovery

Link to generic content: [Module: Disaster Recovery](../generic_architecture/module_disaster_recovery.md#module-disaster-recovery)

- anything to consider? bandwidth?

## IBM Cloud: Data Tiering Options

Link to generic content: [Module: Data Tiering Options](../generic_architecture/module_data_tiering.md#module-data-tiering-options)

- what is supported what is not (matrix)
- links to IBM documentation
- modified pictures of storage setup (if required)

## IBM Cloud: XSA

Link to generic content: [Module: SAP XSA](../generic_architecture/module_xsa.md#module-sap-xsa)

- I think there is nothing infrastructure specific
