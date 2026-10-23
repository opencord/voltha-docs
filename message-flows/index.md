# VOLTHA Message Flows

These pages describe the main message flows between the components of a VOLTHA
deployment. The flows follow the **TT workflow**.

- [OLT Bring-Up Workflow](olt-bring-up.md): the OLT is configured, created and
  enabled, and VGC discovers it.
- [ONT Bring-Up Workflow](ont-bring-up.md): an ONU is discovered, activated and
  configured over OMCI, and its UNI ports are presented to VGC.
- [HSIA and DHCP Workflow](hsia-dhcp.md): a subscriber is provisioned, the HSIA
  and DHCP trap flows are installed, and DHCPv4 is relayed by VGC.

## Components and conventions

| Participant | What it represents |
| --- | --- |
| **NEM** | Network Edge Mediator. API layer towards the operator OSS/BSS. NEM exposes the same APIs as VGC and passes requests to VGC, which does the work. The exception is creating and enabling an OLT, which VGC has no API for: NEM calls the VOLTHA gRPC NBI directly for that. |
| **VGC** | [VOLTHA Go Controller](https://github.com/opencord/voltha-go-controller). Replaces ONOS and hosts the disaggregated control-plane applications (DHCP relay, PPPoE, IGMP and others). Talks to VOLTHA over the VOLTHA gRPC NBI. There is no OpenFlow connection: the logical device, port and flow messages are protobuf messages over gRPC. |
| **Kafka** | Message bus. VOLTHA publishes device events on the `voltha.events` topic, which VGC consumes. VGC publishes its own events on `vgc.events`. |
| **VOLTHA** | The VOLTHA stack as a single lifeline: `voltha-go` (rw_core), `voltha-openolt-adapter` and `voltha-openonu-adapter-go`. |
| **KV Store** | Key-value store used by VOLTHA to persist devices, ports, logical devices, flows and PON resource pools. The backend is selected with `kv_store_type`: etcd (default) or Redis. |
| **OLT** | The physical OLT running the [openolt agent](https://github.com/opencord/openolt), reached over gRPC ([openolt.proto](https://github.com/opencord/voltha-protos/blob/master/protos/voltha_protos/openolt.proto)). |
| **ONU** | The ONU, managed over OMCI. |

Diagram conventions:

- Solid arrows (`->>`) are requests and commands.
- Dashed arrows (`-->>`) are responses, indications and events.
- Steps are numbered so that the text and the step tables can refer to them.
- A VOLTHA-to-VOLTHA arrow is an exchange between components inside VOLTHA
  (for example rw_core and the openolt adapter, which use gRPC between them).
  The label names the components involved.

## Source references

- NBI handlers in rw_core: [manager_nbi.go](https://github.com/opencord/voltha-go/blob/master/rw_core/core/device/manager_nbi.go)
- Adapter-to-core calls: [manager_sbi.go](https://github.com/opencord/voltha-go/blob/master/rw_core/core/device/manager_sbi.go)
- Device state transitions and logical device creation: [state/transitions.go](https://github.com/opencord/voltha-go/blob/master/rw_core/core/device/state/transitions.go)
- openolt adapter device handler: [device_handler.go](https://github.com/opencord/voltha-openolt-adapter/blob/master/internal/pkg/core/device_handler.go)
- VGC device discovery: [vpagent/refresh.go](https://github.com/opencord/voltha-go-controller/blob/master/internal/pkg/vpagent/refresh.go)
- KV store clients (etcd and Redis): [voltha-lib-go kvstore](https://github.com/opencord/voltha-lib-go/tree/master/pkg/db/kvstore)
- openonu adapter device handler: [device_handler.go](https://github.com/opencord/voltha-openonu-adapter-go/blob/master/internal/pkg/core/device_handler.go)
- openonu adapter MIB upload: [mib_sync.go](https://github.com/opencord/voltha-openonu-adapter-go/blob/master/internal/pkg/mib/mib_sync.go)
- openonu adapter MIB download: [mib_download.go](https://github.com/opencord/voltha-openonu-adapter-go/blob/master/internal/pkg/mib/mib_download.go)
- VGC subscriber API: [nbi/subscriber.go](https://github.com/opencord/voltha-go-controller/blob/master/voltha-go-controller/nbi/subscriber.go)
- VGC flow provisioning: [application/vnets.go](https://github.com/opencord/voltha-go-controller/blob/master/internal/pkg/application/vnets.go)
- VGC DHCP relay: [application/dhcprelay.go](https://github.com/opencord/voltha-go-controller/blob/master/internal/pkg/application/dhcprelay.go)
- openolt adapter flow manager: [openolt_flowmgr.go](https://github.com/opencord/voltha-openolt-adapter/blob/master/internal/pkg/core/openolt_flowmgr.go)
- openonu adapter tech profile and VLAN configuration: [avcfg](https://github.com/opencord/voltha-openonu-adapter-go/tree/master/internal/pkg/avcfg)
