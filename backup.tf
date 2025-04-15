resource "aws_backup_vault" "default" {
  name = local.name_vault
}

resource "aws_backup_plan" "default" {
  name = local.name_backup_plan

  rule {
    rule_name = local.name_backup_plan
    target_vault_name = aws_backup_vault.default.name
    schedule = var.cron

    lifecycle {
      cold_storage_after = var.cold_storage_after
      delete_after = var.delete_after
    }
  }
}

resource "aws_backup_selection" "default" {
  iam_role_arn = var.aws_iam_role_arn
  name = local.name_backup_selection
  plan_id = aws_backup_plan.default.id
  resources = ["*"]

  condition {
    string_equals {
      key   ="aws:ResourceTag/${var.condition_key}" 
      value = var.condition_value
    }
  }
}

resource "aws_backup_vault_notifications" "default" {
  count = var.enable_backup_notifications ? 1 : 0
  backup_vault_name   = local.name_vault
  sns_topic_arn       = var.aws_sns_arn
  backup_vault_events = ["BACKUP_JOB_FAILED", "BACKUP_JOB_EXPIRED", "RESTORE_JOB_FAILED", "COPY_JOB_FAILED", "S3_BACKUP_OBJECT_FAILED", "S3_RESTORE_OBJECT_FAILED"]
}