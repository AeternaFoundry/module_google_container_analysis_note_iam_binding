resource "google_container_analysis_note_iam_binding" "container_analysis_note_iam_bindings" {
  for_each = var.container_analysis_note_iam_bindings

  members = each.value.members
  note    = each.value.note
  role    = each.value.role
  project = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

