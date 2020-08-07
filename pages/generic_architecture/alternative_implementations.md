# Alternative Implementations

This section describes alternative implementations of SAP HANA System. These are not seen to be part of this Reference Architecture and are described only for informational purpose.

<!-- TOC -->

- [Alternative Implementations](#alternative-implementations)
  - [SAP HANA Host Auto-Failover (in single Availability Zone)](#sap-hana-host-auto-failover-in-single-availability-zone)

<!-- /TOC -->

## SAP HANA Host Auto-Failover (in single Availability Zone)

As discussed in [AD1: High Availability Concept](../architectural_decisions.md#ad1-high-availability-concept) there are two options how to implement SAP HANA High Availability. This Reference Architecture is based on SAP HANA Synchronous System Replication option. This section is discussing SAP HANA Host Auto-Failover (HAF) option which is not used in this Reference Architecture.

SAP HANA Host Auto-Failover is native function of SAP HANA System and is in detail described in [SAP HANA Host Auto-Failover Whitepaper](https://www.sap.com/documents/2016/06/f6b3861d-767c-0010-82c7-eda71af511fa.html).

SAP HANA Host Auto-Failover High Availability option is based on adding one or more dedicated `standby` hosts, that are passively waiting for failure of one or more of the active hosts. When such failure will happen, SAP HANA instance running on this `standby` host will takeover the data files and log files of failed host, thus replacing the failed host in its function.

This option is having both advantages and disadvantages when compared to SAP HANA Synchronous System Replication option.

Advantages:

- Lower Costs - SAP HANA Host Auto-Failover is adding 1-3 extra hosts dedicated for High Availability (`n+m` approach), while SAP HANA System Replication needs same number of hosts on both sides (`n+n` approach)
- Native Feature - SAP HANA Host Auto-Failover is native function of SAP HANA System - no external cluster software is required (therefore no additional knowledge is required)

Disadvantages:

- Single Failure Protection - One `standby` host is able to protect only against failure of one active host, maximum three `standby` hosts can be deployed (with cost implications)
- No Availability Zone Support - SAP HANA Host Auto-Failover architecture is unable to support multiple Availability Zones as all active hosts must be available simultaneously
- High Takeover Times - Since `standby` host cannot predict which of active hosts will fail, no pre-loading was implemented - therefore, takeover times can easily take dozens of minutes for very large systems
- No Support for Active/Active - since SAP HANA Host Auto-Failover does not have secondary system, thus there is no Active/Active capability (see [Administration Guide: Active/Active (Read Enabled)](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/fe5fc53706a34048bf4a3a93a5d7c866.html) for additional information)
- No Support for Secondary Time Travel - since SAP HANA Host Auto-Failover does not have secondary system, thus there is no Secondary Time Travel capability (see [Administration Guide: Secondary Time Travel](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/7a41aabb663e4ec793e7d344606fe616.html) for additional information)
- No Support for Near Zero Downtime Upgrades - since SAP HANA Host Auto-Failover does not have secondary system, thus there is no Near Zero Downtime Upgrades capability (see [Administration Guide: Use SAP HANA System Replication for Near Zero Downtime Upgrades](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/ee3fd9a0c2e74733a74e4ad140fde60b.html)
- Not Supported by all IaaS Cloud Vendors - as explained in [Administration Guide: Multiple-Host System Concepts](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/d5b64eaebd0d4220900ce5404eabca67.html) SAP HANA Host Auto-Failover must to be deployed either using Shared File Systems (like NFS) or based on Storage Connector API, therefore, not all IaaS Cloud Vendors are supporting this High Availability option

Additional Information:

- [Administration Guide: Host Auto-Failover](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/ae60cab98173431c97e8724856641207.html)
- [Administration Guide: Multiple-Host System Concepts](https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/d5b64eaebd0d4220900ce5404eabca67.html)
- [SAP HANA Host Auto-Failover Whitepaper](https://www.sap.com/documents/2016/06/f6b3861d-767c-0010-82c7-eda71af511fa.html)
