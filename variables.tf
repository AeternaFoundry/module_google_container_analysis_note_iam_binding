variable "container_analysis_note_iam_bindings" {
  description = <<EOT
Map of container_analysis_note_iam_bindings, attributes below
Required:
    - members
    - note
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    members = set(string)
    note    = string
    role    = string
    project = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

