resource "aws_ssm_parameter" "prod-flywheel-fetcher-producer-chunks-5a1" {
  arn   = "arn:aws:ssm:us-east-1:094724549126:parameter/prod-flywheel-fetcher-producer-chunks"
  name  = "prod-flywheel-fetcher-producer-chunks"
  type  = "String"
  value = "REDACTED-BY-FIREFLY"
}




resource "aws_lambda_event_source_mapping" "prod-stablefly-kinesis-stream-3b4" {
  batch_size                     = 5
  bisect_batch_on_function_error = false
  destination_config {
    on_failure {
      destination_arn = "arn:aws:sqs:us-east-1:094724549126:prod-stablefly-fetcher-kinesis"
    }
  }
  enabled                       = true
  event_source_arn              = "arn:aws:kinesis:us-east-1:094724549126:stream/prod-stablefly-kinesis-stream"
  function_name                 = "arn:aws:lambda:us-east-1:094724549126:function:prod-stablefly-accumulator"
  maximum_record_age_in_seconds = 300
  parallelization_factor        = 1
  starting_position             = "LATEST"
}

