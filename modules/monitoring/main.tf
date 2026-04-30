resource "aws_sns_topic" "sns_alarm" {
  name = "sns-alarm-${var.environment_name}"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.sns_alarm.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

resource "aws_cloudwatch_metric_alarm" "alarm_observability" {
  alarm_name                = "alarm-${var.environment_name}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.cpu_threshold
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
  actions_enabled           = true
  alarm_actions             = [aws_sns_topic.sns_alarm.arn]
  dimensions = {
    InstanceId = var.instance_id
  }
}