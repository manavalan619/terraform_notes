variable "project_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group in which the Network security group should be exist. Changing this forces a new resource to be created."
}
variable "project_name" {
  type        = string
  description = "Project name"
}
variable "env_code" {
  type        = string
  description = "dv, at, hp, p"
  default     = "dv"
}
variable "short_project_name" {
  type        = string
  description = "Short Project name"
}
variable "location_code" {
  type        = string
  description = "Location code for the resource"
  default     = "ne"
}
variable "resource_index" {
  type        = string
  description = "Resource index"
}
variable "resource_depends_on" {
  type    = any
  default = null
}

# ==============================================================================
# NSG - Variables
# ==============================================================================
variable "resource_deploy" {
  type        = bool
  description = "Set to true if resource should be deployed ; set it to false if not ; true is the default value"
  default     = true
}

variable "ansg_security_rules" {
  description = "(Optional) List of objects representing nsg security rules"
  type = list(object({
    name                       = string  // (Required) The name of the security rule.
    description                = string  // (Optional) A description for this rule. Restricted to 140 characters.
    priority                   = number  // (Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule.
    direction                  = string  // (Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound.
    access                     = string  // (Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny.
    protocol                   = string  // Required) Network protocol this rule applies to. Can be Tcp, Udp, Icmp, or * to match all.
    source_port_range          = any     // (Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified.
    destination_port_range     = any     // (Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified.
    source_address_prefix      = any     // (Optional) CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified.
    destination_address_prefix = any     // (Optional) CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if destination_address_prefixes is not specified.
  
  }))
  default = []
}