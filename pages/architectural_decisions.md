# Architectural Decisions

Following Architectural Decisions (ADs) were made as part of this Reference Architecture. Different ADs might lead to different Reference Architectures.

<!-- TOC -->

- [Architectural Decisions](#architectural-decisions)
  - [AD1: High Availability Concept](#ad1-high-availability-concept)
  - [AD2: Disaster Recovery Concept](#ad2-disaster-recovery-concept)
  - [AD3: High Availability Takeover Automation](#ad3-high-availability-takeover-automation)

<!-- /TOC -->

## AD1: High Availability Concept

| ID                | AD1
|:------------------|:---------------------------------------------
| **Name**          | High Availability Concept
| **Description**   | SAP HANA is supporting multiple fundamentally different High Availability concepts. One needs to be selected.
| **Assumptions**   | Overall design should support both single-node and scale-out in parallel next to each other.<br>Objective is to minimize the Recovery Time Objective (RTO).
| **Options**       | 1. [SAP HANA Host Auto-Failover (HAF)](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/ae60cab98173431c97e8724856641207.html)<br> 2. [SAP HANA System Replication (synchronous)](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/b74e16a9e09541749a745f41246a065e.html)
| **Decision**      | 2. SAP HANA System Replication (synchronous)
| **Justification** | - this is the only option that is supporting [REQ2](../pages/requirements.md#req2-high-availability-ha-across-availability-zones-azs) for scale-out systems<br>- the Recovery Time Objective (RTO) values are significantly smaller compared to 1.<br>- this option is supporting additional features like [Active/Active (Read Enabled)](https://help.sap.com/viewer/4e9b18c116aa42fc84c7dbfd02111aba/2.0.04/en-US/8231617177f743d1ba46fdfc5a82dcd1.html) or [Secondary Time Travel](https://help.sap.com/viewer/4e9b18c116aa42fc84c7dbfd02111aba/2.0.04/en-US/ab3a78d7e0c143c6b9765fb287a3b0c7.html)
| **Comment**       | Recommended Replication Mode is `SYNC` in case there is possible shared Single Point of Failure (SPOF) or `SYNCMEM` in case of two physically separated infrastructures.<br>Recommended Operation Mode is `logreplay` (or `logreplay_readaccess`).

## AD2: Disaster Recovery Concept

| ID                | AD2
|:------------------|:---------------------------------------------
| **Name**          | Disaster Recovery Concept
| **Description**   | SAP HANA is supporting multiple fundamentally different Disaster Recovery concepts. One needs to be selected.
| **Assumptions**   | -
| **Options**       | 1. [Storage Replication](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/2a3b86c65f0d485cb39ff10181986125.html)<br> 2. [SAP HANA System Replication (asynchronous)](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/b74e16a9e09541749a745f41246a065e.html)
| **Decision**      | 2. SAP HANA System Replication (asynchronous)
| **Justification** | - option 1. might or might not be available and is unlikely to work cross-platform<br>- option 2. is part of the product and therefore always available, it is platform independent and will work even cross-platform<br>- as part of option 2. all data pages are checked for consistency during the transfer to secondary site
| **Comment**       | Replication Mode must be `ASYNC` to avoid performance impact.<br>Operation Mode must be same for all tiers (either `delta_datashipping` or `logreplay`/`logreplay_readaccess`), combining Operations Modes is not supported.<br>Operation mode `logreplay_readaccess` is available only between primary and secondary system.

Note: Combination of AD1 and AD2 will lead to usage of [SAP HANA Multitarget System Replication](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/ba457510958241889a459e606bbcf3d3.html) (or [SAP HANA Multitier System Replication](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/1.0.12/en-US/2bea048631874ddba1f5d5874c46dbaf.html) in case of SAP HANA 1.0).

## AD3: High Availability Takeover Automation

| ID                | AD3
|:------------------|:---------------------------------------------
| **Name**          | High Availability Takeover Automation
| **Description**   | There are different options/products how High Availability Takeover can be executed. One needs to be selected.
| **Assumptions**   | Objective is to minimize the Recovery Time Objective (RTO).
| **Options**       | 1. Manual Takeover (no automation)<br>2. Pacemaker Cluster (Linux native solution)<br>3. 3rd Party Clustering Solution
| **Decision**      | 2. Pacemaker Cluster (Linux native solution)
| **Justification** | - option 1. is not satisfying requirement to minimize the Recovery Time Objective (RTO) value<br>- option 2. is seen as recommended option by both OS vendor and SAP and is most common HA solution<br>- option 3. might not be available across all platforms
| **Comment**       | Take into account specific Implementation Guidelines for each Infrastructure Platform.
