// ID identifying the cluster to create. Use your username so that resources created can be tracked back to you.
cluster_id = "Red Hat-ocp"

// Domain of the cluster. This should be "${cluster_id}.${base_domain}".
cluster_domain = "ocp.broker.saic.com"

// Base domain from which the cluster domain is a subdomain.
base_domain = "broker.saic.com"

// Name of the vSphere server. The dev cluster is on "vcsa.vmware.devcluster.openshift.com".

// vsphere_server = "COMP-APL-VCS01.broker.saic.com"
# vsphere_server = "MGMT-APL-VCS01.broker.saic.com"

// USE IP because AWS doesn't have DNS set up
vsphere_server = "172.16.11.62"

// User on the vSphere server.
vsphere_user = "SVC-VMW-vSphere-TF@broker.saic.com"

// Password of the user on the vSphere server.
vsphere_password = "ITaaSwins!!SAIC1811"

// Name of the vSphere cluster. The dev cluster is "devel".
// vsphere_cluster = "OKR01-C01-COMP01"
vsphere_cluster = "OKR01-M01-MGMT01"

// Name of the vSphere data center. The dev cluster is "dc1".
vsphere_datacenter = "OKR01-M01"

// Name of the vSphere data store to use for the VMs. The dev cluster uses "nvme-ds1".
vsphere_datastore = "OKR01-M01-MGMT01-VSAN"

// Name of the VM template to clone to create VMs for the cluster. The dev cluster has a template named "rhcos-latest".
vm_template = "TMPL-SVR-RHCOS01"

// The machine_cidr where IP addresses will be assigned for cluster nodes.
// Additionally, IPAM will assign IPs based on the network ID. 
machine_cidr = "172.25.0.0/16"

// The number of control plane VMs to create. Default is 3.
control_plane_count = 3

// The number of compute VMs to create. Default is 3.
compute_count = 3

// URL of the bootstrap ignition. This needs to be publicly accessible so that the bootstrap machine can pull the ignition.
bootstrap_ignition_url = "https://oakridge-ocp-bootstrap-ign.s3.amazonaws.com/bootstrap.ign"

// Ignition config for the control plane machines. You should copy the contents of the master.ign generated by the installer.
control_plane_ignition = <<END_OF_MASTER_IGNITION

{"ignition":{"config":{"append":[{"source":"https://api-int.ocp.broker.saic.com:22623/config/master","verification":{}}]},"security":{"tls":{"certificateAuthorities":[{"source":"data:text/plain;charset=utf-8;base64,LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFRENDQWZpZ0F3SUJBZ0lJRk1KZlF4a0lPZVl3RFFZSktvWklodmNOQVFFTEJRQXdKakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1SQXdEZ1lEVlFRREV3ZHliMjkwTFdOaE1CNFhEVEl3TURFeU9URTVNREl3T0ZvWApEVE13TURFeU5qRTVNREl3T0Zvd0pqRVNNQkFHQTFVRUN4TUpiM0JsYm5Ob2FXWjBNUkF3RGdZRFZRUURFd2R5CmIyOTBMV05oTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF1Wm5YbCtTQXlJVDMKUkJWejJwMGpESTcrZHBZL3NyYXQyS0xyTzdMeGd0SUFicHRIRjRSLzhkSytJREhkVnFCeFNWODh5eWorWXBQbApVTElQRGlNUnllZXZNSDMwN3hlT3l5bnJVdWFPZFJTdnY4NXdhSU15eSs4bi9ITko2dDVhRDZWNE1sVmZpOTlCCnl6M1NuMXg3a0FDN0xPcTVZdEVwckd1WE9HM3lYdUxXZjFJM3pOOXhrYXB2ZlBIRlFUa0d0MnlwcURvdmxFdHMKK0M4cjNNcEUzNUt0TVdjeEk0SUJ2TlhEaWRjakw0bXZZZmhyT0hFNlEwQlNXMlErMjlJRmdXWEd1ZWRQZVQ5cwpBNENXSWx3dVBFUkZicDZBWTBlK29vKzR5RmYwUWd0U1dHaWtNZWhNOUJaNmhUd3l3c3VkTG5DRmhGQkZhT2ZDCk1ESmE5dTF5VHdJREFRQUJvMEl3UURBT0JnTlZIUThCQWY4RUJBTUNBcVF3RHdZRFZSMFRBUUgvQkFVd0F3RUIKL3pBZEJnTlZIUTRFRmdRVStKVUdIbHlZeVQwUUxud0FJL1p6TWV6R0xVUXdEUVlKS29aSWh2Y05BUUVMQlFBRApnZ0VCQUVYeUdwKzJBdXllM2YwQnpSaWFxSDdGZ1lkcm0vd3g5UUlGYW4rdGtBclY5dUlGNGVNSndyRCtJZU9oCmlpbFN2TWw3ckVhdFJFVTBOanl3MEdzcm00Sit4U1FUK1ZmK2lTQkZweWI5aGtuL25KTjh4ODQySUU1RGV2Z2cKOWJzTkNsVVV3cVBHbEFpRkVxUWVGSHhTMTg4RTJxbWlkSDFyY01adTlGa2QzdndocnZMY0t0NWowRWlibDJ3RApZNjR2djFTT3BCVXpOdml6NnRDNkxDa1gxckhNb1k4REh3QjJjMW5HMVBVLy9Qc1p3ejlSSzRDdGF2NEdSN0tiCmdFU2lSeEtXN25PTzVCMzJLZUVDWWJKOFlFZlRvMGxrbUt1VWxSamRhRFZBWExLKzhSbkdka2MzKzg4QklMcHkKdE8wdEpkZ05kYjZWYUxnb2lLSGo0NU1qNGlBPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==","verification":{}}]}},"timeouts":{},"version":"2.2.0"},"networkd":{},"passwd":{},"storage":{},"systemd":{}}
END_OF_MASTER_IGNITION

