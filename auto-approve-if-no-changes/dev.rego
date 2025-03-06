package env0

import future.keywords.if
##
# METADATA
# title: Allow if no changes
# description: Approve automatically if the plan has no changes

# Allow deployment if there are no resource changes
allow := ["No changes detected. Approval not required."] if {
  no_changes_detected
}

# Check if all resources have only "no-op" actions
no_changes_detected {
  count([r | r := input.plan.resource_changes[_].change.actions[_]; r != "no-op"]) == 0
}
