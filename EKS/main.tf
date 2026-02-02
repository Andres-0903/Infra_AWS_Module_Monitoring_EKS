resource "aws_cloudwatch_metric_alarm" "pod_status_failed" {
  for_each            = var.cluster_name
  alarm_name          = "${var.project}-${var.name_service}-pod_status_failed-${each.key}-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.pod_status_failed_evaluation_periods
  metric_name         = "pod_status_failed"
  namespace           = "ContainerInsights"
  period              = var.pod_status_failed_period
  statistic           = "Sum"
  threshold           = var.pod_status_failed_threshold
  alarm_description   = "Alarm when Pod Status Failed over"

  tags = merge({
    Name = "${var.project}-${var.name_service}-pod_status_failed-${each.key}-${var.environment}"
    }

  )
  dimensions = merge(local.common_dimensions, { ClusterName = each.key })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions
}

resource "aws_cloudwatch_metric_alarm" "node_status_not_ready" {
  for_each            = var.cluster_name
  alarm_name          = "${var.project}-${var.name_service}-node_status_not_ready-${each.key}-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.node_status_not_ready_evaluation_periods
  metric_name         = "node_status_not_ready"
  namespace           = "ContainerInsights"
  period              = var.node_status_not_ready_period
  statistic           = "Average"
  threshold           = var.node_status_not_ready_threshold
  alarm_description   = "Alarm when Node Status Not Ready over"

  tags = merge({
    Name = "${var.project}-${var.name_service}-pod_status_failed-${each.key}-${var.environment}"
    }

  )
  dimensions = merge(local.common_dimensions, { ClusterName = each.key })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

}

resource "aws_cloudwatch_metric_alarm" "node_cpu_utilization" {
  for_each            = var.cluster_name
  alarm_name          = "${var.project}-${var.name_service}-node_cpu_utilization-${each.key}-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.node_cpu_utilization_evaluation_periods
  metric_name         = "NodeCPUUtilization"
  namespace           = "ContainerInsights"
  period              = var.node_cpu_utilization_period
  statistic           = "Average"
  threshold           = var.node_cpu_utilization_threshold
  alarm_description   = "Alarm when Node CPU Utilization over"

  tags = merge({
    Name = "${var.project}-${var.name_service}-node_cpu_utilization-${each.key}-${var.environment}"
    },

  )
  dimensions = merge(local.common_dimensions, { ClusterName = each.key })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

}

resource "aws_cloudwatch_metric_alarm" "node_memory_utilization" {
  for_each            = var.cluster_name
  alarm_name          = "${var.project}-${var.name_service}-node_memory_utilization-${each.key}-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.node_memory_utilization_evaluation_periods
  metric_name         = "node_memory_utilization"
  namespace           = "ContainerInsights"
  period              = var.node_memory_utilization_period
  statistic           = "Average"
  threshold           = var.node_memory_utilization_threshold
  alarm_description   = "Alarm when Node Memory Utilization over"

  tags = merge({
    Name = "${var.project}-${var.name_service}-node_memory_utilization-${each.key}-${var.environment}"
    },

  )
  dimensions = merge(local.common_dimensions, { ClusterName = each.key })

  alarm_actions = local.alarm_actions
  ok_actions    = local.ok_actions

}