// Ignition config for the compute machines. You should copy the contents of the worker.ign generated by the installer.
compute_ignition = <<END_OF_WORKER_IGNITION

{"ignition":{"config":{"append":[{"source":"https://api-int.ocp.broker.saic.com:22623/config/worker","verification":{}}]},"security":{"tls":{"certificateAuthorities":[{"source":"data:text/plain;charset=utf-8;base64,LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFRENDQWZpZ0F3SUJBZ0lJRk1KZlF4a0lPZVl3RFFZSktvWklodmNOQVFFTEJRQXdKakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1SQXdEZ1lEVlFRREV3ZHliMjkwTFdOaE1CNFhEVEl3TURFeU9URTVNREl3T0ZvWApEVE13TURFeU5qRTVNREl3T0Zvd0pqRVNNQkFHQTFVRUN4TUpiM0JsYm5Ob2FXWjBNUkF3RGdZRFZRUURFd2R5CmIyOTBMV05oTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF1Wm5YbCtTQXlJVDMKUkJWejJwMGpESTcrZHBZL3NyYXQyS0xyTzdMeGd0SUFicHRIRjRSLzhkSytJREhkVnFCeFNWODh5eWorWXBQbApVTElQRGlNUnllZXZNSDMwN3hlT3l5bnJVdWFPZFJTdnY4NXdhSU15eSs4bi9ITko2dDVhRDZWNE1sVmZpOTlCCnl6M1NuMXg3a0FDN0xPcTVZdEVwckd1WE9HM3lYdUxXZjFJM3pOOXhrYXB2ZlBIRlFUa0d0MnlwcURvdmxFdHMKK0M4cjNNcEUzNUt0TVdjeEk0SUJ2TlhEaWRjakw0bXZZZmhyT0hFNlEwQlNXMlErMjlJRmdXWEd1ZWRQZVQ5cwpBNENXSWx3dVBFUkZicDZBWTBlK29vKzR5RmYwUWd0U1dHaWtNZWhNOUJaNmhUd3l3c3VkTG5DRmhGQkZhT2ZDCk1ESmE5dTF5VHdJREFRQUJvMEl3UURBT0JnTlZIUThCQWY4RUJBTUNBcVF3RHdZRFZSMFRBUUgvQkFVd0F3RUIKL3pBZEJnTlZIUTRFRmdRVStKVUdIbHlZeVQwUUxud0FJL1p6TWV6R0xVUXdEUVlKS29aSWh2Y05BUUVMQlFBRApnZ0VCQUVYeUdwKzJBdXllM2YwQnpSaWFxSDdGZ1lkcm0vd3g5UUlGYW4rdGtBclY5dUlGNGVNSndyRCtJZU9oCmlpbFN2TWw3ckVhdFJFVTBOanl3MEdzcm00Sit4U1FUK1ZmK2lTQkZweWI5aGtuL25KTjh4ODQySUU1RGV2Z2cKOWJzTkNsVVV3cVBHbEFpRkVxUWVGSHhTMTg4RTJxbWlkSDFyY01adTlGa2QzdndocnZMY0t0NWowRWlibDJ3RApZNjR2djFTT3BCVXpOdml6NnRDNkxDa1gxckhNb1k4REh3QjJjMW5HMVBVLy9Qc1p3ejlSSzRDdGF2NEdSN0tiCmdFU2lSeEtXN25PTzVCMzJLZUVDWWJKOFlFZlRvMGxrbUt1VWxSamRhRFZBWExLKzhSbkdka2MzKzg4QklMcHkKdE8wdEpkZ05kYjZWYUxnb2lLSGo0NU1qNGlBPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==","verification":{}}]}},"timeouts":{},"version":"2.2.0"},"networkd":{},"passwd":{},"storage":{},"systemd":{}}
END_OF_WORKER_IGNITION

// Set ipam and ipam_token if you want to use the IPAM server to reserve IP
// addresses for the VMs.

// Address or hostname of the IPAM server from which to reserve IP addresses for the cluster machines.
//ipam = "139.178.89.254"

// Token to use to authenticate with the IPAM server.
//ipam_token = "TOKEN_FOR_THE_IPAM_SERVER"


// Set bootstrap_ip, control_plane_ip, and compute_ip if you want to use static
// IPs reserved someone else, rather than the IPAM server.

// The IP address to assign to the bootstrap VM.
bootstrap_ip = "172.25.0.34"

// The IP addresses to assign to the control plane VMs. The length of this list
// must match the value of control_plane_count.
control_plane_ips = ["172.25.0.35","172.25.0.36","172.25.0.37"]

// The IP addresses to assign to the compute VMs. The length of this list must
// match the value of compute_count.
compute_ips = ["172.25.0.38","172.25.0.39","172.25.0.40"]

